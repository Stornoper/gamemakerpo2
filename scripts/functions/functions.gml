function buildFunction()
{
	x = round(mouse_x/32)*32;
	y = round(mouse_y/32)*32;

	if mouse_check_button_pressed(mb_left) && !place_meeting(x, y, obj_collission) && !place_meeting(x, y, obj_player)
	{
		instance_create_layer(x,y, "Buildables", block);
		instance_create_layer(x,y, "Buildables", obj_collission);
	}
	if keyboard_check_pressed(ord("B")) && obj_player.buildMode
	{
		instance_destroy();
		obj_player.buildMode = false;
	}
}

function clearSelection()
{
	if oneselected
	{
		instance_destroy(obj_block_vault_transparant);
		oneselected = false;
	}
	if twoselected
	{
		instance_destroy(obj_block_crafter_transparant);
		twoselected = false;
	}
}