///Handle door interactions

with obj_player {
   if (instance_exists(obj_door)) {
        nearest_door = instance_nearest(x,y,obj_door);
        if (distance_to_object(nearest_door) <= 40) {mydoor = nearest_door} else { mydoor = noone }
    }


  /*   
    if (instance_exists(obj_door_open)) {
        nearest_open_door = instance_nearest(x,y,obj_door_open);
        if (distance_to_object(nearest_open_door) <= 20) {mydoor_open = nearest_open_door} else { mydoor_open = noone }
    }
*/ 

/*    
    if (instance_exists(obj_proximity)) {
        nearest_prox = instance_nearest(x,y,obj_proximity);
        if (distance_to_object(nearest_prox) <= 20) {myprox = nearest_prox} else { myprox = noone }
    }    
*/
    
///open if player is within distance of 20 (pixels???) of the proximity detector

    with instance_nearest(x,y,obj_door) {
        //with mydoor {
                if (distance_to_object(obj_player) < 20) {
                mydoor = instance_nearest(x,y,obj_door);
                if (instance_exists(obj_proximity)) {
                    nearest_prox = instance_nearest(x,y,obj_proximity);
                    if (distance_to_object(nearest_prox) <= 2) {myprox = nearest_prox} //else { myprox = noone }
                }
                //scr_door_open();
                if (image_index + image_speed >= image_number -1) {
                        image_index = image_number -1;
                        image_speed = 0;
                    if (instance_exists(obj_door)) { 
                        instance_destroy();
                        mydoor_open = instance_create(myprox.x,myprox.y,obj_door_open)
                        with mydoor_open {image_index = image_number -1}
                        with obj_door_open {image_index = image_number -1}
                    }
                }
                if (image_index + image_speed <= image_number -1) {
                    image_speed = .2;
                }
            } else {
                if (image_index + image_speed > 0) {image_speed = -.2;} else {
                    image_index = 0;
                    image_speed = 0;
                }
            } 
        }
    with instance_nearest(x,y,obj_door_open) {
        if (distance_to_object(obj_player) > 20) {
            if (instance_exists(obj_proximity)) {
                nearest_prox = instance_nearest(x,y,obj_proximity);
                if (distance_to_object(nearest_prox) <= 2) {myprox = nearest_prox} //else { myprox = noone }
            }
            instance_destroy()
            mydoor = instance_create(myprox.x,myprox.y,obj_door)
            with mydoor {image_index = image_number -1}
        }
    }
}

with obj_door {
                if (image_index + image_speed <= 0) {image_speed = 0;}
}
