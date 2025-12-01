# 2025-11-30
v4.3.0

## Added
- Flashlights 
    - Added to:
        - Flamer
        - Plasma Gun
        - Combat Shotgun
        - Double-Barreled Shotgun
        - Exterminator Shotgun
        - Subductor Shotpistol and Riot Shield
        - Grenadier Gauntlet
        - Ripper Guns
        - Twin-Linked Heavy Stubbers
        - Heavy Stubbers
        - Rumbler/Kickback
    - also with the changes to how slots work, they fuckin FLOAT
- Small underbarrel flashlights ("Flashlight (Under)")
    - Added to:
        - Subductor Shotpistol and Riot Shield
        - Quickdraw Stubrevolvers
    - Half sized and sits under barrel
    - doesn't actually turn on bc that's just how the original mod works
    - also with the changes to how slots work, they fuckin FLOAT
- Suppressors
    - Added to:
        - Combat Shotgun
        - Exterminator Shotgun
        - Subductor Shotpistol and Riot Shield
        - Ripper Guns
        - ~~Heavy Stubbers~~
            - nvm this drove me insane
        - Rumbler/Kickback
            - works when reloading :D
    - Variants
        - Wrapped Suppressor
            - a metal suppressor wrapped in a bandage
- Slim Blades:
    - Added to:
        - Arbites Shock Maul
        - Shock Maul and Supression Shield
        - Shock Maul
    - Note: Blades are reversed on these new weapons
        - I'm working on the fixes for these. It'd be simple enough to brute force it, but I'm working on a more robust solution
    - Using with invisible connectors may lead to weirdness at the base
        - These blades were not all designed to be used as standalones
        - This is the same as when used on the non-maul weapons. just that the connector usually covers it up (at the cost of clipping)
- Invisible Connectors:
    - Added to:
        - Arbites Shock Maul
        - Shock Maul and Supression Shield
        - Shock Maul
- **Damage Types**: Slashing
    - Used in slim blades
    - Matches what the source weapon uses (e.g. Slim Power Sword blades use the damage type from Power Swords)
    - Does not change sounds atm
- Mod options to toggle randomization
    - Toggling flashlights

---
# 2025-10-29
v4.2.0

## Added
- Suppressors and Flashlights to Revolvers
    - I forgor
    - Note: PBS-1 still has the stupid clipping
- Localizations and groups for Suppressors
    - in the months that i had the suppressors, i never really settled on a name for them
    - i still havent settled :D
    - but at least they're not just 1-5 now
        - double cans
        - PBS-1
        - heavy metal
- Flashlights [WIP]
    - None of these work LMAO
    - MP5 flashlights (2)
        - goes on the sight rail
    - Big Tactical Light
        - like a regular flashlight you hold in your hand, but on the gun (oooo)

## Fixed
- Alignments for Slim Blades
    - attachment points did not use `ap_body_01`. it's all blade, regardless of slot name
    - this still means the blades with builtin hilts (such as psword) will be too high. am working on that

## Refactors/Developer Talk
- Reworked helpers to be full items
    - for:
        - Suppressors
        - Tactical Stocks
        - Iron Sights
        - Flashlights
    - because when they aren't, there may be weirdness with the game trying to use them as something they're not (ex bullets getting hidden)
    - also meant fixes might apply to them when they weren't supposed to
- Reworked single kitbashes (no children) to full items
    - for:
        - Slim Blades
    - also helps prevent wonkiness with fixes, since it overwrites

---
# 2025-10-07
v4.1.0

## Added
- Flashlight
    - Variants for each flashlight model per color
    - Added a bunch of colors: green, red, blue, cyan, magenta, yellow, pink
    - Added 4 variants for size and stuff
        - narrow: what I used last time for `owo_flashlight_green_01`
        - narrow cool: same but lower color temperature
        - weak: wider and shorter beam, with cooler temperature
        - default: copying the default flashlight template, so just color is different
    - this makes 180 flashlights :3
    - good luck babe
- Slim Blades
    - made available on relic blade, force sword, and force greatsword
    - blades from relic blade, force sword, and force greatsword
    - short variants for relic/fgs
    - they sit too low. fix comes later
- [WIP] Iron sights
    - on: autoguns
    - ak irons
    - shape is alright, but the sights dont work lol
- [WIP] Magazines
    - on: autoguns
    - ak extended mag
    - it just doesn't fucking work lmao

## Fixed
- Aligned tactical stocks for bolter
    - sizd up and moved to back
    - still dont try on helbores
- Logic error when looping over all models
    - Used break instead of continue (and lua doesn't have continue)
    - So i'd lose all the models after the first one i wanted to skip
    - fixing this restored from 3 psword blades to 6 psword blades (index 7), not counting mastery
        - 7 models to use, skip #4
        - break meant only 1-3 were added
        - now it's 1-3, 5-7
- wonky fix interaction between merge tables and suppressors
    - suppressors would get the fixes meant for merge tables???
    - eg suppressor (empty base) with folded under stock
        - stock would be in default position, as if i didnt do anything to it
        - suppressor would get the rotation/scaling from it
    - fixed by using the base unit version

## Developer talk
- Decided how to add fixes
    - each weapon has its own file in the `fixes` folder
        - all it does is return the fixes
        - then the main file reads all those (right before copying to sibling marks) and adds them in
            - requires me to maintain the list of the weapons in the fixes folder, but idc
            - automatically detecting files int he folder is very resource intensive, and this only risks me forgetting to add something during testing
    - this means the fixes given per attachment are the universal fixes
        - technically we cant do universal fixes like that
        - it has to be put under each weapon
        - but that means i'd need more effort when it comes to making custom fixes
            - cant just insert because the order they get applied in may not be consistent
            - i have the custom fixes overwrite them if the requirements match exactly
    - I prefer it this way because i like having the kitbash and attachments defined in the same file
        - there's overhead from having to process and skip values, but i find the headache annoying enough when swapping between two files
        - also it's not like this is noticeable
- Merged redundent functions into more generic functions
    - in the main file, adding fixes and kitbashes can be done by inserting each table and merge recursive, respectively
    - made them global into `generic_helpers.lua` to be used in `create_attachments.lua`
- Made kitbash creation cleaner
    - split into functions for merge table and full item
    - then call the appropriate one within the `create_an_attachment` function
    - now it's not directly in the main file :)
- Added comments for more functions
- refactored suppressor creation to copypaste less code

---
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