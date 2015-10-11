///Handle door interactions

with obj_player {
    if (instance_exists(obj_door)) {
        nearest_door = instance_nearest(x,y,obj_door);
        if (distance_to_object(nearest_door <= 40)) {mydoor = instance_nearest(x,y,obj_door)}
    }
    
    if (instance_exists(obj_door_open)) {
        nearest_open_door = instance_nearest(x,y,obj_door_open);
        if (distance_to_object(nearest_open_door <= 40)) {mydoor_open = instance_nearest(x,y,obj_door_open)}
    }
///open if player is within distance of 20 (pixels???) of the door
    if (distance_to_object(obj_proximity) <= 20) {
        with nearest_door {
            if (image_index + image_speed >= image_number -1) {
                image_index = image_number -1;
                image_speed = 0;
                if (instance_exists(obj_player.nearest_door)) { 
                    instance_destroy();
                    instance_create(obj_proximity.x,obj_proximity.y,obj_door_open)
                    obj_player.nearest_open_door = instance_nearest(x,y,obj_door_open);
                    with obj_player.nearest_open_door {image_index = image_number -1}
                    } else { }
            }
            if (image_index + image_speed <= image_number -1) {
                image_speed = .2;
            } else {
                image_speed = 0;
            } 
        }
    } else { 
        if (instance_exists(obj_player.nearest_door)) { } else {
            if (instance_exists(obj_player.nearest_open_door)) { with obj_player.nearest_open_door{instance_destroy()}}
            instance_create(obj_proximity.x,obj_proximity.y,obj_door)
            obj_player.nearest_door = instance_nearest(x,y,obj_door);
            with obj_player.nearest_door {image_index = image_number -1}
        }
    ///Close door if distance from player to door is greater than 20
        with obj_player.nearest_door {
            if (image_index + image_speed <= 0) {
                image_index = 0;
                image_speed = 0;
            }
            if (image_index + image_speed > 0) {
                image_speed = -.2;
            }  else {
                image_speed = 0;
            } 
        }
    }
}

