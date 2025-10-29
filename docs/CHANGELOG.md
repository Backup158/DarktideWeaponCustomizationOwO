> [!CAUTION]
> 
> THIS IS THE PAGE FOR THE DEPRECATED WEAPON CUSTOMIZATION
> \
> THIS PAGE IS *ONLY* UP FOR ARCHIVE PURPOSES

# 2025-09-13
v3.5.0

**INCOMPLETE. I LEFT THIS TO WORK ON THE REBUILD**

- Reworked attachments
    - Classic Telescopic Sights
        - PU Scopes now autoequip the German #1 Reticle
    - Classic Crosshair Reticles
        - Custom alignments for Helbore for German #1 Reticle
    - Tactical Foregrips
        - Added to Infantry/Recon Lasguns
        - Magpul AFG reworked to be easier to patch (helpers parented to current type, not current parent)
    - Tactical Flashlights
        - Added to Infantry/Recon Lasguns
    - M16 Carryhandle Sights
        - Universalized fixes (with some tweaks)
            - Fixed parenting for `sightac1` and `sightac2` to simplify fixes across weapons
            - Before, it kept deciding to parent to the receiver
            - Slightly tweaked `sightac4` and `sightac5` to hug the rear sight aperture more evenly without clipping out the side
        - Added to Autopistol
        - Separated long variants
            - Before the "No Rear Elevation Wheel" variant was longer for some reason
        - Renamed "No Rear Elevation Wheel" to "A1"

# 2025-08-20
v3.4.1

Removed Discord mode descriptions

# 2025-08-18
v3.4.0

- **REWORKED HOW SCOPES CHOOSE THEIR RETICLES**
    - Before, it would automatically equip the most appropriate one, with the idea that you could then choose whichever one you want
        - However, `automatic_equip` runs every time something changes (including when the game opens) so your custom choice would get overwritten
        - I've known about this for a while but never found a satisfactory solution 
    - Now you have to choose the reticle yourself
        - If you are using the empty `sight_2` "sight_default" it'll automatically equip the right one
        - If you want to have no reticle, use my "Invisible Sight_2" option instead of "Default," or else it'll get overwritten
- Fixed missing `barrelshroudac` slot declaration for autoguns if not using Syn's edits
    - because of mp5 barrel
- Added attachments:
    - SMG Barrels
        - MP5 MLI Barrel
            - square and more grippy
            - the real one has three picatinny rails but i am NOT doing that lmao
        - MP5 Surefire Light Barrel
            - square with a bulge at the bottom for the flashlight
            - the flashlights do not look good
            - it also clips with every underbarrel weapon
            - but im lazy lol
- Reworked attachments:
    - Underbarrel Grenade Launchers
        - GP-25 on Helbore is now aligned
    - Underbarrel Shotguns
        - M26-MASS trigger was rotated
        - Now it's back to being straight *zaaaap*
    - Classic Telescopic Scopes 
        - Added to Bolter
    - Classic Crosshair Reticles
        - Aligned with PU Scope now (both Helbore and Autogun)
        - Added to Bolter
    - Plasma Mags for Helbores
        - Fixed helpers not being hidden when not used (they were in the wrong slot before)
    - Grip+Stocks for Helbores
        - Fixed some cursed effects that made it a pain to work with (i forgot to add a line lol)
        - No changes from a user perspective
- Renamed MP-5 to MP5 (idc)
- Gave a real name to Classic Crosshair Reticles
        
# 2025-08-13
v3.3.0

- New attachments:
    - Tactical Flashlights: Autopistol, Autoguns
        - MP-5 classic flashlights (big ones that go over the receiver)
            - Use with braced aim 
            - or something like Point Shooting on ADS guns
        - Long Tactical Flashlights
            - only aligned for iags. did not test otherwise
    - Underbarrel Grenade Launchers:
        - M203 HECU Variants (from Half Life 1)
            - Two variants with varying grip looks
    - SMG Barrels:
        - MP-5SD HECU variant
        - just a big handguard
        - maybe the sights are unaligned. The Freeman did not aim down sights with the SMG anyways
    - Suppressors:
        - Slim variants for all 5 I already have
        - Why did I take so long to do this lol
- Reworked attachments:
    - SMG Barrels:
        - MP-5 barrels only move flashlights to the underbarrel if you have no bayonet equipped
        - MP-5 barrels have flashlights on the side by default (smaller and closer to the barrel)
        - MP-5SD suppressor patches have been universalized
        - MP-5SD HECU Combination secret (M203 HECU 1/2 + Suppressor 4/5)
- DEVS ONLY
    - Renamed `create_custom_slot` to `create_named_custom_slot`
    - Created `create_new_helper_slot` function
        - Creates a slot of the given name in `mod.wc.add_custom_attachments` and assigns it to `slot_name_list`
        - not `slot_names` because ac1 and such make it inconsistent

# 2025-08-11
v3.2.0

- Newly supported weapons:
    - Shock Maul: Slim Blades, Invisible Connector, Tacax Spikes, Polearm Heads
    - Arbites Shock Maul: Slim Blades, Invisible Connector, Tacax Spikes, Polearm Heads
- New attachments:
    - SMG Barrels: autopistol and autoguns
        - MP5 barrels
            - MP5 Navy, MP5K, and MP5SD
                - MP5SD doesn't include the integrated suppressor
                - Navy is best with braced receivers on autogun
            - Aligned with MT Autopistol Sights (on autoguns)
            - note that the part of the receiver over the barrel will heat up when you shoot
    - Added to Tactical Stocks
        - Pushed-in telescopic stock
- Refactored attachments:
    - Dreg Gunner Barrel
        - Universalized fixes
        - Changed parents for helpers for modularity and easier patching
- Added info message when enabling discord mode

# 2025-07-31
v3.1.0

- Added attachments
    - Polearms heads: Becs de Corbin expansion
        - Added second half of the crow head
        - Added variants for each of the front heads
        - Resized crow heads to be more spike-like
- Reworked attachments
    - Slim blades: Specifically for Arbitrator shield/mauls
        - Realigned blades vertically
        - Flipped DClaw blades to face forwards
    - Holographic Sights
        - Fixed wonkiness with group indicators being overwritten because of hiding slots
        - Aligned Vortex Razor sights for Exterminator Shotguns
    - Prismatic Sights: Specifical for Exterminator Shotguns
        - Aligned ACOG forwards/backwards when aiming through main sights

# 2025-07-26
v3.0.0

## BREAKING CHANGE(S)

**Reworked how receiver accessory things work.**

Because there is less parts overall (on the technical side), it's should slightly improve performance. Not noticably, but every bit helps with taking down this monster schlong. 

Affects:
- Vertically Challenged (smol) Bolters
    - Old RAW variants are merged into the "Smol but RAW" `receiverac1`
    - Choose any of the regular receivers, then having "Smol but RAW" will shrink those for you
    - Other Smol Bolter variants work as usual
        - Autoequips a base to make invisible
        - Since it can't be the same mesh (and you don't see it), equip the "Bolter 1" receiver (`receiver_01`) by default
        - "Smol Bolter 1" uses another base for the same reason
- Bolt Action Helbore
- Helbore MAS

*ALL affected attachments must be reequipped!* Any patches and fixes will also need to reflect this change.

I should've just done this when I was developing v2.0.0 but I got lazy and just wanted to push it out so I could work on other things. My bad. It will happen again. >:3

Developers only: **Reworked Masterkey sizing and positioning method, so any patches need to be redone**.

Developers only: **Renamed owo_pu_scope function to owo_classic_telescopic_sight**

## OTHER CHANGES
- Newly supported weapons
    - Crusher: Tacax Spike, Polearm heads, Crutches, Invisible Connector, Shafts with low grip
    - Exterminator Shotgun: MT plugin helper sights, Holographic Sights, Prismatic Sights, Suppressors, Tactical Foregrips, Straight Foregrips, Tactical Stocks, Big Stocks!
    - Shock Maul and Suppression Shield: Slim Blades, Invisible Connector
- Added Attachments
    - Standalone Helbore Receiver for Autoguns
        - So you can use the Bolt-action and MAS Receiver Accessories
        - Still has the jank of before
    - Invisible Grip to Autoguns
        - For use with Helbore bodies if you use the stock then realize there's a random grip there
    - [VERY WIP] Slim Slides (Magazine in grip) for Laspistols 
        - Even more jank than the chunky slides
            - Triggers floating
            - Magazine well lights floating
            - Switches on side floating
            - Kill yourself
            - Random magazine is just sitting there where it'd be normally even though the actually equipped magazine was moved to the grip
        - Shorter and less wide
        - Just as with the smol bolters
            - A RAW DAWG variant that straight up shrinks the gun (so sights can't be used) but everything else should work
            - The shroud variants that use the invisible base for usable sights but float off your hands (and need more manual patching)
            - But apparently I can't use the same method as the bolters because noooooo, laspistol receivers just haaave to be special with their nodes im going to shit myself then kick the stool to hang myself
        - Why do I keep adding these they end up scuffed every single time lololololol
    - Added crutches lmfao 
        - For Thunder Hammers
        - Under shoulder and elbow crutches
            - proportions fof for shoulder
    - Added Beaked Pick to Polearms
        - Bec de Corbin variant
        - Uses an actual bird head as the pick
        - CAW CAW MOTHERFUCKERS
- Reworked Attachments (substantial changes only)
    - Underbarrel Shotguns
        - Universalized fixes
        - M-26 MASS helper parts are moved to fit
        - Added additional slot `bayonetac8` for Masterkey to make patches easier
            - Main part (invisible) handles position
            - `bayonetac1` handles size, by making the other helpers its children
        - Removed `owo_underbarrel_shotgun_ac6_02` to reuse the other connector
            - Swapped slots for `owo_underbarrel_shotgun_ac5` and `owo_underbarrel_shotgun_ac6`
            - Realigned connector for M-26 MASS to account for new parent
        - Removed a bunch of patches that were basically unnecessary (minimal changes with lots of checks)
- Removed standalone group indicator slots
    - I did the math, and adding slots creates much more checks than adding more dependencies
    - Mostly due to existing dependencies from other plugins
    - Now only exists if I can tack it to an existing slot
        - that exists on the weapon family already
        - otherwise I'm just making the same mistake lol
    - See Refactored Attachments section
- Refactored Attachments
    - Bistol Shotgun barrels
        - Added indicator groups to `barrelshroudac` for efficiency
        - Resized muzzles to fit over the barrel
    - Tactical Stocks
        - Universalized fixes
        - Added indicator groups to `stockac2` for efficiency
    - Kalashnikov Stocks
        - Universalized fixes to prepare it for other weapons
        - Added indicator groups to `stockac` for efficiency
    - Beeg stocks (Big ^.^ stocks!)
        - Added indicator groups to `stockac` for efficiency
    - Tactical Foregrips
        - Universalized fixes (NOT INCLUDING SHOTGUN) to prepare it for other weapons
    - Straight Foregrips
        - Universalized fixes (NOT INCLUDING SHOTGUN) to prepare it for other weapons
        - Added indicator groups to `foregripac1` for efficiency (*especially* for this one because it turns like 25 checks into 8)
    - Holographic Sights
        - Added indicator groups to `sightac5` for efficiency
        - Fixed missing sight alignment check for vortex razors with no magnifier
    - Bolt Action
        - Variables for fixes to prepare for more variants
    - Smol Bolters
        - Moved indicator groups from `receiver_group_indicator` to `receiverac2`
    - Invisible Connector
        - Moved trinket hook towards shaft
    - Underbarrel Grenade Launchers
        - M203 alignments for autoguns
- Restructure of slot hiding code
    - These are basically the same for all the weapons
    - So I was copypasting a lot of code, which makes it difficult to propagate changes
    - This differs from creation of hide_slot(), because that was more of making it less tedious instead of actually addressing this issue
    - Now I have a file that lists all of the hide_slot options, which gets read by each weapon and accessed by key (slot name)
    - Worse performance on startup but easier to wrangle
        - On my end, the difference at startup is ~00:00:00.003 per file
            - before: ~00:00:00.001
            - after: ~00:00:00.004
            - In total, we'll call that about 60 milliseconds worse
        - This also creates some unnecessary dependency checks for hiding helpers
            - ex: only helbores use `owo_plasma_krieg` in `barrelshroud` but everyone has to check it since i made it universal
            - lowkey i was already doing this out of laziness so it's actually less of a performance hit than it should've been (which isn't really a good thing lol)

# 2025-07-05
v2.1.0

- Affects Developers Only: renamed function for ACOG/SUSAT sights from "Telescopic Sight" to "Prismatic Sight"
    - Just if anyone (likely no one) reused this function for a personal mod, they'd have to rename it
    - The function to add the PU Scope is separate even though it's telescopic too
    - I may expand that into a broader group of classic telescopic sights (since prism sights are a subset of telescopic sights)
- Created crosshairs for `sight_2`
    - Ideally these should be easy enough to position for the various scope bodies (famous last words)
    - If it works, it means I can have even more modular scope pictures, in addition to the mt helpers
    - Added German #1 reticle (from PU Scope)
- Refactored fixes for increased performance
    - Adds a hidden slot I call the "group indicator"
    - This is meant to be used with big groups of fixes to induce a short circuit when those are not equipped, so less work is done (better performance)
        - dependencies check `fuck|load|of|parts` --> `group_indicator, fuck|load|of|parts`
        - if you don't see the indicator, you won't need to check the rest
        - `mod.hide_slot` equips the default one if there's an indicator with none of the associated parts, so it won't unnecessarily check the fuckload afterwards
    - Affected attachments:
        - Vertically Challenged Bolter Receivers
- Reworked Attachments
    - Underbarrel Grenade Launcher fixes
        - Universalized helpers
        - Removed many of the positioning variants for performance (dang I really went ham with those lol)
            - Performance-wise these should be fine since it'll short circuit after the M203 and GP-25 checks, which is basically the same amount of checks as a few ACOG alignments
            - I made these based on barrel parenting, so changing it to receiver parenting means I'd have to recheck it... all (some were already like this so I was just making it consistent)
                - fuck that the M203 is supposed to stay near the magazine anyways (and that's easier on performance)
                - maybe GP-25 alignments can get redone since that has a grip
    - PU Scopes
        - Parented the riser to the scope to make it easier to patch
        - Moved the crosshair to use `sight_2`
    - Vertically Challenged Bolters
        - Renamed to smol bolters because that name was too long
        - Added variants using invisible base with the helper shroud shrinking so I don't have to resize every scope
            - Need to move grips and underbarrels (and barrels but I'm too lazy for the MT plugin parts)
            - Scopes are good as-is
            - Floats off your hands
        - Original ones are still there, with their fucked up scopes
            - I am NOT patching every single scope for this
        - Added Mastery receivers for both variants
- Refactored Suppressors for Combat Shotguns and Stubrevolvers to use universalized helper fixes
- Prepared files for new weapons
    - Arbites Shock Maul, Shock Maul and Suppression Shield, Exterminator Shotgun, and Subductor Shotpistol and Riot Shield

# 2025-06-16
v2.0.1

**KNOWN ISSUE**: Crosshairs are NOT aligned for a vast majority of Holographic Sights and Telescopic Sights (ACOG/SUSAT). I only physically aligned them for this update. Helbores and Revolvers are likely fine.

I started repatching holosights broken by the refactor, and I took the opportunity to clean up some things as I saw them.

Which also led to me finding out that this also unaligned the Telescopic Sights. So I worked on that too.

Haha.

Ha...

- Reworked Holographic Sights
    - Allowed different parents
    - Realigned (physically) Holographic Sights
        - Autoguns, Bolters, Bistols, iLas, Helbores, Recons, CShotguns, Revolvers
        - Probably unaligned the crosshair parts. I'll get back to that later lol (see known issue)
    - Refactored fixes to be more optimized to make up for (unnoticeable) hit from universal fixes, so no real change in the end lol
        - Shifted dependencies for the Alternative Viewmodels checks to allow for faster short circuiting (more efficient for the game)
        - Merged positioning and crosshair alignment fixes, so it won't run the same checks twice
    - Adjusted rails
        - Combat Shotguns
    - Fixed missing side magnifier for short Vortex
- Reworked Telescopic Scopes (ACOG/SUSAT)
    - Allowed different parents
    - Realigned (physically), same as holos
        - Autoguns, Bolters, Bistols, iLas, Helbores, Recons, CShotguns, Revolvers
        - Did not fix crosshair positioning in relation to this (see known issue at top)
    - Refactored fixes to be easier to add to different weapons, with a bit of optimization to make up for the unnoticable yet present performance hit
        - Unified `sight_2` helper positions for all affected weapons, so an ACOG would have consistent reticle sizes across weapons
            - By manually aligning it for each weapon, the reticle sometimes would be further forwards (and smaller) on a certain family
            - So for example, an Autogun with an ACOG may have had a reticle smaller than a Recon Lasgun 
        - Unified lens positioning for all affected weapons
        - Shifted dependencies for the Alternative Viewmodels checks to allow for faster short circuiting (more efficient for the game)
        - Merged positioning and crosshair alignment fixes for efficiency
    - Adjusted rails for some idek but for sure:
        - Combat Shotguns
    - Increased size of front lens for SUSAT so it's more snug (you see less of the brass rim inside)
- Reworked Dreg Gunner Bayonet
    - Added bayonet lugs so they're not floating anymore
    - Restructured shape so it's easier to make patches
- *Actually* made reload callback no longer require Discord mode

# 2025-06-08
v2.0.0

The primary goal of this refactor was to make development easier, mainly by making it easier to copy and paste things (and hopefully to do that less often in the future, enough to make up for the amount I had to do to implement this update lmfao). Unfortunately, this will come with "breaking" changes that require reequipping attachments. Your game will not crash, but it's gonna be annoying. That's enough for me to call it a breaking change, so I bumped the version up to 2.0.0.

While refactoring, I had the chance to notice a few things I could fix. 

**BREAKING CHANGE(S)**: 
- Renamed `owo_rear_sight_ak` to `owo_kalashnikov_rear_sight`, for function AND attachment names.
    - AK Irons
    - Scuffed AK Irons
- Renamed `owo_bayonet` to `owo_historical_bayonet`, for function AND attachment names. 
    - M7 Bayonet
    - Seitengewehr 98
    - Épée Baïonnette 1886

*ALL affected attachments must be reequipped!* Any patches and fixes will also need to reflect this change. 

Why did I do this? Idk I thought it'd be funny :3c. Ok but really though, I just figured I might as well rename them while I'm here because it's been bugging me for months. `rear_sight_ak` made it harder to mass replace. The other was just annoying (wow I'm an ass).

**Other Changes**: 

Added:
- Disk Crossguard (WIP)
    - I started refactoring in the middle of this so it's not done lmfao
    - DClaw, PSword
        - Dclaw just refuses to accept new slots. will be investigated (in 3 years)
- Invisible Muzzles
    - If Syn added it to a gun, I didn't (naively hard coded to affect: Autoguns, Autopistol, Bolter, iLasguns, Helbores, Recons)
    - Bistol, Laspistol

Fixed:
- Fixes for Flat DClaw (G) Blades had a typo that prevented them from being applied

Reworked:
- Lasgun Condoms: Now the same structure as suppressors so making compatibility alignments is easier (and to not affect the scale of the slot's children, namely bayonets)
- Helbore Plasma Mags: Helpers moved to using `owo_magac1` to avoid showing up in the "Magazine Accessories" slot dropdown, for users who use Syn's Edits (slot for the shotgun shell racks I think)

Refactor: 
- Made functions to simplify creating custom slots on the developer side
    - `create_default_attachment`: Creates an empty attachment for the given slot (`owo_<slot_name>_default`)
    - `initialize_custom_slot_for_weapon`: Automatically creates empty table for the slot, then create a default attachment so hiding unused parts has a consistent part to rely on 
        - Removed now-redundant shotgun `foregrip` and `sight_2` part initialization
        - Removed `owo_empty_foregrip()`
        - Adapted the "hide parts fixes" to use these new defaults
        - Removed now-redundant default parts from each attachment creation function
    - `initialize_table_of_custom_slot_for_weapon`: Batch execution `initialize_custom_slot_for_weapon` over all names in the given table, so I don't have to copy paste so much at the top of each weapon file. Because this creates an extra table for each weapon, there is some additional overhead. It was not noticeable to me, so I'm willing to take it in exchange for the ease of development
    - `create_custom_slot`: Creates a new (visible, selectable) slot, then make the localization for it (which is provided when called, so it's easier for translators)
        - All weapons have been migrated to this new system.
    - `hide_slot`: Fills out the hide mesh and auto equip for helper attachments. Needs to be fed the dependencies. Also takes the helper and sends it into fucking space so it won't hog up space when using modding_tools (yes this is a stupid solution but eat my ass lmao), although this might be irrelevant since I'm autoequipping an empty mesh. 
- Remembered how key-value pairs worked in tables (applied this to generic fixes functions to make use of given_type). Accessing and injecting by `["key"]` instead of `[key]`
- Modularized type identity (logic fix for the 'or type')
    - When assigning a value (`=`) and using `a or b`, if `a` is valid, Lua will automatically use its value (short circuiting) to avoid extra calculations
    - Attachments were created with their slot being something like `"barrel" or type` with `type` being a parameter for the function
        - This was probably so you can make it a different type just by passing in a variable, with a default to fall back on
        - Instead, the default was applying every time
    - Affects:
        - Melee
            - Trench Dagger Finger Guards
            - Shovel Handles
            - Historical Blades
        - Ranged
            - Suppressor Muzzles
            - Lasgun Condom Muzzles
            - Muzzle Brake
            - Bolt Pistol Shotgun Barrels
            - Revolver Shotgun Barrels
            - Dreg Gunner Barrels
            - M16 Barrels
            - Wooden Helbore Barrels
            - Plasma Helbore Barrels
            - Heterosexual Foregrips
            - Tactical Foregrips
            - Historical Bayonets
            - Underbarrel Grenade Launchers
            - Underbarrel Shotguns
            - California Bolter Receivers
            - Bolt Action Helbore Receivers
            - Helbore MAS Receivers
            - Laspistol Grip Mag Receivers
            - Fin Grips
            - Helbore Grip Stocks
            - Tactical (Shotgun) Stocks
            - Kalashnikov Stocks
            - Beeg Stocks!
            - Ladder Aperture Sights
            - Kalashnikov Rear Sights
            - M16 Carry Handle Sights
            - Holographic Scopes
            - Telescopic Scopes
            - PU Scopes
            - Flat Magazines
            - Helbore Plasma Magazines
            - Jungle Magazines
            - Magpul Magazines
- Removed Discord Release Mode requirement for reloading fixes

# 2025-05-18
v1.8.1

Hotfix for shotgun rework in Syn's Edits (removal of stock_2 declaration for that mod, so this mod must create it every time)

# 2025-05-17
v1.8.0

Added:
- Tacax spikes to Thunder Hammers and Delver's Pickaxes
- Invisible connector to Thunder Hammers
- Polearm heads to Thunder Hammers and Delver's Pickaxes
- Long Shafts (low grip) to Thunder Hammers
- Long Ogryn Shafts to Delver's Pickaxes

# 2025-05-09
v1.7.3

Added:
- Underbarrel Grenade Launchers to Bolter
- Underbarrel Shotguns to Bolter
- Slim DClaw blades to (formerly) slim Psword blades
- Slim Blades to DClaw
- Suppressors to Bolter and Bistol
- Muzzle Brake to Bolter and Bistol

Refactored fixes code to reduce copy pasted code. Increased overhead but simplifies adding it to new weapons so suffer >:3.

Reworked suppressors to be more like the muzzle brake, so it won't require as many patches

Restored load order rules for AML update (ty icy my savior)

# 2025-04-17
v1.7.2

Added Features:
- Simplified Chinese localization (thanks RinAnarchy!)
- Russian "localization"
- Additional (joke) mod options
    - Debug mode, OwO mode, and Discord Release mode
- Reload callback for EWC 2024-04-08
    - Bundled this into the Discord Release Mode

Fixes:
- Missing point shooting code for Revolver
- Unaligned scope lenses using alternative viewmodels for recon
- Resized slim psword blades because I forgot to actually slim them down 
- Missing attachment slot declarations for people not using Syn's edits

# 2025-04-06
v1.7.1

Added
- Beeg/Straight stocks in stock_2 (shotguns)
- Added Holographic Sights, Telescopic Sights, and Tactical Foregrips (Shotgun)

Fixed missing short eotech z2 housing (4 guns)

Realized a changelog would be a good idea

# 2025-04-05
Migrated documentation to GitHub Pages

# 2025-04-04
v1.7.0

Added 
- Straight grips (shotgun)
- Tactical stocks for stock_2 (shotgun)
- straight foregrips (shotgun)
- Invisible sight_2

Modified recon volleygun scopes to use rails

# 2025-04-03
Created Scopes only version

# 2025-04-02
v1.6.1
Fixed hiding issue with chunky slide

# 2025-04-01
v1.6

Nexus Release
- barrett m82 stock
- helbore plasma rifle barrels

# 2025-03-24
v1.5

added
- vortex razor sight
- spiked tacax for other marks
- muzzle brake

# 2025-03-10
v1.4

variables for fixes!

added:
- slim psword
- small holo
- trench spike
- finger guards

# 2025-03-03
v1.3

added zoom to scopes

added rapier blades

# 2025-02-25
v1.2

Added:
- AK Irons
- Kalash stock
- Gp25
- Alt viewmodels

killed scab gunner stuff

# 2025-02-18
v1.1

Added:
- spiked tacax (1 only)
- shovel pommels
- suppressor 3-5
- angled foregrips
- straight foregrips
- skeletal stock

Migrated to importing functions from the mt plugin

AML Support

"+5 homosexuality" was in the commit history here for whatever reason

# 2025-01-14
v0.14

Added:
- masterkey and mass bayonets

Figured out how to hide things lmao

Migrated to reusing slots from other plugins

# 2024-12-15
v0.13

Added:
- ^^ jungle mags

# 2024-12-08
v0.12

Added:
- SUSAT

alignments and bugfixes

# 2024-12-01
v0.11

Added:
- point shooting holos
- ACOG
- Mas receiver
- flat autogun mag tilted
- mas irons

# 2024-11-24
v0.10

Throughout the week, added:
- Epee baionette
- Bolt Action Helbore Receivers
- Rear Sights for Helbores
- m203 bayonet
- soviet pu scope
- laspistol griplaser
- laspistol chunky slide
- added shotgun barrels for revolver

Adjusted m16 post heights

Investigated custom flashlights 

# 2024-11-18
v0.9

Added Wood Helbore Barrels

Added Seitengewehr bayonet

# 2024-11-17
v0.8

Added Eotech + Magnifier

Added M16 Barrel

# 2024-11-16
v0.7

Added Jungle Mags

# 2024-11-15
v0.6

Figured out primitive helper hiding

# 2024-11-14
v0.5

Added Fin Grips

# 2024-11-13
v0.4

Added California Bolter Receiver

# 2024-11-12
v0.3

Initial Git commit
- Added Dreg Gunner Barrel
- Created before this commit 
    - Suppressors (Helbore)
    - Recon Stock (Helbore)
    - Recon Rear Mag (Helbore)
    - super short shotty (Bistol)