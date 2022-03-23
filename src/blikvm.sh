#!/bin/bash

# Exit on first error. 若指令传回值不等于0，则立即退出shell。
set -e

# Echo commands to stdout.执行指令后，会先显示该指令及所下的参数。 
set -x 

#######################################
# Adds a setting to the YAML settings file, if it's not yet defined.
# Globals:
#   TINYPILOT_SETTINGS_FILE, a path.
# Arguments:
#   Key to define.
#   Value to set.
# Outputs:
#   The line appended to the settings file, if the variable wasn't yet defined.
#######################################
add_setting_if_undefined() {
  local key="$1"
  local value="$2"
  if ! grep --silent "^${key}:" "${TINYPILOT_SETTINGS_FILE}"; then
    echo "${key}: ${value}" | tee --append "${TINYPILOT_SETTINGS_FILE}"
  fi
}
# Define a read-only variable and cannot be re assigned
readonly DEFAULT_TINYPILOT_SETTINGS_FILE="/home/tinypilot/settings.yml"

# if TINYPILOT_INSTALL_VARS 非空(非0），返回0(true)  
if [[ -n "${TINYPILOT_INSTALL_VARS}" ]]; then
  echo "TINYPILOT_INSTALL_VARS is no longer supported." >&2
  echo "Please specify extra settings via the ${DEFAULT_TINYPILOT_SETTINGS_FILE} file." >&2
  exit 255
fi

# Treat undefined environment variables as errors.当执行时使用到未定义过的变量，则显示错误信息。 
set -u 

# Prevent installation on the 64-bit version of Raspberry Pi OS.
# https://github.com/tiny-pilot/tinypilot/issues/929
if [[ "$(uname -m)" == 'aarch64' ]]; then
  echo '64-bit Raspberry Pi OS is not yet supported.' >&2
  echo 'Please use the 32-bit version of Raspberry Pi OS.' >&2
  exit 1
fi

# Create a temporary settings file that will be used throughout this script to
# avoid repeatedly using sudo.
# HACK: If we let mktemp use the default /tmp directory, the system purges the file
# before the end of the script for some reason. We use /var/tmp as a workaround.
readonly TINYPILOT_SETTINGS_FILE="$(mktemp --tmpdir="/var/tmp" --suffix ".yml")"
# Check if there's already a settings file with extra installation settings.
if [[ -f "${DEFAULT_TINYPILOT_SETTINGS_FILE}" ]]; then
  echo "Using settings file at: ${DEFAULT_TINYPILOT_SETTINGS_FILE}"
  sudo cp "${DEFAULT_TINYPILOT_SETTINGS_FILE}" "${TINYPILOT_SETTINGS_FILE}"
else
  echo "No pre-existing settings file found at: ${DEFAULT_TINYPILOT_SETTINGS_FILE}"
fi
readonly EXTRA_VARS_PATH="@${TINYPILOT_SETTINGS_FILE}"

# Set default installation settings
add_setting_if_undefined "ustreamer_port" "8001"
add_setting_if_undefined "ustreamer_persistent" "true"

# Check if this system uses the TC358743 HDMI to CSI capture bridge.
USE_TC358743_DEFAULTS=''
if grep --silent "^ustreamer_capture_device:" "${TINYPILOT_SETTINGS_FILE}"; then
  if grep --silent "^ustreamer_capture_device: tc358743$" "${TINYPILOT_SETTINGS_FILE}"; then
    USE_TC358743_DEFAULTS='y'
  fi
# Only check the existing config file if user has not set
# ustreamer_capture_device install variable.
elif [ -f /home/ustreamer/config.yml ] && grep --silent 'capture_device: "tc358743"' /home/ustreamer/config.yml; then
  USE_TC358743_DEFAULTS='y'
fi

if [[ "$USE_TC358743_DEFAULTS" == 'y' ]]; then
    add_setting_if_undefined "ustreamer_encoder" "omx"
    add_setting_if_undefined "ustreamer_format" "uyvy"
    add_setting_if_undefined "ustreamer_workers" "3"
    add_setting_if_undefined "ustreamer_use_dv_timings" "true"
    add_setting_if_undefined "ustreamer_drop_same_frames" "30"
else
  # If this system does not use a TC358743 capture chip, assume defaults for a
  # MacroSilicon MS2109-based HDMI-to-USB capture dongle.
  add_setting_if_undefined "ustreamer_encoder" "hw"
  add_setting_if_undefined "ustreamer_format" "jpeg"
  add_setting_if_undefined "ustreamer_resolution" "1920x1080"
fi

echo "Final install settings:"
cat "${TINYPILOT_SETTINGS_FILE}"

# Check if the user is accidentally downgrading from TinyPilot Pro.
HAS_PRO_INSTALLED=0

# $0: Shell本身的文件名
# dirname "$0" 返回这个脚本文件放置的目录
SCRIPT_DIR="$(dirname "$0")"
# If they're piping this script in from stdin, guess that TinyPilot is
# in the default location.
if [ "$SCRIPT_DIR" = "." ]; then
  SCRIPT_DIR="/opt/tinypilot"
fi

# Detect TinyPilot Pro if the README file has a TinyPilot Pro header.
TINYPILOT_README="${SCRIPT_DIR}/README.md"
# if [ -f  file ]    如果文件存在
if [ -f "$TINYPILOT_README" ]; then
  if [ "$(head -n 1 $TINYPILOT_README)" = "# TinyPilot Pro" ]; then
    HAS_PRO_INSTALLED=1
  fi
fi

if [ "$HAS_PRO_INSTALLED" = 1 ]; then
  set +u # Don't exit if FORCE_DOWNGRADE is unset.
  if [ "$FORCE_DOWNGRADE" = 1 ]; then
    echo "Downgrading from TinyPilot Pro to TinyPilot Community Edition"
    set -u
  else
    set +x
    printf "You are trying to downgrade from TinyPilot Pro to TinyPilot "
    printf "Community Edition.\n\n"
    printf "You probably want to update to the latest version of TinyPilot "
    printf "Pro instead:\n\n"
    printf "  /opt/tinypilot/scripts/upgrade && sudo reboot\n"
    printf "\n"
    printf "If you *really* want to downgrade to TinyPilot Community Edition, "
    printf "type the following:\n\n"
    printf "  export FORCE_DOWNGRADE=1\n\n"
    printf "And then run your previous command again.\n"
    exit 255
  fi
fi

sudo apt-get update --allow-releaseinfo-change-suite
sudo apt-get install -y \
  git \
  libffi-dev \
  libssl-dev \
  python3-dev \
  python3-venv

INSTALLER_DIR="/opt/tinypilot-updater"
sudo mkdir -p "$INSTALLER_DIR"
# chown 用来更改某个目录或文件的用户名和用户组的
# $(whoami):显示用户名称
sudo chown "$(whoami):$(whoami)" --recursive "$INSTALLER_DIR"
# pushd命令常用于将目录加入到栈中，加入记录到目录栈顶部，并切换到该目录；若pushd命令不加任何参数，则会将位于记录栈最上面的2个目录对换位置
pushd "$INSTALLER_DIR"

# 创建一个虚拟环境，与系统环境进行隔离
python3 -m venv venv
. venv/bin/activate
# Upgrade to a recent version of pip so that we can use binary wheels where
# available instead of building the packages locally.
pip install pip==21.3.1
echo 'ansible==2.9.10
cffi==1.14.4
cryptography==35.0.0
Jinja2==2.11.2
MarkupSafe==1.1.1
pkg-resources==0.0.0
pycparser==2.20
pyOpenSSL==20.0.1
PyYAML==5.3.1
six==1.15.0' > requirements.txt
pip install -r requirements.txt
echo "[defaults]
roles_path = $PWD
interpreter_python = /usr/bin/python3
" > ansible.cfg

TINYPILOT_ROLE_NAME="ansible-role-tinypilot"
# if [ -d ] 查看目录存不存在
if [ -d "$TINYPILOT_ROLE_NAME" ]; then
  pushd "$TINYPILOT_ROLE_NAME"
  git pull origin master
  popd
else
  TINYPILOT_ROLE_REPO="https://github.com/ThomasVon2021/ansible-role-tinypilot"
  git clone "$TINYPILOT_ROLE_REPO" "$TINYPILOT_ROLE_NAME"
fi

ansible-galaxy install \
  --force \
  --role-file "${TINYPILOT_ROLE_NAME}/requirements.yml"

echo "- hosts: localhost
  connection: local
  become: true
  become_method: sudo
  roles:
    - role: $TINYPILOT_ROLE_NAME" > install.yml
ansible-playbook -i localhost, install.yml \
  --extra-vars "${EXTRA_VARS_PATH}"

# Copy the final install settings used in this installation back to the default
# settings location.
chmod +r "${TINYPILOT_SETTINGS_FILE}"
sudo cp "${TINYPILOT_SETTINGS_FILE}" "${DEFAULT_TINYPILOT_SETTINGS_FILE}"
sudo chown tinypilot:tinypilot "${DEFAULT_TINYPILOT_SETTINGS_FILE}"

