# OwO? What is this?
Add-on plugin for the Extended Weapon Customization (EWC) mod. Adds various parts, mostly inspired by history (more like history-inspired films and games) and tacticool airsoft guns. Intended mainly for use in screenshots. 

> [!WARNING] 
> Expect alignment issues and performance drops, especially when piled onto a heavy load order. A responsible mod author would spend the time making sure these parts are optimized and are compatibly aligned with all the other pieces. It ain't me.
> 
> I've also noticed hitches when opening the inventory/weapon customization menu and on startup.
> 
> You have been warned!

Because of misaligned sights, I recommend using [Crosshair Remap (Continued)](https://www.nexusmods.com/warhammer40kdarktide/mods/253) as a workaround. Error 2001/2014s when entering the Mourningstar can be kinda avoided by directly accessing the mission board through [Psych Ward](https://www.nexusmods.com/warhammer40kdarktide/mods/89) or some other equivalent, but it won't save you from getting disconnected at the start of a mission. I've only had trouble connecting at the start; once you're in, you're probably in until the end.

Report alignment issues and I might fix it if I'm not busy (lying umder blamket ^u^). 

# Installation
## Requirements
[MasterItems Community Patch](https://www.nexusmods.com/warhammer40kdarktide/mods/409) by Grasmann

[Extended Weapon Customization](https://www.nexusmods.com/warhammer40kdarktide/mods/277) by Grasmann

[MT Weapon Customization Plugin](https://www.nexusmods.com/warhammer40kdarktide/mods/276) by Random Account/MT607

Use whatever installation method you prefer. If you don't have one, check out the [DMF Documentation for manual installation](https://dmf-docs.darkti.de/#/installing-mods)
## Load Order
Place this below weapon customization and above the MT plugin and the Syn's edits plugin. Only the **bolded** files are necessary.

> **﻿weapon_customization**
> 
> for_the_drip
> 
> weapon_customization_no_gun
> 
> **weapon_customization_owo**
> 
> weapon_customization_syn_edits
> 
> **weapon_customization_mt_stuff**

If you don't follow this, ~~I'll tear out your liver~~ the mod will throw a bunch of errors and I will laugh at you for not reading the description. You'll also miss out on the 2 times I aligned something involving the other plugins' parts.
> [!NOTE]
> To AML users: Due to (what I believe to be) limitations with AML, load order can be inconsistent and throw errors. Trying to find a workaround at the moment.

# ***Notices youw pawts*** (Parts I added)

See [parts added page](parts_added.html) (Click this link if you're viewing this through GitHub Pages)

Directly from the repository, [GitHub Markdown version](parts_added.md)

# FAQ
1) **THE GAME STARTED AND I GOT A BUNCH OF ERRORS!**

&emsp; HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA

&emsp; *ahem* Make sure you put this above the MT/Syn plugins. Also make sure you have their latest full releases (just the ones on Nexus). If that doesn't fix it, drop a [console log](https://dmf-docs.darkti.de/#/faqs?id=how-do-i-report-mod-errors) in the posts. I probably messed up in that case so sorry for laughing so hard.

2) **This mod gave me a backend error!**

&emsp; ~~Oh I'll give you a bac~~ You're missing a requirement for EWC

3) **X attachment is unaligned when used with Y!**
   
&emsp; Yeah that's what happens when I'm lazy. Send a screenshot of the customization menu and I'll try and get that fixed eventually. Delivery date depends on rotting status.

4) **The sights don't line up with where I'm shooting!**

&emsp; Send a screenshot of the customization menu and misalignment, and I'll see if it's the same on my end. If I can replicate it, I'll try to fix it. If not, it could be a settings mismatch (see spoiler).
<details>
  <summary>Settings mismatch</summary>
  
First of all, I aligned these sights under specific conditions:  \
&emsp; ﻿I'm using the default FOV but have Weapon FOV set for arbitrary values per weapon >:3  \
&emsp; ﻿I'm using the default reticle size in the EWC mod options  \
&emsp; ﻿I'm using Constant FOV but allow changes from aiming  \
If your settings differ, that's probably causing the issue. From then on, you have two options

1) ﻿﻿For non-physical reticles, remove the reticle and aim using the crosshair from Crosshair Remap. To remove the reticle, open the customization menu and equip one of the following:  \
&emsp; ﻿﻿&emsp; ﻿﻿MT Helper scope (Clear)  \
&emsp; ﻿﻿&emsp; ﻿﻿Invisible sight_2
2) ﻿﻿Align the scope for yourself. I made a [little guide](https://backup158.github.io/Darktide_EWC_Edits.html#AligningSights) for this.
##
</details>

5) **My scope/bayonet is stealing the muzzle flash from my gun!**
   
&emsp; yeah :( I'll fix that eventually  \
&emsp; Oh, and also make sure you aren't using a "No muzzle" option for the muzzle. You need to use "Invisible muzzle" for that (That's part of Syn's plugin. May add that myself for people who don't use that).

6) **When I use the scopes in game, they glitch out and are impossible to aim with!**

&emsp; This is a consequence of the mesh streamer system. You can avoid it by disabling it in `<Darktide>\bundle\application_settings\settings_common.ini` but this will likely have disastrous consequences for your FPS. See the spoiler for more details.
<details>
  <summary>Mesh streamer issues</summary>
  
The mesh streamer basically makes it so your computer only renders things in high quality if it's close and visible, so it won't use up as many resources on, for example, a Scab Shooter's helmet 70 meters away. Sometimes, it'll set your sights as low priority, so you'll be aiming through a garbled mess throughout the match. This tends to happen more for users with AMD GPUs, which includes me lol.

By disabling it, you guarantee that the game won't eat up your weapons. This also means the game is rendering every detail at full quality, even the small things far away.
  
```
﻿mesh_streamer_settings = {
    disable = true
}
```
  
##

</details>

7) **What do you mean by "intended for screenshots" ?**

&emsp; It means I'm mostly concerned with how the weapon looks like when inspecting it. Clipping with animations and during use is not important here. For example, the Elysian grip-stock for the Helbore does not line up with your hands at all, but it's more accurate to one depiction of the Accatran Mk IVe Modified Sniper Lasgun.
<details>
  <summary>Pic</summary>
  
From the Lexicanum, sourced from Imperial Armour vol 3?
##
</details>

8) **How am I supposed to aim with the Alternative Viewmodels if I'm not using the scope?**

&emsp; You use the crosshair, laser, or simply feel it out. To enable crosshair/laser, see the [FAQ in my hidden viewmodels mod](https://www.nexusmods.com/warhammer40kdarktide/mods/461) because I'm too lazy to copy and paste more than I already have.

<details>
  <summary>Going a bit into the technical details here</summary>
  
9) **Why is performance so bad?**

&emsp; EWC runs worse as weapons get more attachment slots. I added a lot of slots for all those accessories, which increases the background processing during matches.

&emsp; Error 2014 comes from your game taking too long to respond to the server; with this plugin, EWC has to spend more time processing the extra slots while loading in, which may or may not be enough of a delay to boot you. Could just be a nocebo effect, but I figured it was worth mentioning anyways (and now I have cursed you >:3).

&emsp; It's not literally unplayable, but caveat emptor.

10) **Ok but can I do anything about this?**

&emsp; Aside from the workarounds I posted in the main description, there's some small things but no silver bullets.
  - Disable raytracing in your user_settings.config file. There's a bit more options there even when you turn it off through the in-game menu. Just don't touch rtxgi_scale.
  - Turn off Visible Equipment in the EWC mod options
  - For out of memory crashes, apply the lua heap memory increase band-aid fix (--lua-heap-mb-size 2048 in the Steam launch options)
  - If you crash at the end of missions, try setting locked packages to 'Always' in the EWC mod options (which will make performance worse but hopefully lessen crashes). Didn't help with disconnects but YMMV.

11) **Why does this require the MT plugin?**
  
&emsp; MT's plugin includes functions that make creating parts from multiple pieces much easier. I used them.

12) **Why does this need to be above the other two plugins?**

&emsp; I piggybacked off of some of the slots they already added to lessen the performance hit. The way parts get added to slots means that if the mod is lower in the load order than the mod that adds the slots, it either just won't work or will wipe out the parts added by the original slot creator. Also the alignments I mentioned earlier.

##
</details>

13) **XYZ part is historically inaccurate!**

&emsp; Yeah could be. My sources mostly start at Wikipedia articles, old forum posts, and random people posting videos themselves shooting things. Everything I made was based on some picture I saw, which may not have necessarily reflected the majority. If you could include some sources for me to throw into my Darktide mod autism folder to review later, I'll try and make an attachment like it. Though if it's something like a knob being 2 cm off, you can just edit the mod yourself lol. I made a [guide](https://backup158.github.io/Darktide_EWC_Edits.html) for that.

14) **Can you add XYZ?**

&emsp; Maybe. Leave a picture and the attachment's name in the posts or the Discord thread, and I'll think about it.
Keep in mind that I can only use parts already in the game, and I'm not the most creative person.


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

**No, seriously, you made this page in November 2024.**

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
