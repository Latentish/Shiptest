

//Creates a throwing star
/obj/item/clothing/suit/space/space_ninja/proc/ninjastar()
	if(!ninjacost(10))
		var/mob/living/carbon/human/H = affecting
		var/obj/item/throwing_star/ninja/N = new(H)
		if(H.put_in_hands(N))
			to_chat(H, span_notice("A throwing star has been created in your hand!"))
		else
			qdel(N)


/obj/item/throwing_star/ninja
	name = "ninja throwing star"
	throwforce = 30
	embedding = list("pain_mult" = 6, "embed_chance" = 100, "fall_chance" = 0, "embed_chance_turf_mod" = 15)
