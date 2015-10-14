///scr_create_orbs()
NumberOfOrbs = 200;

color1 = make_colour_rgb(random(255), random(255), random(255));
color2 = make_colour_rgb(random(255), random(255), random(255));

while instance_number(obj_orb) < NumberOfOrbs {
    new_orb = instance_create(random(room_width), random(room_height), obj_orb)
    new_orb.image_blend = choose(color1, color2);
}
