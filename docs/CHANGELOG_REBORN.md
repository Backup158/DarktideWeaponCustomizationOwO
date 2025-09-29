# 2025-09-UNRELEASED
v4.0.0

Initial release for the rebuilt version in Discord. Continuing the version count from the old plugin to keep git in order.

## Laying the framework for me to readd parts
for the nerds
- functions for each group of attachments (ex suppressors together)
- functions to add a group of attachments to a weapon (or multiple at once)
- functions to copy over attachments to another weapon
    - used to propagate changes from mark to mark
    - and from family to family (ex ilas --> recon)
- defining the attachment functions globally in another file
    - worse performance but cleaner code
    - at startup and it's only a few function calls
    - i'm sure the auto mark propagation is worse than this
    - esp the table search lol

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