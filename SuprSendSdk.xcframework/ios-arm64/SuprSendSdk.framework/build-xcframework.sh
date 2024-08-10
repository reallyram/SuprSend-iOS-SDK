#!/bin/sh

# -------------- config --------------

# Uncomment for debugging
set -x

# Set bash script to exit immediately if any commands fail
set -e

moduleName="SuprSendSdk"

iphoneosArchiveDirectoryPath="/$moduleName-iphoneos.xcarchive"
iphoneosArchiveDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

iphoneosArchiveDirectoryPath="/$moduleName-iphonesimulator.xcarchive"
iphoneosSimulatorDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

outputDirectory="$( pwd; )/$moduleName.xcframework"

workspace="$moduleName.xcworkspace"

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
rm -rf outputDirectory

# Archive
xcodebuild archive -scheme $moduleName \
     -workspace $workspace \
     -archivePath $iphoneosArchiveDirectory \
     -sdk iphoneos \
     -arch arm64 \
     SKIP_INSTALL=NO \
     BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
      
xcodebuild archive -scheme $moduleName \
     -workspace $workspace \
     -archivePath $iphoneosSimulatorDirectory \
     -sdk iphonesimulator \
     SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

## XCFramework
xcodebuild -create-xcframework \
    -framework "$iphoneosArchiveDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -framework "$iphoneosSimulatorDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -output $outputDirectory

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
