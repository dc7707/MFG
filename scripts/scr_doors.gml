///Handle door interactions

with obj_player {
    if (instance_exists(obj_door)) {
        nearest_door = instance_nearest(x,y,obj_door);
        if (distance_to_object(nearest_door <= 40)) {mydoor = nearest_door} else { mydoor = noone }
    }
    
    if (instance_exists(obj_door_open)) {
        nearest_open_door = instance_nearest(x,y,obj_door_open);
        if (distance_to_object(nearest_open_door <= 40)) {mydoor_open = nearest_open_door} else { mydoor_open = noone }
    }
    
    if (instance_exists(obj_proximity)) {
        nearest_prox = instance_nearest(x,y,obj_proximity);
        if (distance_to_object(nearest_prox <= 40)) {myprox = nearest_prox} else { myprox = noone }
    }    
    
///open if player is within distance of 20 (pixels???) of the door
    if (myprox = noone) {/*do nothing */} else { 
            if (distance_to_object(myprox) <= 20) {
            with nearest_door {
                if (image_index + image_speed >= image_number -1) {
                    image_index = image_number -1;
                    image_speed = 0;
                    if (instance_exists(obj_player.nearest_door)) { 
                        instance_destroy();
                        instance_create(obj_player.myprox.x,obj_player.myprox.y,obj_door_open)
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
                instance_create(obj_player.myprox.x,obj_player.myprox.y,obj_door)
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
}

