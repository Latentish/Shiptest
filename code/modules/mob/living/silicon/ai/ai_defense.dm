
/mob/living/silicon/ai/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/aiModule))
		var/obj/item/aiModule/MOD = W
		if(!mind) //A player mind is required for law procs to run antag checks.
			to_chat(user, span_warning("[src] is entirely unresponsive!"))
			return
		MOD.install(laws, user) //Proc includes a success mesage so we don't need another one
		return
	if(W.force && W.damtype != STAMINA && stat != DEAD) //only sparks if real damage is dealt.
		spark_system.start()
	return ..()

/mob/living/silicon/ai/attack_alien(mob/living/carbon/alien/humanoid/M)
	if(!SSticker.HasRoundStarted())
		to_chat(M, "You cannot attack people before the game has started.")
		return
	..()

/mob/living/silicon/ai/attack_slime(mob/living/simple_animal/slime/user)
	return //immune to slimes

/mob/living/silicon/ai/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	disconnect_shell()
	if (prob(30))
		view_core()

/mob/living/silicon/ai/ex_act(severity, target)
	switch(severity)
		if(1)
			gib()
		if(2)
			if (stat != DEAD)
				adjustBruteLoss(60)
				adjustFireLoss(60)
		if(3)
			if (stat != DEAD)
				adjustBruteLoss(30)



/mob/living/silicon/ai/bullet_act(obj/projectile/Proj)
	. = ..(Proj)
	updatehealth()

/mob/living/silicon/ai/flash_act(intensity = 1, override_blindness_check = 0, affect_silicon = 0)
	return // no eyes, no flashing
