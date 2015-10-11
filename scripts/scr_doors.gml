///Handle door interactions

with obj_player {
///open if player is within distance of 20 (pixels???) of the door
    if (distance_to_object(obj_proximity) <= 20) {
        with obj_door {
            if (image_index + image_speed >= image_number -1) {
                image_index = image_number -1;
                image_speed = 0;
                if (instance_exists(obj_door)) { 
                    instance_destroy();
                    instance_create(obj_proximity.x,obj_proximity.y,obj_door_open)
                    with obj_door_open {image_index = image_number -1}
                    } else { }
            }
            if (image_index + image_speed <= image_number -1) {
                image_speed = .2;
            } else {
                image_speed = 0;
            } 
        }
    } else { 
        if (instance_exists(obj_door)) { } else {
            if (instance_exists(obj_door_open)) { with obj_door_open{instance_destroy()}}
            instance_create(obj_proximity.x,obj_proximity.y,obj_door)
            with obj_door {image_index = image_number -1}
        }
    ///Close door if distance from player to door is greater than 20
        with obj_door {
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

