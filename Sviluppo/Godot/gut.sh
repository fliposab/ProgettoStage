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
GODOT_VERSION=4.4.1
GODOT_BIN=Godot_v${GODOT_VERSION}_linux_x86_64
GODOT_ZIP=${GODOT_BIN}.zip
GODOT_TEMP=/usr/local/bin/godot
#GODOT_URL=https://github.com/godotengine/godot-builds/releases/download/4.5-beta3/Godot_v4.5-beta3_linux.x86_64.zip

GODOT_URL=https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/${GODOT_ZIP}

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
  GITHUB_WORKSPACE=$PWD
fi

#wget ${GODOT_URL}
# Unzip it
#unzip ${GODOT_ZIP}
#mv ${GODOT_BIN} $GODOT_TEMP
#GODOT_PARAMS="--headless"

curl -s -S ${GODOT_URL} --output ${GODOT_ZIP}
unzip -q ${GODOT_ZIP}

chmod +x ${GODOT_BIN}
./${GODOT_BIN} --headless -d -s --path $GITHUB_WORKSPACE addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexitgit