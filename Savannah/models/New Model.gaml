/**
* Name: Savannah
* Based on the internal empty template. 
* Author: laeti
* Tags: 
*/


model Savannah


/*------------ global section --------------*/
global {
    float color_range <- 60.0; //this variable defines the amount of biomass in kg where the cell is turning full green because red and blue are at zero RGB(0,255,0)
    init {
        create lions number: 20 {
        }
        create zebras number: 20 {
        }
    }
 }

/*------------ species section --------------*/
species lions skills: [moving] {
    reflex move {
        do wander;
    }
    reflex hunt {
        ask zebras at_distance 3.0 { //the hunt function checks distance between lions and zebras and kills zebras at a distance of 0.3 units
            do die;
        }
    }
    aspect default {
        draw circle(3) color: #orange;
    }
}

species zebras skills: [moving] {
    reflex move {
        do wander;
    }
    
    aspect default {
        draw triangle(2) color: #grey;
    }
}


/*------------ CA section --------------*/
grid vegetation_cell width: 100 height: 100 {
    float biomass <- rnd(10.0); //this chooses a random number between 0 and 10 as biomass for each cell
    //the color of each cell has always a green value of 255, only the blue and red values are updated by substracting a number between 0 and 255
    //the lower the red and blue values the brighter the green color
    //red and blue values get lower when biomass is increasing but are capped at the global variable "color_range" to avoid negative values
    rgb color <- rgb(int(255 - min(biomass, color_range) / color_range * 255), 255, int(255 - min(biomass, color_range) / color_range * 255))
        update: rgb(int(255 - min(biomass, color_range) / color_range * 255), 255, int(255 - min(biomass, color_range) / color_range * 255));
    reflex grow {
        biomass <- biomass + 0.1;
    }
}

/*------------ simulation part --------------*/
experiment main_experiment type: gui {
 
    
    output {
        display map {
        		grid vegetation_cell;
            species lions aspect: default;
            species zebras aspect: default;
        }
    }
}


