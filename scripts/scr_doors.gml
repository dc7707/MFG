///Handle door interactions

with obj_player {
    if (distance_to_object(obj_door) <= 20){
        with obj_door {
            if (image_index <= image_number -1) {
                image_speed = .2;
  
            } else {
                image_speed = 0;
            } 
        }
    } else { 
        with obj_door {
            if (image_index <= 0) {image_speed = 0;}
            if (image_index > 0) {
                image_speed = -.2;
            } else {
                image_speed = 0;
            } 
        }
    }
}

