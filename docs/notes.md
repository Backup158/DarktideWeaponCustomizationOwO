# Hide Mesh Values
There are 15 regions in total, 1-15
Reflex Sight Housing            {"sight", 6,7}
Reflex Sight Reticle            {"sight", 1}
MT Helper Reflex Housing        {"sight_2", 5,6}      6 hides housing for sight 1, 5 hides sights 2 and 3
Autogun Irons                   {"sight", 2,3,4,5,6} -- one of these is the front rail lol

# Parts not showing up?
1. Make sure the weapon file is in files_to_load
2. Make sure the parts are declared with something in the main slot
3. Make sure the helper is being auto equipped by the main attachment
4. If a helper part is parented to a part that uses the same mesh, it will not show up
    Avoid this by parenting to the main mesh's parent and just copying the transforms to put them in the same place

# Scope offsets
no_scope_offset and scope_offset
position: x, z, y
    +x moves gun to the right
    +y moves gun up
rotation: y, x, z
    +x put gun offset to the right
    +y put gun below

# Parts not accept transformations
sometimes setting 'offset = false' makes it literally freeze on the screen, so it doesn't even rotate with the weapon
can try parenting it to a specific node, but that can cause issues
    1 we dont have a list of nodes
    2 the node can move during gameplay

# Bullet trails getting stolen
This comes from having the main part be a muzzle that matches the actual muzzle that would've been used by the gun

# MT to base
**Autoguns** autogun_p1_m1.lua
*IAG*
iagun_barrel_01|iagun_barrel_02|iagun_barrel_03|iagun_barrel_04|iagun_barrel_05|iagun_barrel_06|-----
barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06|barrel_21
*Brauto*
bagun_barrel_01|bagun_barrel_02|bagun_barrel_03|bagun_barrel_04|bagun_barrel_05|bagun_barrel_06|bagun_barrel_07|bagun_barrel_08|-----
barrel_07|barrel_08|barrel_09|barrel_10|barrel_13|barrel_14|barrel_18|barrel_19|barrel_20
*Headhunter*
hagun_barrel_01|hagun_barrel_02|hagun_barrel_03|hagun_barrel_04|-----
barrel_11|barrel_12|barrel_15|barrel_16|barrel_22
**Lasguns** common_lasgun.lua
*iLas*
ilasgun_barrel_01|ilasgun_barrel_02|ilasgun_barrel_03|ilasgun_barrel_04|ilasgun_barrel_05|ilasgun_barrel_06|ilasgun_barrel_07|ilasgun_barrel_08|----
barrel_01|barrel_02|barrel_03|barrel_04|barrel_05|barrel_06|barrel_07|barrel_08|barrel_21
*Helbore*
hlasgun_barrel_01|hlasgun_barrel_02|hlasgun_barrel_03|hlasgun_barrel_04|hlasgun_barrel_05|----|----|----
    hlasgun_barrel_05 has a variant hlasgun_barrel_05b
barrel_09|barrel_10|barrel_11|barrel_12|barrel_13|barrel_19|barrel_20|barrel_22
*Recon*
rlasgun_barrel_01|rlasgun_barrel_02|rlasgun_barrel_03|rlasgun_barrel_04|rlasgun_barrel_05
barrel_14|barrel_15|barrel_16|barrel_17|barrel_18