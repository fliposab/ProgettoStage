#!/usr/bin/env bash

echo "  ▄████  █    ██ ▄▄▄█████▓   ▄▄▄█████▓▓█████   ██████ ▄▄▄█████▓  ██████ ";
echo " ██▒ ▀█▒ ██  ▓██▒▓  ██▒ ▓▒   ▓  ██▒ ▓▒▓█   ▀ ▒██    ▒ ▓  ██▒ ▓▒▒██    ▒ ";
echo "▒██░▄▄▄░▓██  ▒██░▒ ▓██░ ▒░   ▒ ▓██░ ▒░▒███   ░ ▓██▄   ▒ ▓██░ ▒░░ ▓██▄   ";
echo "░▓█  ██▓▓▓█  ░██░░ ▓██▓ ░    ░ ▓██▓ ░ ▒▓█  ▄   ▒   ██▒░ ▓██▓ ░   ▒   ██▒";
echo "░▒▓███▀▒▒▒█████▓   ▒██▒ ░      ▒██▒ ░ ░▒████▒▒██████▒▒  ▒██▒ ░ ▒██████▒▒";
echo " ░▒   ▒ ░▒▓▒ ▒ ▒   ▒ ░░        ▒ ░░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░   ▒ ▒▓▒ ▒ ░";
echo "  ░   ░ ░░▒░ ░ ░     ░           ░     ░ ░  ░░ ░▒  ░ ░    ░    ░ ░▒  ░ ░";
echo "░ ░   ░  ░░░ ░ ░   ░           ░         ░   ░  ░  ░    ░      ░  ░  ░  ";
echo "      ░    ░                             ░  ░      ░                 ░  ";
echo "                                                                        ";


LANG="en_US.utf8"
GODOT_VERSION=4.5-beta3
GODOT_BIN=Godot_v${GODOT_VERSION}_linux.x86_64
GODOT_ZIP=${GODOT_BIN}.zip
GODOT_TEMP=/usr/local/bin/godot
#GODOT_URL=https://github.com/godotengine/godot-builds/releases/download/4.5-beta3/Godot_v4.5-beta3_linux.x86_64.zip
#stable url = https://github.com/godotengine/godot/releases/download/4.4.1-stable/Godot_v4.4.1-stable_linux.x86_64.zip
GODOT_URL=https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/${GODOT_ZIP}

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
  GITHUB_WORKSPACE=$PWD
fi

curl -L -s -S ${GODOT_URL} --output ${GODOT_ZIP}

if ! file "${GODOT_ZIP}" | grep -q 'Zip archive data'; then
  echo "Download failed or file is not a zip archive. Check GODOT_URL: $GODOT_URL"
  exit 1
fi

unzip -q ${GODOT_ZIP}

chmod +x ${GODOT_BIN}

./${GODOT_BIN} -d -s --headless --path $GITHUB_WORKSPACE addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexitgit