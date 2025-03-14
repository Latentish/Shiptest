/obj/mecha/combat
	force = 30
	internals_req_access = list(ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY)
	internal_damage_threshold = 50
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 20, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	mouse_pointer = 'icons/effects/mouse_pointers/mecha_mouse.dmi'
	destruction_sleep_duration = 40
	exit_delay = 40
	repair_multiplier = 0.75

/obj/mecha/combat/restore_equipment()
	mouse_pointer = 'icons/effects/mouse_pointers/mecha_mouse.dmi'
	. = ..()

/obj/mecha/combat/proc/max_ammo() //Max the ammo stored for Nuke Ops mechs, or anyone else that calls this
	for(var/obj/item/I in equipment)
		if(istype(I, /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/))
			var/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/gun = I
			gun.projectiles_cache = gun.projectiles_cache_max
			gun.projectiles = gun.projectiles_max
