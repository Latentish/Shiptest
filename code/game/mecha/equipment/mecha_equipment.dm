//DO NOT ADD MECHA PARTS TO THE GAME WITH THE DEFAULT "SPRITE ME" SPRITE!
//I'm annoyed I even have to tell you this! SPRITE FIRST, then commit.

/obj/item/mecha_parts/mecha_equipment
	name = "exosuit equipment"
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_equip"
	force = 5
	max_integrity = 300
	var/equip_cooldown = 0 // cooldown after use
	var/equip_ready = 1 //whether the equipment is ready for use. (or deactivated/activated for static stuff)
	var/energy_drain = 0
	var/obj/mecha/chassis = null
	///Bitflag. Determines the range of the equipment.
	var/range = MECHA_MELEE
	var/salvageable = 1
	var/detachable = TRUE // Set to FALSE for built-in equipment that cannot be removed
	var/selectable = 1	// Set to 0 for passive equipment such as mining scanner or armor plates
	var/harmful = FALSE //Controls if equipment can be used to attack by a pacifist.
	var/destroy_sound = 'sound/mecha/critdestr.ogg'

/obj/item/mecha_parts/mecha_equipment/proc/update_chassis_page()
	if(chassis)
		send_byjax(chassis.occupant,"exosuit.browser","eq_list",chassis.get_equipment_list())
		send_byjax(chassis.occupant,"exosuit.browser","equipment_menu",chassis.get_equipment_menu(),"dropdowns")
		return 1
	return

/obj/item/mecha_parts/mecha_equipment/proc/update_equip_info()
	if(chassis)
		send_byjax(chassis.occupant,"exosuit.browser","[REF(src)]",get_equip_info())
		return 1
	return

/obj/item/mecha_parts/mecha_equipment/Destroy()
	if(chassis)
		chassis.equipment -= src
		if(chassis.selected == src)
			chassis.selected = null
		src.update_chassis_page()
		log_message("[src] is destroyed.", LOG_MECHA)
		if(chassis.occupant)
			chassis.occupant_message(span_danger("[src] is destroyed!"))
			chassis.occupant.playsound_local(chassis, destroy_sound, 50)
		if(!detachable) //If we're a built-in nondetachable equipment, let's lock up the slot that we were in.
			chassis.max_equip--
		chassis = null
	return ..()

/obj/item/mecha_parts/mecha_equipment/try_attach_part(mob/user, obj/mecha/M)
	if(can_attach(M))
		if(!user.temporarilyRemoveItemFromInventory(src))
			return FALSE
		attach(M)
		user.visible_message(span_notice("[user] attaches [src] to [M]."), span_notice("You attach [src] to [M]."))
		return TRUE
	to_chat(user, span_warning("You are unable to attach [src] to [M]!"))
	return FALSE

/obj/item/mecha_parts/mecha_equipment/proc/get_equip_info()
	if(!chassis)
		return
	var/txt = "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;"
	if(chassis.selected == src)
		txt += "<b>[src.name]</b>"
	else if(selectable)
		txt += "<a href='?src=[REF(chassis)];select_equip=[REF(src)]'>[src.name]</a>"
	else
		txt += "[src.name]"

	return txt

/obj/item/mecha_parts/mecha_equipment/proc/is_ranged()//add a distance restricted equipment. Why not?
	return range&MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/proc/is_melee()
	return range&MECHA_MELEE


/obj/item/mecha_parts/mecha_equipment/proc/action_checks(atom/target)
	if(!target)
		return 0
	if(!chassis)
		return 0
	if(!equip_ready)
		return 0
	if(energy_drain && !chassis.has_charge(energy_drain))
		return 0
	if(chassis.is_currently_ejecting)
		return 0
	if(chassis.equipment_disabled)
		to_chat(chassis.occupant, "<span=warn>Error -- Equipment control unit is unresponsive.</span>")
		return 0
	return 1

/obj/item/mecha_parts/mecha_equipment/proc/action(atom/target)
	return 0

/obj/item/mecha_parts/mecha_equipment/proc/start_cooldown(cooldown_override)
	set_ready_state(FALSE)
	chassis.use_power(energy_drain)
	if(cooldown_override)
		addtimer(CALLBACK(src, PROC_REF(set_ready_state), 1), cooldown_override)
	else
		addtimer(CALLBACK(src, PROC_REF(set_ready_state), 1), equip_cooldown)

/obj/item/mecha_parts/mecha_equipment/proc/do_after_cooldown(atom/target)
	if(!chassis)
		return
	var/C = chassis.loc
	set_ready_state(FALSE)
	chassis.use_power(energy_drain)
	. = do_after(chassis.occupant, equip_cooldown, target=target, extra_checks = CALLBACK(src, PROC_REF(check_do_after), target, C))
	set_ready_state(TRUE)

/obj/item/mecha_parts/mecha_equipment/proc/do_after_mecha(atom/target, delay)
	if(!chassis)
		return
	var/C = chassis.loc
	. = do_after(chassis.occupant, delay, target=target, extra_checks = CALLBACK(src, PROC_REF(check_do_after), target, C))

/obj/item/mecha_parts/mecha_equipment/proc/check_do_after(atom/target, turf/chassis_turf)
	. = TRUE
	if(!chassis || 	chassis.loc != chassis_turf || src != chassis.selected || !(get_dir(chassis, target)&chassis.dir))
		return FALSE

/obj/item/mecha_parts/mecha_equipment/proc/can_attach(obj/mecha/M)
	if(M.equipment.len<M.max_equip)
		return 1

/obj/item/mecha_parts/mecha_equipment/proc/attach(obj/mecha/M)
	M.equipment += src
	chassis = M
	forceMove(M)
	log_message("[src] initialized.", LOG_MECHA)
	update_chassis_page()
	return

/obj/item/mecha_parts/mecha_equipment/proc/detach(atom/moveto=null)
	moveto = moveto || get_turf(chassis)
	if(src.forceMove(moveto))
		chassis.equipment -= src
		if(chassis.selected == src)
			chassis.selected = null
		update_chassis_page()
		log_message("[src] removed from equipment.", LOG_MECHA)
		chassis = null
		set_ready_state(TRUE)
	return


/obj/item/mecha_parts/mecha_equipment/Topic(href,href_list)
	if(href_list["detach"])
		detach()

/obj/item/mecha_parts/mecha_equipment/proc/set_ready_state(state)
	equip_ready = state
	if(chassis)
		send_byjax(chassis.occupant,"exosuit.browser","[REF(src)]",src.get_equip_info())
	return

/obj/item/mecha_parts/mecha_equipment/proc/occupant_message(message)
	if(chassis)
		chassis.occupant_message("[icon2html(src, chassis.occupant)] [message]")
	return

/obj/item/mecha_parts/mecha_equipment/log_message(message, message_type=LOG_GAME, color=null, log_globally)
	if(chassis)
		chassis.log_message("ATTACHMENT: [src] [message]", message_type, color)
	else
		..()


//Used for reloading weapons/tools etc. that use some form of resource
/obj/item/mecha_parts/mecha_equipment/proc/rearm()
	return 0


/obj/item/mecha_parts/mecha_equipment/proc/needs_rearm()
	return 0
