## Simple installation

You can install TinyPilot on a compatible Raspberry Pi in just two commands.

```bash
  sudo bash blikvm.sh
  sudo reboot
```

The installation process:

* Creates a service account for TinyPilot with limited priviliges.
* Installs TinyPilot as a systemd service so it runs automatically on every boot.
* Installs and configures TinyPilot's dependencies:
  * nginx, which listens on 0.0.0.0:80
  * uStreamer, which listens on 127.0.0.1:8001
* Installs TinyPilot to the `/opt/tinypilot` directory.

When your Pi reboots, you should be able to access TinyPilot by visiting your Pi hostname in the browser. For example, if your device is named `raspberrypi`:

* [http://raspberrypi/](http://raspberrypi/)

### Example: TC358743 HDMI to CSI capture chip

If you're using a [Toshiba TC358743-based HDMI capture chip](https://github.com/mtlynch/tinypilot/wiki/HDMI-Capture-Devices#toshiba-tc358743-capture-devices), the following installation options optimize performance with that chip:

1. Add the installation options to your TinyPilot `settings.yml` file:

```bash
TINYPILOT_SETTINGS="/home/tinypilot/settings.yml" && \
  sudo useradd --create-home --system --user-group tinypilot && \
  echo 'ustreamer_capture_device: tc358743' | sudo tee -a "${TINYPILOT_SETTINGS}" && \
  sudo chown tinypilot:tinypilot "${TINYPILOT_SETTINGS}"
```

2. Run the `quick-install` script:

```bash
  sudo bash blikvm.sh
  sudo reboot
```
