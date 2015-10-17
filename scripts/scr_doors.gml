///Handle door interactions

with obj_player {
   if (instance_exists(obj_door)) {
        nearest_door = instance_nearest(x,y,obj_door);
        if (distance_to_object(nearest_door) <= 20) {mydoor = nearest_door} else { mydoor = noone }
    }
    with instance_nearest(x,y,obj_door) {
            if (distance_to_object(obj_player) < 20) {
            mydoor = instance_nearest(x,y,obj_door);
            if (instance_exists(obj_proximity)) {
                nearest_prox = instance_nearest(x,y,obj_proximity);
                if (distance_to_object(nearest_prox) <= 0) {myprox = nearest_prox}
            }
            if (image_index + image_speed >= image_number -1) {
                    image_index = image_number -1;
                    image_speed = 0;
                if (instance_exists(obj_door)) {
                    myangle = image_angle; 
                    instance_destroy();
                    mydoor_open = instance_create(myprox.x,myprox.y,obj_door_open)
                    with mydoor_open {image_index = image_number -1}
                    mydoor_open.image_angle = myangle;
                    //with obj_door_open {image_index = image_number -1}
                }
            }
            if (image_index + image_speed <= image_number -1) {
                image_speed = .3;
            }
        } else {
            if (image_index + image_speed > 0) {image_speed = -.3;} else {
                image_index = 0;
                image_speed = 0;
            }
        } 
    }
    with instance_nearest(x,y,obj_door_open) {
        if (distance_to_object(obj_player) > 20) {
            if (instance_exists(obj_proximity)) {
                nearest_prox = instance_nearest(x,y,obj_proximity);
                if (distance_to_object(nearest_prox) <= 0) {myprox = nearest_prox} 
            }
            myangle = image_angle;
            instance_destroy()
            mydoor = instance_create(myprox.x,myprox.y,obj_door)
            with mydoor {image_index = image_number -1}
            mydoor.image_angle = myangle;
        }
    }
}
//stop animations on proper frame without factoring in distance
with obj_door {
                if (image_index + image_speed <= 0) {image_speed = 0;}
}

