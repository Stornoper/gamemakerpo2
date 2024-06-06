//variables
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
build_key = keyboard_check(ord("B"));
//movement
xspd = (right_key-left_key) * movesp;
yspd = (down_key-up_key) * movesp;

// place meeting
if place_meeting(x + xspd, y, obj_collission)
{
    while (!place_meeting(x + sign(xspd), y, obj_collission))
    {
        x += sign(xspd);
    }
    xspd = 0;
}
if place_meeting(x, y + yspd, obj_collission)
{
    while (!place_meeting(x, y + sign(yspd), obj_collission))
    {
        y += sign(yspd);
    }
    yspd = 0;    
}

if yspd != 0 || xspd != 0
{
	moving = true
}
else 
{
	moving = false
}

//bouwen 
if build_key && buildMode = false
{
	buildMode = true;
}
else if build_key
{
	buildMode = false;
}
if buildMode
{
	if keyboard_check_pressed(ord("1")) && oneselected = false
	{
		instance_create_layer(mouse_x, mouse_y, "Instances_2", obj_block_vault_transparant); 
		clearSelection();
		oneselected = true
	}
	else if keyboard_check_pressed(ord("2")) && twoselected = false 
	{
		clearSelection();
		instance_create_layer(mouse_x, mouse_y, "Instances_2", obj_block_crafter_transparant); 
		twoselected= true
	}
}

//animation,

if moving = false
{
	image_speed = 0;
}
else if moving = true
{
	image_speed = 1
}

image_angle = point_direction(x, y, mouse_x, mouse_y)-90; 

// camera
var cam_x = lerp(camera_get_view_x(view_camera[0]), (x) - view_wview[0]/2, 0.1);
var cam_y = lerp(camera_get_view_y(view_camera[0]), (y) - view_hview[0]/2, 0.1);

camera_set_view_pos(view_camera[0], cam_x, cam_y);

// beweging
x += xspd
y += yspd