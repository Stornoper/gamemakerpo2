

// variables
if instance_exists(obj_block_vault)
{
var target_obj = instance_nearest(x, y, obj_block_vault);
}
else if instance_exists(obj_player) and !instance_exists(obj_block_vault)
{
	var target_obj = instance_nearest(x, y, obj_player);
}
var dist = distance_to_object(target_obj); 


//loop naar makker toe
var dir = point_direction(x, y, target_obj.x, target_obj.y); 
image_angle = dir-90

var aspeed = 0.3 

var spd_x = lengthdir_x(aspeed, dir); 
var spd_y = lengthdir_y(aspeed, dir); 

aspeed = point_distance(x, y, target_obj.x, target_obj.y) / dist * aspeed;

if place_meeting(x + spd_x, y, obj_collission)
{
    while (!place_meeting(x + sign(spd_x), y, obj_collission))
    {
        x += sign(spd_x);
    }
    spd_x = 0;
}
if place_meeting(x, y + spd_y, obj_collission)
{
    while (!place_meeting(x, y + sign(spd_y), obj_collission))
    {
        y += sign(spd_y);
    }
    spd_x = 0;    
}

//beweging
x += spd_x * movesp;
y += spd_y * movesp;

