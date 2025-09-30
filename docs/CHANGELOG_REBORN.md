# 2025-10-nyaaa
v4.1.0

## Added

## Developer talk
- Merged redundent functions into more generic functions
    - in the main file, adding fixes and kitbashes can be done by inserting each table and merge recursive, respectively
    - made them global to use in `create_attachments.lua`
- Made kitbash creation cleaner
    - split into functions for merge table and full item
    - then call the appropriate one within the `create_an_attachment` function
    - now it's not directly in the main file :)
- Added comments for more functions

# 2025-09-29
v4.0.0

Initial release for the rebuilt version in Discord. Continuing the version count from the old plugin to keep git in order.

## Laying the framework for me to readd parts
for the nerds
- functions for each group of attachments (ex suppressors together)
- functions to add a group of attachments to a weapon (or multiple at once)
- functions to copy over attachments to another weapon
    - used to propagate changes from mark to mark
    - and from family to family (ex ilas --> recon)
- defining the attachment functions globally in separate files
    - slightly worse performance but much cleaner code
    - at startup and it's only a few function calls
    - i'm sure the auto mark propagation is worse than this
    - esp the table search lol
- function to execute a function for a range
    - used to iterate through each mesh
    - ex 8 power sword blades, so script runs it for 7 then the mastery one

## Added
- Suppressors
    - Infantry/Braced/Vigilant Autoguns, Shredder Autopistol, Spearhead Boltgun, Bolt Pistol, Infantry/Helbore/Recon Lasguns
    - Changed the tip of suppressor 5 to not be a colored tip
    - dont use on bolter/boltpistol
- Tactical stocks
    - Infantry/Braced/Vigilant Autoguns, Shredder Autopistol, Spearhead Boltgun, Bolt Pistol, Infantry/Helbore/--- Lasguns
    - unaligned for most things
    - 🥀 
- Flashlight **(new)**
    - Infantry/Braced/Vigilant Autoguns, Shredder Autopistol, Spearhead Boltgun, Bolt Pistol, Infantry/Helbore/Recon Lasguns
    - Green light
- slim blades
    - "Devil's Claw" Swords, Heavy Swords, Dueling Swords, Power Swords, Power Falchions
    - blades from: power sword, devil's claw sword, power falchion **(new)**, heavy sword **(new)**
    - _g variants do not work as intended (won't resize the grip)