//Not only meat, actually, but also snacks that are almost meat, such as fish meat or tofu


////////////////////////////////////////////FISH////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/cubancarp
	name = "\improper Cuban carp"
	desc = "A grifftastic sandwich that burns your tongue and then leaves it numb!"
	icon_state = "cubancarp"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 4)
	bitesize = 3
	filling_color = "#CD853F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/capsaicin = 1)
	tastes = list("fish" = 4, "batter" = 1, "hot peppers" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/fishmeat
	name = "fish fillet"
	desc = "A fillet of fish meat."
	icon_state = "fishfillet"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2)
	bitesize = 6
	filling_color = "#FA8072"
	tastes = list("fish" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/fishmeat/Initialize()
	. = ..()
	eatverb = pick("bite","chew","gnaw","swallow","chomp")

/obj/item/reagent_containers/food/snacks/fishmeat/moonfish
	name = "moonfish fillet"
	desc = "A fillet of moonfish."
	icon_state = "moonfish_fillet"

/obj/item/reagent_containers/food/snacks/fishmeat/gunner_jellyfish
	name = "filleted gunner jellyfish"
	desc = "A gunner jellyfish with the stingers removed. Mildly hallucinogenic."
	icon_state = "jellyfish_fillet"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/toxin/mindbreaker = 2)

/obj/item/reagent_containers/food/snacks/fishmeat/armorfish
	name = "cleaned armorfish"
	desc = "An armorfish with its guts and shell removed, ready for use in cooking."
	icon_state = "armorfish_fillet"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

/obj/item/reagent_containers/food/snacks/fishmeat/donkfish
	name = "donkfillet"
	desc = "The dreaded donkfish fillet. No sane spaceman would eat this, and it does not get better when cooked."
	icon_state = "donkfillet"
	list_reagents = list(/datum/reagent/yuck = 3)

/obj/item/reagent_containers/food/snacks/fishmeat/carp
	name = "carp fillet"
	desc = "A fillet of spess carp meat."
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/toxin/carpotoxin = 2, /datum/reagent/consumable/nutriment/vitamin = 2)

/obj/item/reagent_containers/food/snacks/fishmeat/carp/imitation
	name = "imitation carp fillet"
	desc = "Almost just like the real thing, kinda."

/obj/item/reagent_containers/food/snacks/fishfingers
	name = "fish fingers"
	desc = "A finger of fish."
	icon_state = "fishfingers"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	bitesize = 1
	filling_color = "#CD853F"
	tastes = list("fish" = 1, "breadcrumbs" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/fishandchips
	name = "fish and chips"
	desc = "I do say so myself chap."
	icon_state = "fishandchips"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	filling_color = "#FA8072"
	tastes = list("fish" = 1, "chips" = 1)
	foodtype = MEAT | VEGETABLES | FRIED

/obj/item/reagent_containers/food/snacks/vegetariansushiroll
	name = "vegetarian sushi roll"
	desc = "A roll of simple vegetarian sushi with rice, carrots, and potatoes. Sliceable into pieces!"
	icon_state = "vegan-sushi-roll"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	filling_color = "#7daa70"
	tastes = list("boiled rice" = 4, "carrots" = 2, "potato" = 2)
	foodtype = VEGETABLES
	slice_path = /obj/item/reagent_containers/food/snacks/vegetariansushislice
	slices_num = 4

/obj/item/reagent_containers/food/snacks/vegetariansushislice
	name = "vegetarian sushi slice"
	desc = "A slice of simple vegetarian sushi with rice, carrots, and potatoes."
	icon_state = "vegan-sushi-slice"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#7daa70"
	tastes = list("boiled rice" = 4, "carrots" = 2, "potato" = 2)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/spicyfiletsushiroll
	name = "spicy filet sushi roll"
	desc = "A roll of tasty, spicy sushi made with fish and vegetables. Sliceable into pieces!"
	icon_state = "spicy-sushi-roll"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/nutriment/vitamin = 4)
	filling_color = "#d8b02c"
	tastes = list("boiled rice" = 4, "fish" = 2, "spicyness" = 2)
	foodtype = VEGETABLES | MEAT
	slice_path = /obj/item/reagent_containers/food/snacks/spicyfiletsushislice
	slices_num = 4

/obj/item/reagent_containers/food/snacks/spicyfiletsushislice
	name = "spicy filet sushi slice"
	desc = "A slice of tasty, spicy sushi made with fish and vegetables. Don't eat it too fast!."
	icon_state = "spicy-sushi-slice"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#d8b02c"
	tastes = list("boiled rice" = 4, "fish" = 2, "spicyness" = 2)
	foodtype = VEGETABLES | MEAT

/obj/item/reagent_containers/food/snacks/onigiri
	name = "onigiri"
	desc = "A ball of cooked rice surrounding a filling formed into a triangular shape and wrapped in seaweed."
	icon_state = "onigiri"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#d3ceba"
	tastes = list("rice" = 1, "dried seaweed" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/fishi
	name = "Fi-shi roll"
	desc = "An entire fish, surrounded by a thick layer of seaweed. is this... edible?"
	icon_state = "fi-shi"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/toxin/carpotoxin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 18, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/toxin/carpotoxin = 8)
	filling_color = "#eac57b"
	tastes = list("raw fish" = 6, "dried seaweed" = 3)
	foodtype = VEGETABLES | MEAT

/obj/item/reagent_containers/food/snacks/nigiri_sushi
	name = "nigiri sushi"
	desc = "A simple nigiri of fish atop a packed rice ball with a seaweed wrapping and a side of soy sauce."
	icon_state = "nigiri_sushi"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 6)
	filling_color = "#d3ceba"
	tastes = list("boiled rice" = 2, "fish filet" = 2, "soy sauce" = 2, "dried seaweed" = 1)
	foodtype = VEGETABLES | MEAT

////////////////////////////////////////////MEATS AND ALIKE////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/tofu
	name = "tofu"
	desc = "We all love tofu."
	icon_state = "tofu"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	filling_color = "#F0E68C"
	tastes = list("tofu" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/tofu/prison
	name = "soggy tofu"
	desc = "You refuse to eat this strange bean curd."
	tastes = list("sour, rotten water" = 1)
	foodtype = GROSS

/obj/item/reagent_containers/food/snacks/spiderleg
	name = "spider leg"
	desc = "A still twitching leg of a giant spider... you don't really want to eat this, do you?"
	icon_state = "spiderleg"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin = 2)
	cooked_type = /obj/item/reagent_containers/food/snacks/boiledspiderleg
	filling_color = "#000000"
	tastes = list("cobwebs" = 1)
	foodtype = MEAT | TOXIC

/obj/item/reagent_containers/food/snacks/cornedbeef
	name = "corned beef and cabbage"
	desc = "A nice hearty meal."
	icon_state = "cornedbeef"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("meat" = 1, "cabbage" = 1)
	foodtype = MEAT | VEGETABLES

/obj/item/reagent_containers/food/snacks/bearsteak
	name = "Filet migrawr"
	desc = "Because eating bear wasn't manly enough."
	icon_state = "bearsteak"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/ethanol/manly_dorf = 5)
	tastes = list("meat" = 1, "salmon" = 1)
	foodtype = MEAT | ALCOHOL

/obj/item/reagent_containers/food/snacks/meatball
	name = "meatball"
	desc = "A great meal all round. Not a cord of wood."
	icon_state = "meatball"
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#800000"
	tastes = list("meat" = 1)
	foodtype = MEAT
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_SMALL

/obj/item/reagent_containers/food/snacks/sausage
	name = "sausage"
	desc = "A piece of mixed, long meat."
	icon_state = "sausage"
	filling_color = "#CD5C5C"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("meat" = 1)
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/salami
	foodtype = MEAT | BREAKFAST
	/*food_flags = FOOD_FINGER_FOOD*/
	var/roasted = FALSE

/obj/item/reagent_containers/food/snacks/sausage/Initialize()
	. = ..()
	eatverb = pick("bite","chew","nibble","gobble","chomp")

/obj/item/reagent_containers/food/snacks/salami
	name = "salami"
	desc = "A slice of cured salami."
	icon_state = "salami"
	filling_color = "#CD4122"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("meat" = 1, "smoke" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/rawkhinkali
	name = "raw khinkali"
	desc = "One hundred khinkalis? Do I look like a pig?"
	icon_state = "khinkali"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/garlic = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/khinkali
	tastes = list("meat" = 1, "onions" = 1, "garlic" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/khinkali
	name = "khinkali"
	desc = "One hundred khinkalis? Do I look like a pig?"
	icon_state = "khinkali"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/garlic = 1)
	bitesize = 3
	filling_color = "#F0F0F0"
	tastes = list("meat" = 1, "onions" = 1, "garlic" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/monkeycube
	name = "monkey cube"
	desc = "Just add water!"
	icon_state = "monkeycube"
	bitesize = 12
	list_reagents = list(/datum/reagent/monkey_powder = 30)
	filling_color = "#CD853F"
	tastes = list("the jungle" = 1, "bananas" = 1)
	foodtype = MEAT | SUGAR
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_TINY
	var/faction
	var/spawned_mob = /mob/living/carbon/monkey
	custom_price = 5

/obj/item/reagent_containers/food/snacks/monkeycube/proc/Expand()
	var/mob/spammer = get_mob_by_key(fingerprintslast)
	var/mob/living/bananas = new spawned_mob(drop_location(), TRUE, spammer)
	if(faction)
		bananas.faction = faction
	if (!QDELETED(bananas))
		visible_message("<span class='notice'>[src] expands!</span>")
		bananas.log_message("Spawned via [src] at [AREACOORD(src)], Last attached mob: [key_name(spammer)].", LOG_ATTACK)
	else if (!spammer) // Visible message in case there are no fingerprints
		visible_message("<span class='notice'>[src] fails to expand!</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/monkeycube/syndicate
	faction = list("neutral", ROLE_SYNDICATE)

/obj/item/reagent_containers/food/snacks/monkeycube/gorilla
	name = "gorilla cube"
	desc = "A Waffle Co. brand gorilla cube. Now with extra molecules!"
	bitesize = 20
	list_reagents = list(/datum/reagent/monkey_powder = 30, /datum/reagent/medicine/strange_reagent = 5)
	tastes = list("the jungle" = 1, "bananas" = 1, "jimmies" = 1)
	spawned_mob = /mob/living/simple_animal/hostile/gorilla

/obj/item/reagent_containers/food/snacks/enchiladas
	name = "enchiladas"
	desc = "Viva La Mexico!"
	icon_state = "enchiladas"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	bitesize = 4
	filling_color = "#FFA07A"
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/capsaicin = 6)
	tastes = list("hot peppers" = 1, "meat" = 3, "cheese" = 1, "sour cream" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/stewedsoymeat
	name = "stewed soy meat"
	desc = "Even non-vegetarians will LOVE this!"
	icon_state = "stewedsoymeat"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	filling_color = "#D2691E"
	tastes = list("soy" = 1, "vegetables" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/stewedsoymeat/Initialize()
	. = ..()
	eatverb = pick("slurp","sip","inhale","drink")

/obj/item/reagent_containers/food/snacks/boiledspiderleg
	name = "boiled spider leg"
	desc = "A giant spider's leg that's still twitching after being cooked. Yum!" //Its cooked and not GORE, so it shouldnt imply that its gross to eat
	icon_state = "spiderlegcooked"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/capsaicin = 2, /datum/reagent/consumable/nutriment/vitamin = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/capsaicin = 2)
	filling_color = "#000000"
	tastes = list("hot peppers" = 1, "cobwebs" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/spidereggsham
	name = "green eggs and ham"
	desc = "Would you eat them on a train? Would you eat them on a plane? Would you eat them on a state of the art corporate deathtrap floating through space?"
	icon_state = "spidereggsham"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 3)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	bitesize = 4
	filling_color = "#7FFF00"
	tastes = list("meat" = 1, "the colour green" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/sashimi
	name = "carp sashimi"
	desc = "Celebrate surviving attack from hostile alien lifeforms by hospitalising yourself."
	icon_state = "sashimi"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/capsaicin = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/capsaicin = 5)
	filling_color = "#FA8072"
	tastes = list("fish" = 1, "hot peppers" = 1)
	foodtype = MEAT | TOXIC

/obj/item/reagent_containers/food/snacks/nugget
	name = "chicken nugget"
	filling_color = "#B22222"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("\"chicken\"" = 1)
	foodtype = MEAT
	/*food_flags = FOOD_FINGER_FOOD*/
	w_class = WEIGHT_CLASS_TINY

/obj/item/reagent_containers/food/snacks/nugget/Initialize()
	. = ..()
	var/shape = pick("lump", "star", "lizard", "corgi")
	desc = "A 'chicken' nugget vaguely shaped like a [shape]."
	icon_state = "nugget_[shape]"

/obj/item/reagent_containers/food/snacks/pigblanket
	name = "pig in a blanket"
	desc = "A tiny sausage wrapped in a flakey, buttery roll. Free this pig from its blanket prison by eating it."
	icon_state = "pigblanket"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 1)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	filling_color = "#800000"
	tastes = list("meat" = 1, "butter" = 1)
	foodtype = MEAT | DAIRY

/obj/item/reagent_containers/food/snacks/bbqribs
	name = "bbq ribs"
	desc = "BBQ ribs, slathered in a healthy coating of BBQ sauce. The least vegan thing to ever exist."
	icon_state = "ribs"
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/bbqsauce = 5)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("meat" = 3, "smokey sauce" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meatclown
	name = "meat clown"
	desc = "A delicious, round piece of meat clown. How horrifying."
	icon_state = "meatclown"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1, /datum/reagent/consumable/banana = 2)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("meat" = 5, "clowns" = 3, "sixteen teslas" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meatclown/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 30)

//////////////////////////////////////////// KEBABS AND OTHER SKEWERS ////////////////////////////////////////////

/obj/item/reagent_containers/food/snacks/kebab
	trash = /obj/item/stack/rods
	icon_state = "kebab"
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("meat" = 3, "metal" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/kebab/human
	name = "human-kebab"
	desc = "A human meat, on a stick."
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("tender meat" = 3, "metal" = 1)
	foodtype = MEAT | GORE

/obj/item/reagent_containers/food/snacks/kebab/monkey
	name = "meat-kebab"
	desc = "Delicious meat, on a stick."
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("meat" = 3, "metal" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/kebab/tofu
	name = "tofu-kebab"
	desc = "Vegan meat, on a stick."
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("tofu" = 3, "metal" = 1)
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/kebab/rat
	name = "rat-kebab"
	desc = "Not so delicious rat meat, on a stick."
	icon_state = "ratkebab"
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("rat meat" = 1, "metal" = 1)
	foodtype = MEAT | GORE

/obj/item/reagent_containers/food/snacks/kebab/rat/double
	name = "double rat-kebab"
	icon_state = "doubleratkebab"
	tastes = list("rat meat" = 2, "metal" = 1)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)

/obj/item/reagent_containers/food/snacks/kebab/fiesta
	name = "fiesta skewer"
	icon_state = "fiestaskewer"
	tastes = list("tex-mex" = 3, "cumin" = 2)
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/capsaicin = 3)

/obj/item/reagent_containers/food/snacks/fishfry
	name = "fish fry"
	desc = "All that and no bag of chips..."
	icon_state = "fish_fry"
	list_reagents = list (/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 3)
	filling_color = "#ee7676"
	tastes = list("fish" = 1, "pan seared vegtables" = 1)
	foodtype = MEAT | VEGETABLES | FRIED
