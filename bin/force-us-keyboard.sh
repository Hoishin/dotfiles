#/usr/bin/env bash
defaults read com.apple.HIToolbox AppleSelectedInputSources | grep 'U.S.' >/dev/null || automator ~/force-us-keyboard.app >/dev/null
