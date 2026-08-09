# Extended Weapon Customization Informational Page
Extended Weapon Customization (EWC) is a mod for *Warhammer 40,000: Darktide* that allows you swap parts on your weapons, with support for community-added kitbashed parts. It being such an ambitious project naturally leads to having a few confusing aspects and known issues/quirks. This page serves as an officially unofficial FAQ for common issues and solutions for this mod. 

Most of the contents of this page are pinned in the Discord thread\*; this is a mirror link for easy sharing.

\*Most discussion happens in the [Darktide Modders Discord](https://discord.gg/GFyCGNpJb8). Check the [#weapon-customization-mod channel](https://discord.com/channels/1048312349867646996/1168063453416669284)

# Table of Contents
- [Installation](#installation)
- [Links to Addon Plugins](#addon-plugins)
- [FAQ](#faq)

<a id="installation">

# Installation</a>
This mod is installed like any other mod. See the [Darktide Modding Community's Guide for Manual Mod Installation](https://dmf-docs.darkti.de/#/installing-mods) if you don't already know how to do so.

To use this mod specifically, there are three files you need to install.
1. [MasterItems Community Patch](https://www.nexusmods.com/warhammer40kdarktide/mods/409)
2. [Visual Loadout Customization Community Patch](https://www.nexusmods.com/warhammer40kdarktide/mods/853)
3. Extended Weapon Customization. The mod can be found on:
  - [NexusMods.com](https://www.nexusmods.com/warhammer40kdarktide/mods/277)
  - Pinned in the [Discord channel](https://discord.com/channels/1048312349867646996/1168063453416669284) mentioned earlier. The pinned version is sometimes a potentially-unstable release with beta features.
There are two important things to note for load order
- The two patches need to load before EWC.
- The two patches need to load early in the load order. Some mods, if loaded before the patches, will prevent them from working.

<a id="addon-plugins">

# Links to Addon Plugins</a>
General, place these *after* `extended_weapon_customization`. Defer to the plugins if they have more specific instructions.

- [EWC Base Additions](https://www.nexusmods.com/warhammer40kdarktide/mods/277) by Grasmann
  - On the Nexus page of EWC, in the "Optional Files" section. Put this one before the other add-on plugins in the load order.
  - Adds parts across different weapon types. Notably contains reflex sights, laser sights, and flaming sword blades.
- *The Syndonai Edits* (Syn's Edits) by Syndonai: 
  - Discord only. See the pins in the Discord chat.
  - Contains many sci-fi and 40k parts. Generally just does everything.
- *MOAR DAKKA!* by MarcathRoosevelt
  - Discord only. See the pins in the Discord chat.
  - Adds heretic weapon skins, machine gun parts to autoguns, and fisting. Most parts are for Ogryn.
- [*Ostracized without Objection*](https://www.nexusmods.com/warhammer40kdarktide/mods/429) (OwO) by me
  - Mainly real-world attachments
- [*Empty Sights*](https://github.com/Backup158/DarktideWeaponCustomizationEmptySights/releases/latest) by me
  - Reflex sights from base additions, but without the reticle.
- [*Hidden Viewmodels While Aiming*](https://www.nexusmods.com/warhammer40kdarktide/mods/461) by me
  - Moving the gun off the screen when you aim.
- [*xsScythes*](https://www.nexusmods.com/warhammer40kdarktide/mods/918) by xsSplater
  - Scythes for Psyker staves

<a id="load-order">

## Load Order</a>
The recommended load order is as follows:
```
master_item_community_patch
visual_loadout_customization_community_patch
extended_weapon_customization_no_gun
extended_weapon_customization
extended_weapon_customization_base_additions
extended_weapon_customization_owo
extended_weapon_customization_syn_edits
extended_weapon_customization_more_dakka
extended_weapon_customization_empty_scopes
```
You don't have to use every add-on plugin. The list just includes most of the common ones.

Load EWC before `GoToMastery` and `enhanced_character_selection`. Do NOT use with `DumpStatFinder`.

<a id="faq">

# EWC FAQ</a>

<a id="faq-1">

## 1. What files are for EWC? What are the other files in the pins?</a>
`extended_weapon_customization` and the 2 patches are all that is *required* for functionality. `extended_weapon_customization_base_additions` (EWC BA) provides additional options. The pinned versions of these are usually test versions which may have experimental fixes and functionality. The versions on Nexus (see [Installation](#installation)) are the latest stable versions.

`visible_equipment` is a completely standalone mod to show weapons on the body. It used to be part of `weapon_customization`, but has grown to be split into its own mod. You can find it on [Nexus](https://www.nexusmods.com/warhammer40kdarktide/mods/852).

`pure_cinema` is a completely standalone mod to allow dropped enemy weapons to fire and to visually swap enemy weapons. It was mostly a "for fun" thing so it's not as granular as a fully-released mod, so keep that mind.


<a id="faq-2">

## 2. Are there compatibility issues?</a>
Yes. Load EWC before `GoToMastery` and `enhanced_character_selection`. Do NOT use with `DumpStatFinder`.


<a id="faq-3">

## 3. Can I use the old plugins still?</a>
No. All add-on plugins need to be completely remade for EWC, which will take a looong time. The MT Plugin is planned to be updated eventually, with no ETA. Syn's Edits and OwO have WIP versions pinned in the Discord chat.

Basically, anything named `weapon_customization_xxx` will NOT work. The new mods have adopted the naming convention of `extended_weapon_customization_xxx`.


<a id="faq-4">

## 4. Where can I get scopes for my gun?</a>
EWC BA and Syn's Edits include scopes.


<a id="faq-5">

## 5. Can I transfer my customized weapons from the old `weapon_customization` to EWC?</a>
Unfortunately not, even after the plugins are rebuilt. A converter won't be possible for technical reasons.


<a id="faq-6">

## 6. How do I customize weapons?</a>
Open the inventory and select your weapon, then click the "Customize" button (left half of the attached picture). This will bring up a menu where you can select attachments to equip. Click the attachment on the left panel (right half of the attached picture), then click the "Equip" button on the bottom right.
![CustomizeWeapons_CustomizeButton](/assets/images/ewc_faq_customize1.png)
![CustomizeWeapons_SelectAttachment](/assets/images/ewc_faq_customize2.png)

If there is no "Customize" button or you see a `"loc_weapon_inventory_tip_1": string not found` text upon customizing, go into Mod Options -> Toggle Mods -> make sure EWC is enabled


<a id="faq-7">

## 7. What do the buttons at the top do?</a>
Some attachments, when equipped, provide additional features. These buttons allow you to toggle these features, if applicable.
- _Damage Type_: (Bayonet Icon) Changes attack sounds, weapon trails, and/or gibbing effects
- _Crosshair_: Forces a custom crosshair
- _Alternate Fire_: Forces ADS view or braced view
You can click the button to disable it, turning it red.


<a id="faq-8">

## 8. How do I use the flashlights?</a>
On weapons without flashlights in the base game, flashlights use the Interact button (the one for using Medicae stations, picking up ammo, etc.). Press it while aiming down sights, or quickly double tap it. These behaviors (and the reminder message in chat) can be toggled in the Mod Options.

Otherwise, flashlights can be used as usual, with the Special Action button.


<a id="faq-9"></a>

## 9. Why aren't colors saving when I paint weapons?
It saves internally, but the changes may not show up right after painting.

People have had luck with applying colors before loading into the Mourningstar, using a mod such as [Psych Ward](https://www.nexusmods.com/warhammer40kdarktide/mods/89). Otherwise, try swapping weapon loadouts while in the Psykhanium or playing a match.

Also make sure that the slot you selected is the correct one, in case you're actually trying to paint a bayonet or whatever ([FAQ 10](#faq-10)).


<a id="faq-10">

## 10. I tried coloring a part, and other parts got the same color!</a>
Whenever a part is colored, all parts attached to its slot as a child inherit that color. The child can then be colored separately without propagating to the parent.
This color inheritance goes down the chain. Normally, the receiver is the root of all parts, so coloring the receiver will color pretty much everything.

For example, you could color a barrel purple, which will make the muzzle purple too. You can then go to the muzzle, then color it yellow.

<a id="faq-11">

## 11. Weapon damage is doubled in the Psykhanium.</a>
It’s a side effect of the damage type feature. It only affects offline matches, not online matches, so you won’t be banned.

Unfortunately, there is no workaround. You can only disable the mod temporarily whenever you want to test breakpoints (Mod Options --> Toggle Mods --> Extended Weapon Customization).

<a id="faq-12">

## 12. My crosshair is gone!</a>
It's a bug with scopes added by plugins. The ones that zoom in make the crosshair disappear until you die. The plugins cannot fix this, and there is no ETA on it being fixed in the main mod.


<a id="faq-13">

## 13. I can't upgrade weapons with Hadron: "Cannot complete operation"</a>
Close the menu then open it again. This happens with the base game but gets worse with this mod. Reopening the menu lets the game catch a breath, and usually lets you keep going afterwards.

Using [Psych Ward](https://www.nexusmods.com/warhammer40kdarktide/mods/89) helps, like in [FAQ 9](#faq-9). When you're doing things before loading into the Mourningstar, there's less things happening in the background.


<a id="faq-14">

## 14. The Hive Scum dual weapons are missing VFX for the left gun.</a>
This is a known issue. it happens regardless if you have equipped any customized parts. There is no ETA on the fix.

![Dual autopistols with one vfx](/assets/images/ewc_faq_dual_pistol_vfx.png)

<a id="faq-15">

## 15. The game is crashing when I hover over some parts.</a>
Go to Mod Options --> Extended Weapon Customization --> Disable the Randomization options

Typically, the crash message looks something like this: `[Script Error]: scripts/managers/ui/ui_unit_spawner.lua:83: Unit not found #ID[b0db5a12576cdaaf]`

Why does this help? Nobody knows but it usually works :D Praise the Omnissiah