#region Para no ultimo frame
if (direc == 4 || direc == 5 || direc == 6 || direc == 7) {
	if (sprite_index == sprPinkStarJump || sprPinkStarFall) {
		image_index = image_number -1;
	}
}

if (sprite_index == sprPinkStarAntecipation) {
	image_index = image_number -1;
}

if (sprite_index == sprPinkStarHit) {
	image_index = image_number -1;
}

if (sprite_index == sprPinkStarDead) {
	image_index = image_number -1;
}

if (sprite_index == sprPinkStarDeadGround) {
	image_index = image_number -1;
}

#endregion

#region Sprites Morto
if isDead {
	if (sprite_index == sprPinkStarDead) {
		if (image_xscale == -1) {
		    direc = 18; //<-- Define sprite
		}
		else if (image_xscale == 1) {
		    direc = 19; //<-- Define sprite 
		}
	}
}
#endregion

#region Sprites Hit
if (direc == 14 || direc == 15) && !isDead {
	image_index = image_number -1;
	if (!direita || !esquerda) && place_meeting(x, y + 1, objColisParede) {
		direc = (image_xscale == 1) ? 0 : 1;
	}
	hit = false;
}
#endregion