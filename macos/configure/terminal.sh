#!/usr/bin/env bash

if [ -d /tmp/osx-terminal.app-colors-solarized ]; then
  git -C /tmp/osx-terminal.app-colors-solarized pull
else
  git clone https://github.com/designgrill/osx-terminal.app-colors-solarized.git /tmp/osx-terminal.app-colors-solarized
fi

# You could also use "Solarized Light" instead of "Solarized Dark" below
osascript <<EOD

tell application "Terminal"

	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "Solarized Dark"

	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window

	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '/tmp/osx-terminal.app-colors-solarized/" & themeName & ".terminal'"

	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1

	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName

	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window

	repeat with windowID in allOpenedWindows

		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)

		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if

	end repeat

end tell

EOD

# Set the new bash as the default shell (or change it to be fish)
echo "Changing your default shell to be fish"
chsh -s /usr/local/bin/fish
