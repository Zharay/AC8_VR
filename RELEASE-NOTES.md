# AC8-VR_Zharay_v0.3.5

This ZIP contains the complete AC8-VR profile for a clean install.

## What changed

- Fix for UI and cutscene z-fighting (flicker) by moving the masked OpenXR layer forward by 20mm. Affects hangar menus (aircraft tree/selection), mission briefings, subtitles, and cutscenes (2D and 3D)
- Added immersive scene presentation settings and camera management. Disables the restrictive cinematic masking on cutscenes and menus while providing savable camera positions for hangar menus.
- Resized masks to compensate for the change in UI size
- Moved UEVR settings out of `Script UI` and into `AC8 VR Setup`
- Cleaned up AI wordiness, renamed certain settings, and added tooltips to better explain what they do.
- Moved "Flight UI Canvas Size" and "Cockpit size" out of aircraft presets and put them into HUD layout
- Moved legacy Ladder UI into its own collapsible section and to the bottom of the menu
- Re-arranged per aircraft HUD menus below the default menus that contain save buttons
- Added a checkbox to to hide global/for all plane save buttons depending on current settings

## Install

1. Close the game and back up your existing AceCombat8 profile, if you have one.
2. Move the old AceCombat8 folder out of %APPDATA%\UnrealVRMod, then extract AC8-VR_Zharay_v0.3.5.zip there. The ZIP includes the full profile and fresh default settings.
3. Use OpenXR and Native Stereo in UEVR, enable plugins, and inject again. See INSTALLATION.md for the full setup instructions.

Use the scripts included in this release if you previously installed temporary test scripts. Keep your backup if you want to restore your saved cockpit and HUD preferences later.

Restart the game and reinject UEVR after changing game or UEVR render resolution.
