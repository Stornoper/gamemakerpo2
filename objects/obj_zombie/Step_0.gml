

// variables
var target_obj = instance_nearest(x, y, obj_player);
	
var dist = distance_to_object(target_obj); 


//loop naar makker toe
var dir = point_direction(x, y, target_obj.x, target_obj.y); 
image_angle = dir-90

var aspeed = 0.3 

var spd_x = lengthdir_x(aspeed, dir); 
var spd_y = lengthdir_y(aspeed, dir); 

aspeed = point_distance(x, y, target_obj.x, target_obj.y) / dist * aspeed;

//beweging
x += spd_x * movesp;
y += spd_y * movesp;

