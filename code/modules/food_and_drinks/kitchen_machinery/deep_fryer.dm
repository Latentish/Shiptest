// April 3rd, 2014 marks the day this machine changed the face of the kitchen on NTStation13
// God bless America.
//           ___----------___
//         _--                ----__
//        -                         ---_
//       -___    ____---_              --_
//   __---_ .-_--   _ O _-                -
//  -      -_-       ---                   -
// -   __---------___                       -
// - _----                                  -
//  -     -_                                 _
//  `      _-                                 _
//        _                           _-_  _-_ _
//       _-                   ____    -_  -   --
//       -   _-__   _    __---    -------       -
//      _- _-   -_-- -_--                        _
//      -_-                                       _
//     _-                                          _
//     -

//God bless These Deepfried States o7 -2024

#define DEEPFRYER_COOKTIME 60
#define DEEPFRYER_BURNTIME 120

/obj/machinery/deepfryer
	name = "deep fryer"
	desc = "Deep fried <i>everything</i>."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "fryer_off"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = IDLE_DRAW_LOW
	layer = BELOW_OBJ_LAYER
	var/obj/item/food/deepfryholder/frying //What's being fried RIGHT NOW?
	var/cook_time = 0
	var/oil_use = 0.025 //How much cooking oil is used per tick
	var/fry_speed = 1 //How quickly we fry food
	var/frying_fried //If the object has been fried; used for messages
	var/frying_burnt //If the object has been burnt
	var/static/list/deepfry_blacklisted_items = typecacheof(list(
		/obj/item/screwdriver,
		/obj/item/crowbar,
		/obj/item/wrench,
		/obj/item/wirecutters,
		/obj/item/multitool,
		/obj/item/weldingtool,
		/obj/item/reagent_containers/glass,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/condiment,
		/obj/item/storage,
		/obj/item/smallDelivery,
		)
	)
	var/datum/looping_sound/deep_fryer/fry_loop

/obj/machinery/deepfryer/Initialize()
	. = ..()
	create_reagents(50, OPENCONTAINER)
	reagents.add_reagent(/datum/reagent/consumable/cooking_oil, 25)
	component_parts = list()
	component_parts += new /obj/item/circuitboard/machine/deep_fryer(null)
	component_parts += new /obj/item/stock_parts/micro_laser(null)
	RefreshParts()
	fry_loop = new(list(src), FALSE)

/obj/machinery/deepfryer/Destroy()
	QDEL_NULL(frying)
	QDEL_NULL(fry_loop)
	return ..()

/obj/machinery/deepfryer/RefreshParts()
	var/oil_efficiency
	for(var/obj/item/stock_parts/micro_laser/M in component_parts)
		oil_efficiency += M.rating
	oil_use = initial(oil_use) - (oil_efficiency * 0.00475)
	fry_speed = oil_efficiency

/obj/machinery/deepfryer/examine(mob/user)
	. = ..()
	if(frying)
		. += "You can make out \a [frying] in the oil."
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads: Frying at <b>[fry_speed*100]%</b> speed.<br>Using <b>[oil_use]</b> units of oil per second.")

/obj/machinery/deepfryer/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/pill))
		if(!reagents.total_volume)
			to_chat(user, span_warning("There's nothing to dissolve [I] in!"))
			return
		user.visible_message(span_notice("[user] drops [I] into [src]."), span_notice("You dissolve [I] in [src]."))
		I.reagents.trans_to(src, I.reagents.total_volume, transfered_by = user)
		qdel(I)
		return
	if(!reagents.has_reagent(/datum/reagent/consumable/cooking_oil))
		to_chat(user, span_warning("[src] has no cooking oil to fry with!"))
		return
	if(I.resistance_flags & INDESTRUCTIBLE)
		to_chat(user, span_warning("You don't feel it would be wise to fry [I]..."))
		return
	if(istype(I, /obj/item/food/deepfryholder))
		to_chat(user, span_userdanger("Your cooking skills are not up to the legendary Doublefry technique."))
		return
	if(default_unfasten_wrench(user, I))
		return
	else if(default_deconstruction_screwdriver(user, "fryer_off", "fryer_off" ,I))	//where's the open maint panel icon?!
		return
	else
		if(is_type_in_typecache(I, deepfry_blacklisted_items) || HAS_TRAIT(I, TRAIT_NODROP) || (I.item_flags & (ABSTRACT | DROPDEL)))
			return ..()
		else if(!frying && user.transferItemToLoc(I, src))
			to_chat(user, span_notice("You put [I] into [src]."))
			frying = new/obj/item/food/deepfryholder(src, I)
			icon_state = "fryer_on"
			fry_loop.start()

/obj/machinery/deepfryer/process(seconds_per_tick)
	..()
	var/datum/reagent/consumable/cooking_oil/C = reagents.has_reagent(/datum/reagent/consumable/cooking_oil)
	if(!C)
		return
	reagents.chem_temp = C.fry_temperature
	if(frying)
		reagents.trans_to(frying, oil_use * seconds_per_tick, multiplier = fry_speed * 3) //Fried foods gain more of the reagent thanks to space magic
		cook_time += fry_speed * seconds_per_tick
		if(cook_time >= DEEPFRYER_COOKTIME && !frying_fried)
			frying_fried = TRUE //frying... frying... fried
			playsound(src.loc, 'sound/machines/ding.ogg', 50, TRUE)
			audible_message(span_notice("[src] dings!"))
		else if (cook_time >= DEEPFRYER_BURNTIME && !frying_burnt)
			frying_burnt = TRUE
			visible_message(span_warning("[src] emits an acrid smell!"))


/obj/machinery/deepfryer/attack_ai(mob/user)
	return

/obj/machinery/deepfryer/attack_hand(mob/user)
	if(frying)
		if(frying.loc == src)
			to_chat(user, span_notice("You eject [frying] from [src]."))
			frying.fry(cook_time)
			icon_state = "fryer_off"
			frying.forceMove(drop_location())
			if(Adjacent(user) && !issilicon(user))
				user.put_in_hands(frying)
			frying = null
			cook_time = 0
			frying_fried = FALSE
			frying_burnt = FALSE
			fry_loop.stop()
			return
	else if(user.pulling && user.a_intent == "grab" && iscarbon(user.pulling) && reagents.total_volume)
		if(user.grab_state < GRAB_AGGRESSIVE)
			to_chat(user, span_warning("You need a better grip to do that!"))
			return
		var/mob/living/carbon/C = user.pulling
		user.visible_message(span_danger("[user] dunks [C]'s face in [src]!"))
		reagents.expose(C, TOUCH)
		var/permeability = 1 - C.get_permeability_protection(list(HEAD))
		C.apply_damage(min(30 * permeability, reagents.total_volume), BURN, BODY_ZONE_HEAD)
		reagents.remove_any((reagents.total_volume/2))
		C.Paralyze(60)
		user.changeNext_move(CLICK_CD_MELEE)
	return ..()

#undef DEEPFRYER_COOKTIME
#undef DEEPFRYER_BURNTIME
