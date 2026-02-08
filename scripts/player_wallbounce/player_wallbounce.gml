function player_wallbounce()
{
	var _spd = 8
	
	movespeed = approach(movespeed, p_move != 0 ? p_move * _spd : 0, p_move != 0 ? 1 : 0.5)
	
	hsp = movespeed
	
	if !grounded
	{
		if input_buffers.grab > 0
		{
			input_buffers.grab = 0
			if !input.up.check
			{
				if p_move != 0
					xscale = p_move
				input_buffers.grab = 0
				state = states.mach2
				movespeed = 12
				jumpstop = true
				vsp = min(vsp, -5)
				reset_anim(spr_playerN_spincancel)
			}
			else
				do_grab() //uppercut
		}
		else if input.down.check
		{
			state = states.divebomb
			vsp = 20
		}
	}
	else if vsp >= 0
	{
		flash = 8
		if input.dash.check
		{
			if p_move != 0
				xscale = p_move
			state = states.mach3
			movespeed = max(abs(movespeed), 12)
			sprite_index = spr_player_mach3
		}
		else
			state = states.normal
	}
	
	image_speed = 0.5
	
	do_taunt()
}
