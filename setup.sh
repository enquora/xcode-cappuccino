#!/usr/bin/env sh

# For Xcode 11 and above

###################
# DEFINITIONS
###################

service='Xcode'
plugins_dir=~/Library/Developer/Xcode/Plug-ins

###################
# SHUT DOWN XCODE IF IT'S RUNNING
###################

if pgrep -xq -- "${service}"; then
  echo "Xcode is running. Attempt to shut down? y/n"
  read answer
  if [ "$answer" = "y" ]; then
    echo "Shutting down Xcode"
    pkill -x $service
  else
    echo "Xcode needs to be closed"
    exit 1
  fi
fi

set -x

# Get the selected Xcode.app's path
# We may, in the future, simply update the compatibility UUID if plugin is installed already.
xcode_path=$(xcode-select -p)
xcode_path=$(dirname $xcode_path)

defaults read ${xcode_path}/Info DVTPlugInCompatibilityUUID

# Create plug-ins directory if it doesn't exist
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
if [ ! -d "$plugins_dir" ]; then
    echo "Creating plug-ins directory at $plugins_dir"
	mkdir $plugins_dir
fi

# Copy the IDE Plugin to the plug-ins directory
echo "Copying the IDE Plug-in to the plug-ins directory"
cp -r Plug-ins/Objective-J.ideplugin $plugins_dir

# Create Specifications directory if it doesn't exist
specifications_dir=~/Library/Developer/Xcode/Specifications/
if [ ! -d "$specifications_dir" ]; then
    echo "Creating specifications directory at $specifications_dir"
	mkdir $specifications_dir
fi

# Copy the IDE Plugin to the plug-ins directory
echo "Copying the language specification to the specifications directory"
cp -r Specifications/Objective-J.xclangspec $specifications_dir

echo "Please restart Xcode"
