function run(agility){
	if (agility > 0.5)
	{
		sprite_index = spr_cat_run;
		if (self.stamina > 0) 
		{
			self.stamina -= (delta_time / 1000000) * 10;
		} else
		{
			self.stamina = 0
		}
	} else
	{
		sprite_index = spr_cat_walk;
	}
}
