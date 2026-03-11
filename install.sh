#!/bin/bash

# ==============================
# Pi-Apps AMD64 Patched Installer
# Crostini / Debian/Ubuntu x86_64
# ==============================

function error {
  echo -e "\e[91m$1\e[39m"
  exit 1
}

cd "$HOME"

# Ensure non-root
if [[ "$(id -u)" == 0 ]]; then
  error "Pi-Apps is not designed to be installed as root! Run as regular user."
fi

# Ensure apt exists
command -v apt >/dev/null || error "apt not found. Must be Debian/Ubuntu based Linux."

# Skip ARM CPU check
echo "Skipping ARM CPU check, continuing on amd64..."

sudo apt update || error "sudo apt update failed"

# -----------------------
# Install dependencies
# -----------------------
package_available_installer() {
  local package="$(awk -F: '{print $1}' <<<"$1")"
  dpkg_arch="$(dpkg --print-architecture)"
  [ -z "$package" ] && error "package_available(): no package name specified!"
  local output="$(apt-cache policy "$package":"$dpkg_arch" | grep "Candidate:")"
  if [ -z "$output" ]; then
    return 1
  elif echo "$output" | grep -q "Candidate: (none)"; then
    return 1
  else
    return 0
  fi
}

if package_available_installer software-properties-common ; then
  dependencies='yad curl wget aria2 lsb-release software-properties-common apt-utils apt-transport-https gnupg imagemagick bc librsvg2-bin locales shellcheck git wmctrl xdotool x11-utils rsync unzip debsums libgtk3-perl bzip2'
else
  dependencies='yad curl wget aria2 lsb-release apt-utils apt-transport-https gnupg imagemagick bc librsvg2-bin locales shellcheck git wmctrl xdotool x11-utils rsync unzip debsums libgtk3-perl bzip2'
fi

if ! dpkg -s $dependencies &>/dev/null ;then
  sudo apt install $dependencies -y -f --no-install-recommends || error "Dependencies failed to install."
fi

sudo rm -f /usr/share/applications/yad-icon-browser.desktop

# -----------------------
# Download Pi-Apps
# -----------------------
DIRECTORY="$HOME/pi-apps"
downloaded=0

if [ -d "$DIRECTORY" ];then
  echo "Reinstalling Pi-Apps..."
  downloaded=1
  rm -rf ~/pi-apps-forced-update
  output="$(git clone --depth 1 https://github.com/Botspot/pi-apps ~/pi-apps-forced-update 2>&1)"
  if [ $? != 0 ]; then
    error "Pi-Apps download failed!\ngit clone output was: $output"
  fi
  cp -af "${DIRECTORY}/data" ~/pi-apps-forced-update
  cp -af "${DIRECTORY}/apps" ~/pi-apps-forced-update
  rm -rf "$DIRECTORY"
  mv -f ~/pi-apps-forced-update "$DIRECTORY"
else
  echo "Downloading Pi-Apps..."
  downloaded=1
  output="$(git clone --depth 1 https://github.com/Botspot/pi-apps "$DIRECTORY" 2>&1)"
  if [ $? != 0 ]; then
    error "Pi-Apps download failed!\ngit clone output was: $output"
  fi
  "${DIRECTORY}/api" shlink_link script install
fi

# -----------------------
# ChromeOS terminal fix
# -----------------------
if command -v garcon-terminal-handler >/dev/null ;then
  echo "Installing lxterminal for ChromeOS..."
  sleep 5
  sudo apt install -yf lxterminal || echo "Failed to install lxterminal"
fi

# -----------------------
# Create menu and desktop
# -----------------------
mkdir -p ~/.local/share/applications
echo "[Desktop Entry]
Name=Pi-Apps
Comment=Raspberry Pi App Store (AMD64 Patched)
Exec=${DIRECTORY}/gui
Icon=${DIRECTORY}/icons/logo.png
Terminal=false
StartupWMClass=Pi-Apps
Type=Application
Categories=Utility;System;PackageManager;
StartupNotify=true" > ~/.local/share/applications/pi-apps.desktop
chmod 755 ~/.local/share/applications/pi-apps.desktop
gio set ~/.local/share/applications/pi-apps.desktop "metadata::trusted" true

mkdir -p ~/Desktop
cp -f ~/.local/share/applications/pi-apps.desktop ~/Desktop/
chmod 755 ~/Desktop/pi-apps.desktop
gio set ~/Desktop/pi-apps.desktop "metadata::trusted" true

# -----------------------
# Icons
# -----------------------
mkdir -p ~/.local/share/icons
cp -f ${DIRECTORY}/icons/logo.png ~/.local/share/icons/pi-apps.png
cp -f ${DIRECTORY}/icons/settings.png ~/.local/share/icons/pi-apps-settings.png

# -----------------------
# Settings menu
# -----------------------
echo "[Desktop Entry]
Name=Pi-Apps Settings
Comment=Configure Pi-Apps or create an App
Exec=${DIRECTORY}/settings
Icon=${DIRECTORY}/icons/settings.png
Terminal=false
StartupWMClass=Pi-Apps-Settings
Type=Application
Categories=Settings;
StartupNotify=true" > ~/.local/share/applications/pi-apps-settings.desktop

# -----------------------
# Autostart updater
# -----------------------
mkdir -p ~/.config/autostart
echo "[Desktop Entry]
Name=Pi-Apps Updater
Exec=${DIRECTORY}/updater onboot
Icon=${DIRECTORY}/icons/logo.png
Terminal=false
StartupWMClass=Pi-Apps
Type=Application
X-GNOME-Autostart-enabled=true
Hidden=false
NoDisplay=false" > ~/.config/autostart/pi-apps-updater.desktop

# -----------------------
# Preload folders
# -----------------------
mkdir -p "${DIRECTORY}/data/status" "${DIRECTORY}/data/update-status" \
  "${DIRECTORY}/data/preload" "${DIRECTORY}/data/settings" \
  "${DIRECTORY}/data/categories"

# -----------------------
# Terminal command
# -----------------------
if [ ! -f /usr/local/bin/pi-apps ] || ! cat /usr/local/bin/pi-apps | grep -q "${DIRECTORY}/gui" ;then
  echo "#!/bin/bash
${DIRECTORY}/gui"' "$@"' | sudo tee /usr/local/bin/pi-apps >/dev/null
  sudo chmod +x /usr/local/bin/pi-apps
fi

# -----------------------
# Preload app list and runonce
# -----------------------
if [ ! -f "$DIRECTORY/data/preload/LIST-" ];then
  echo "Preloading app list..."
fi
"${DIRECTORY}/preload" yad &>/dev/null
"${DIRECTORY}/etc/runonce-entries" &>/dev/null

# -----------------------
# Announcements
# -----------------------
if [ ! -f "${DIRECTORY}/data/announcements" ] || [ ! -z "$(find "${DIRECTORY}/data/announcements" -mtime +1 -print)" ]; then
  wget https://raw.githubusercontent.com/Botspot/pi-apps-announcements/main/message -qO "${DIRECTORY}/data/announcements"
fi

# -----------------------
# Finished
# -----------------------
if [ $downloaded == 1 ];then
  echo "Installation complete. Pi-Apps AMD64 patched. Launch from menu or 'pi-apps' command."
else
  echo "Pi-Apps already installed."
fi
