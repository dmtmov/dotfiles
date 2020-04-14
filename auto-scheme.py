#!/usr/bin/env python3.7

import iterm2
import os


async def main(connection):
    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()

            # Themes have space-delimited attributes, one of which will be light or dark.
            parts = theme.split(" ")
            if "dark" in parts:
                preset = await iterm2.ColorPreset.async_get(connection, "Solarized Dark")
                os.system("pushd /Users/d/Library/Application\ Support/Sublime\ Text\ 3/Packages/User; sed 's/light/dark/' ./Preferences.sublime-settings > settings_new; mv settings_new ./Preferences.sublime-settings; popd;")
                
            else:
                preset = await iterm2.ColorPreset.async_get(connection, "Solarized Light")
                os.system("pushd /Users/d/Library/Application\ Support/Sublime\ Text\ 3/Packages/User; sed 's/dark/light/' ./Preferences.sublime-settings > settings_new; mv settings_new ./Preferences.sublime-settings; popd;")

            # Update the list of all profiles and iterate over them.
            profiles=await iterm2.PartialProfile.async_query(connection)
            for partial in profiles:
                # Fetch the full profile and then set the color preset in it.
                profile = await partial.async_get_full_profile()
                await profile.async_set_color_preset(preset)

iterm2.run_until_complete(main)
