#!/usr/bin/env bash

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

# Create plug-ins directory if it doesn't exist
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
if [ ! -d "$plugins_dir" ]; then
    echo "Creating plug-ins directory at $plugins_dir"
	mkdir $plugins_dir
fi

# Copy the IDE Plugin to the plug-ins directory
echo "Copying the IDE Plug-in to the plug-ins directory"
cp -r Plug-ins/Objective-J.ideplugin $plugins_dir

# Get the selected Xcode.app's path
xcode_path=$(xcode-select -p)
xcode_path=$(dirname $xcode_path)

# Get Specifications directory
spec_dir="${xcode_path}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"

# Copy the language specification to the specs directory
echo "Copying the language specificaiton to $spec_dir"
cp Specifications/Objective-J.xclangspec $spec_dir

# Xcode build specs file
#cp Specifications/Objective-J.xcspec $spec_dir

# Get language metadata directory
metadata_dir="${xcode_path}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"

# Copy the source code language plist to the metadata directory
echo "Copying the source code language plist to $metadata_dir"
cp Xcode.SourceCodeLanguage.Objective-J.plist $metadata_dir

defaults read ${xcode_path}/Info DVTPlugInCompatibilityUUID

echo "Please restart Xcode"
