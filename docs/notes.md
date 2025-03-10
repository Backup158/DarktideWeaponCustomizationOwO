# Hide Mesh Values
```
hide_mesh = {
	{"<slot>", <mesh numbers>},
	{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
},
```
There are 15 regions in total, 1-15

| Part                     | Hide Codes             | Notes                                                             |
| ------------------------ | ---------------------- | ----------------------------------------------------------------- |
| Reflex Sight Housing     | `{"sight", 6,7}`       |                                                                   |
| Reflex Sight Reticle     | `{"sight", 1}`         | Sometimes doesn't hide the "glass part" around the reticle        |
| MT Helper Reflex Housing | `{"sight_2", 5,6}`     | 6 hides housing for sight 1<br>5 hides housing for sights 2 and 3 |
| Autogun Irons            | `{"sight", 2,3,4,5,6}` | one of these is the front rail lol                                |

# Parts not showing up?
1. Make sure the weapon file is in `files_to_load.lua`
2. Make sure the parts are declared with something in the main slot
3. Make sure the helper is being auto equipped by the main attachment
4. If a helper part is parented to a part that uses the same mesh, it will not show up
    Avoid this by parenting to the main mesh's parent and just copying the transforms to put them in the same place

# Scope offsets
Set `no_scope_offset` or `scope_offset`, depending on if the attachment's base mesh is in `wc.scopes` table
These transformations move **the gun**. Use Crosshair Remap (Continued) to see the aiming point, then move the gun based on that. See [my Modding Tools cheat sheet](moddingtoolsCheatSheet.png).
position: x, z, y
    +x moves gun to the right
    +y moves gun up
    +z moves gun forwards
rotation: y, x, z
	+x put gun offset to the right
	+y put gun below
# Parts not accept transformations
1. Restart the game
2. Sometimes setting `offset = false` makes it literally freeze on the screen, so it doesn't even rotate with the weapon
3. Can try parenting it to a specific node, with some caveats
    1. We don't have a convenient list of nodes
    2. The node can move during gameplay. Key example being the final bullet of autogun magazines moving up as you shoot.

# Bullet trails getting stolen
This comes from having the main part be a muzzle that matches the actual muzzle that would've been used by the gun
    NEVEFUCKING MIND??!?!? I USED A BRAUTO MUZZLE (in AC2!!!) ON A RECON AND IT STILL STOLE IT?!?!?
It also doesn't even need to match the gun. The autogun muzzles were stealing lasgun shots, and vice versa (SUSAT and Underbarrel GLs, respectively). 

# Adding scopes with zoom
## In Ranged.lua
1. Declare your scope
    1. Use a base mesh that is NOT a muzzle/barrel. This is to reduce the risk of it stealing muzzle flashes.
    2. Make it invisible: 
    ```
        hide_mesh = {
			{"sight", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
		}, 
	```
    For OwO, I used `_item_melee.."/pommels/axe_pommel_01"` to 5. 
	NOTE: Syn already used
        power_sword_grip_02
        power_sword_grip_03
2.  In the attachment declaration's `automatic_equip` table, choose a lens1 and a lens2
	`lens = "scope_lens_02", lens_2 = "scope_lens_2_02"`
3. Append the scope's `attachment.id` to `wc.sights` table
```
	mod.mt.table_append(mod.wc.sights, {
        "owo_holosight_01_01",
    })
```
4. Append base mesh to scope table to affect zoom
```
	mod.mt.table_append(mod.wc.scopes, {
        "axe_pommel_01",
    })
```
5. Set zoom level
	50 zoom is no zoom. Same FOV as hipfire. 40 is around the same as default ADS.
	zoom = ~(40/n magnification)
		ex: 2x mag is (40/2) = 20
    `mod.wc.sniper_zoom_levels.axe_pommel_01 = 15`
## In <weapon_variant>.lua
5. When aligning lenses, add `data = {lens = x}` where x is which lense# it is, lens is lens = 1
6. In scope_offset, lense_transparency = true to hide lenses
	By default, this is set to false
	However, setting it to false doesn't seem to let you not hide lenses. This is actually controlled by the wc.sights table.

# Making Parts follow animations
## When the parent already exists
For the main part (which all the helpers follow):
1. Set `offset = false`. I guess re-parenting is part of the animation process
2. Set parent to the moving part
3. Specify parent_node
For revolver, it would be `offset = false, parent = "barrel", parent_node = 9,`
# Creating a New  Attachment Slot
**In the <common/category>.lua** (if you want to apply it to multiple weapons)
1. First, check if it exists already
	1. If it doesn't, fill up a table for it. Be sure to make the first entry the empty/default one. EWC auto equips the first one for every weapon.
		```
		mod.wc.add_custom_attachments.SLOT = "SLOT_list"
		mod.wc.SLOT_list = {
			"attachment_default",
			"attachment_01",
			"attachment_02",
		}
		```
	2. If it does, find out what the original SLOT_list is called. The base and other plugins tend to call these "**SLOT**s" but sometimes the "s" follows proper grammatical rules, such as with bipods. I don't do this. 
		```
		mod.table_append(mod.wc.SLOT_list, {
			"attachment_01",
		})
		```
	3. To make it a compatibility patch, use `get_mod` to see if the mod exists. Because this returns a bool, you can use it as a condition for an if statement
		```
		if PLUGIN then 
			-- append to table PLUGIN created
		else
			-- create slot
			-- write out your slot's list
		end
		```
2. \[OPTIONAL\] To make it visible, give it a localization. The slot won't show up until you actually add attachments to it. E.g. if you create a BLADEBULGE and declare the slot, but only inject attachments to it for the Chain Axe, only the Chain Axe's customization menu will have options for it.
	```
	table.insert(mod.wc.attachment_slots, "SLOT")
	mod:add_global_localize_strings({
		loc_weapon_cosmetics_customization_SLOT = {
			en = "SLOT NAME",
		},
	})
	```
**In the <weapon_variant>**
3. Check if slot exists for this weapon in particular.
	`grep -Rn "SLOT = {}"` is very helpful here
	1. If it does not exist yet, declare an empty table for it
	   `mod.wc.attachment[this_variant].SLOT = {}`
	2. If it does, don't do anything
	3. You can make a patch as above, but slightly modified
		```
		if not PLUGIN then 
			-- create empty table for slot
		end
		```
4. Inject the attachments and fixes as you wish