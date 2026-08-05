[![NexusLink](https://img.shields.io/badge/Nexus_Mods-gray?logo=nexusmods)](https://www.nexusmods.com/warhammer40kdarktide/mods/429 "Mod page hosted on Nexus Mods")
[![Discord](https://img.shields.io/badge/Darktide_Modders_Discord-7289da?logo=discord&logoColor=7289DA&labelColor=gray&color=7289DA)](https://discord.gg/rKYWtaDx4D "Darktide Modders Discord")
[![DiscordThread](https://img.shields.io/badge/Discord_Thread-7289da?logo=discord)](https://discord.com/channels/1048312349867646996/1356536292891951105 "Thread in the Darktide Modders Discord")
[![ThisPageDirect](https://img.shields.io/badge/This_Page_(Direct)-e8d4b6?logo=github&logoColor=86d37a&labelColor=gray&color=e8d4b6)](https://github.com/Backup158/DarktideWeaponCustomizationOwO/blob/main/docs/README.md "README when displayed directly on the repository.")
[![ThisPagePages](https://img.shields.io/badge/This_Page_(Pages)-e8d4b6?logo=github&logoColor=e18bbc&labelColor=gray&color=e8d4b6)](https://backup158.github.io/DarktideWeaponCustomizationOwO/ "README when displayed on GitHub Pages")
[![PartsAddedDirect](https://custom-icon-badges.demolab.com/badge/Parts_Added_(Direct)-e8d4b6?logo=list&logoSource=feather&logoColor=86d37a&labelColor=gray)](https://github.com/Backup158/DarktideWeaponCustomizationOwO/blob/main/docs/parts_added_reborn.md "Parts Added List when displayed directly on the repository.")
[![PartsAddedPages](https://custom-icon-badges.demolab.com/badge/Parts_Added_(Pages)-e8d4b6?logo=list&logoSource=feather&logoColor=e18bbc&labelColor=gray)](https://backup158.github.io/DarktideWeaponCustomizationOwO/parts_added_reborn "Parts Added List when displayed on GitHub Pages.")
[![ChangelogDirect](https://img.shields.io/badge/Changelog_(Direct)-e8d4b6?logo=readdotcv&logoColor=86d37a&labelColor=gray&color=e8d4b6)](https://github.com/Backup158/DarktideWeaponCustomizationOwO/blob/main/docs/CHANGELOG_REBORN.md "Changelog when displayed directly on the repository.")
[![ChangelogPages](https://img.shields.io/badge/Changelog_(Pages)-e8d4b6?logo=readdotcv&logoColor=e18bbc&labelColor=gray&color=e8d4b6)](https://backup158.github.io/DarktideWeaponCustomizationOwO/CHANGELOG_REBORN "Changelog when displayed on GitHub Pages.")
[![OldReadme](https://img.shields.io/badge/Old_README_(Pages)-e8d4b6?logo=github&logoColor=000000&labelColor=gray&color=e8d4b6)](https://backup158.github.io/DarktideWeaponCustomizationOwO/README_OLD "Old README when displayed on GitHub Pages, for archive purposes")

> [!IMPORTANT]
>
> THIS IS FOR THE REWORKED BASE MOD (`extended_weapon_customization`)
> \
> I had to redo everything from scratch, so there are much fewer parts than before.

# OwO? What is this?
Add-on plugin for the Extended Weapon Customization (EWC) mod. Adds various parts, typically inspired by historical weapons and tacticool airsoft LARP sessions. 

Report alignment issues, and I might fix it if I'm not busy (lying umder blamket ^u^). 

# Installation
## Requirements
1. [MasterItems Community Patch](https://www.nexusmods.com/warhammer40kdarktide/mods/409) by Grasmann
2. Extended Weapon Customization (EWC) by Grasmann. There are multiple ways of getting this file:
  - [Nexus Link](https://www.nexusmods.com/warhammer40kdarktide/mods/277)
  - [The #weapon-customization-mod channel](https://discord.com/channels/1048312349867646996/1168063453416669284) in the [Darktide Modders Discord](https://discord.gg/GFyCGNpJb8) 
    - Download files are in the pins. Search for the latest message from Grasmann. Sometimes, this is a beta release with extra feature.
    - Also be sure to check out the FAQ below in the pins
3. This mod
  - [Nexus link](https://www.nexusmods.com/warhammer40kdarktide/mods/429?tab=files)
  - [GitHub releases](https://github.com/Backup158/DarktideWeaponCustomizationOwO/releases/latest)

Use whatever installation method you prefer. If you don't have one, check out the [DMF Documentation for manual installation](https://dmf-docs.darkti.de/#/installing-mods)

> [!WARNING]
>
> Game updates may cause issues with EWC. They will be fixed whenever EWC is updated. There is no exactly timeline for when that happens, and all we can do is wait.
## Load Order
Load order doesn't matter with rebuilt EWC plugins.

Just make sure you don't use it with the deprecated `weapon_customization`

# Parts Added
This list is hosted externally.  \
&emsp; To see it on GitHub Pages, go [directly to the GitHub Pages list](https://backup158.github.io/DarktideWeaponCustomizationOwO/parts_added_reborn.html)  \
&emsp; To see the regular GitHub Markdown version, go [directly to the repository](parts_added_reborn.md)

# Acknowledgements
Not comprehensive
- grasmann: For the original EWC mod, the Modding Tools utility, sharing a plugin template, and creating the EWC development wiki
- MT607 (Random Account): For making the first major plugin, which I used as a base for the old version of this plugin
- Syndonai: For sharing knowledge and techniques for kitbashing and quirks of EWC
- RinAnarchy: For Chinese (Simplified) localization ["zh-cn"]
- The gun store next to one of my favorite ice cream shops: For letting me see some of these parts in person without going broke
- Random autistic people arguing on forums: For posting pictures of their guns

# FAQ

> [!WARNING]
>
> Anything below is not updated for the rebuild. I'll do that once I'm ready to release on Nexus (it's been 4 months but i'll do it eventually!)

<a id="faq-3"></a>

3) **X attachment is unaligned when used with Y!**
   
&emsp; Yeah that's what happens when I'm lazy. Send a screenshot of the customization menu so I know which combination is messed up, and I'll try and get that fixed. Delivery date depends on bedrotting status.


<a id="faq-6"></a>

6) **When I use the scopes in game, they glitch out and are impossible to aim with!**

&emsp; This is a consequence of the mesh streamer system. You can avoid it by:  \
&emsp;&emsp; a) Increasing the Mesh Quality in the Options menu 
<details>  <summary>Mesh Quality Settings</summary>

![MeshQualitySettings](https://imgur.com/mR2GsjV.png)
</details>
&emsp;&emsp; b) Completely disabling it in `<Darktide>\bundle\application_settings\settings_common.ini`, but this will likely have disastrous consequences for your FPS. See the spoiler for more details.
<details> <summary>Disabling the mesh streamer</summary>
  
The mesh streamer basically makes it so your computer only renders things in high quality if it's close and visible, so it won't use up as many resources on, for example, a Scab Shooter's helmet 70 meters away. Sometimes, it'll set your sights as low priority, so you'll be aiming through a garbled mess throughout the match. This tends to happen more for users with AMD GPUs, which includes me lol.

By disabling it, you guarantee that the game won't eat up your weapons. This also means the game is rendering every detail at full quality, even the small things far away.
  
```
mesh_streamer_settings = {
    disable = true
}
```

![MeshStreamerScopeIssue](https://imgur.com/YbDzrfE.png)
  
##

</details>

<a id="faq-7"></a>

7) **What do you mean by "intended for screenshots" ?**

&emsp; It means I'm mostly concerned with how the weapon looks like when inspecting it. Clipping with animations and during use is not important here. For example, the Elysian grip-stock for the Helbore does not line up with your hands at all, but it's more accurate to one depiction of the Accatran Mk IVe Modified Sniper Lasgun.  \
&emsp; That also means that appearances and accuracy are prioritized over performance. For example, the Masterkey is made of 8 components. There's a few parts I could've taken out, which would've changed it a bit but not enough to matter when it's sitting under your gun. I kept them anyways because I think it looks better when you get up close.
<details>
  <summary>Elysian Drop Troop Weapons</summary>
  
From the Lexicanum, originally sourced from *Imperial Armour Volume 8 - Raid on Kastorel-Novem*, pg. 93

![ElysianWeapons](https://wh40k.lexicanum.com/mediawiki/images/e/e5/Elysian_Drop_Troop_Weapons.jpg)

##
</details>

## FAQ - New Parts

<a id="faq-13"></a>

13) **XYZ part is historically inaccurate!**

&emsp; Yeah could be. My sources mostly start at Wikipedia articles, old forum posts, and random people posting videos themselves shooting things. Everything I made was based on some picture I saw, which may not have necessarily reflected the majority. If you could include some sources for me to throw into my Darktide mod autism folder\* to review later, I'll try and make an attachment like it. Though if it's something like a knob being 2 cm off, you can just edit the mod yourself lol. I made a [guide](https://backup158.github.io/Darktide_EWC_Edits.html) for that.  \
&emsp; Also keep in mind that the way iron sights work on a screen is not how they work in real life. Authentic peep sights are nearly impossible to use in games, even though they work IRL.

<details>
  <summary>*</summary>
&emsp; No joke that's what I call it lmao

&emsp; ![DarktideModAutism](https://imgur.com/cguqJNq.png)
##
</details>

<a id="faq-14"></a>

14) **Can you add XYZ?**

&emsp; Maybe. Leave a picture and the attachment's name in the posts or the Discord thread, and I'll think about it.
Keep in mind that I can only use parts already in the game, and I'm not the most creative person.

![AshleyNVG](https://imgur.com/bRoL8OH.png)

<details>
  <summary>>:3</summary>
  
**What's with the name?**
  
hehe (•̀ω•́ )

**What do you like on your rat ragu and rigatoni?**

Powdered deer penis

**What the hell is your problem?**

&emsp;

**What took so long to release?**

:3c

**No, seriously, you made this page in *November 2024*.**

:3c
Ok but really it's [this](https://en.wikipedia.org/wiki/Perfect_is_the_enemy_of_good). At least now that it's public, I can be held accountable for being a sack of lazy bones.

**What a shitty FAQ. You didn't even answer half the questions.**

:3c

**Why are you having an imaginary argument with yourself through the FAQ? Is this something that should be publicized? I think you should seek therapy instead of... whatever this is.**

:3c

**Requiem patch?**

No

**Does this require Creation Club content?**

No

**Is there BaboDefeat integration, specifically when being used with SLSO? I'm also using MNC and ABC, in case that makes a difference.**

N-no
</details>
