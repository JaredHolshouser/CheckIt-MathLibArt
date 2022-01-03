def generator():
    
    #Choose a mode: round shapes (0-2) or straight shapes (3-4)
    
    mode = choice([0,1,2,3,4])
    #DEBUG LINE
    #mode = 4
    
    #Round Shapes
    if mode < 3:
        #Choose a first shape
        shapes = [
            "cylinder",
            "cone",
            "hemisphere",
        ]
        shape_1 = shapes[mode]
        
        #Choose some dimensions
        dimension_1 = randrange(3,12)
        dimension_2 = randrange(3,12)
        dimension_3 = randrange(3,12)
        dimension_4 = randrange(3,12)
        dimension_5 = randrange(3,12)
        
        #Choose a second shape
        shapes.remove(shape_1)
        shape_2_index = choice([0,1])
        #DEBUG LINE
        #shape_2_index = 0
        shape_2 = shapes[shape_2_index]
        
        #Decide shape orientations
        shape_1_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_1_orientation_choice = 0
        shape_2_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_2_orientation_choice = 0
        #For cylinders
        if mode == 0:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "stands upright"
                if shape_2_orientation_choice == 0:
                    shape_2_orientation = "to the top"
                else:
                    shape_2_orientation = "to the bottom"
                
            else:
                shape_1_orientation = "lies on its side"
                if shape_2_orientation_choice == 0:
                    shape_2_orientation = "to the right side"
                else:
                    shape_2_orientation = "to the left side"
        #For cones
        elif mode == 1:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is positioned flat side up"
                shape_2_orientation = "to the top"
            else:
                shape_1_orientation = "is positioned flat side down"
                shape_2_orientation = "to the bottom"
        #For hemispheres
        elif mode == 2:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is positioned flat side up"
                shape_2_orientation = "to the top"
            else:
                shape_1_orientation = "is positioned flat side down"
                shape_2_orientation = "to the bottom"
            
    #Straight Shapes
    else:
        #Choose a first shape
        shapes = [
            "rectangular prism",
            "pyramid",
        ]
        shape_1 = shapes[mode - 3]
        
        #choose some dimensions
        dimension_1 = randrange(3,12)
        dimension_2 = randrange(3,12)
        dimension_3 = randrange(3,12)
        dimension_4 = randrange(3,12)
        dimension_5 = randrange(3,12)
        
        #Choose a second shape
        shapes.remove(shape_1)
        shape_2 = shapes[0]
        
        #Decide shape orientations
        shape_1_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_1_orientation_choice = 1
        shape_2_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_2_orientation_choice = 0
        #For rectangular prisms
        if mode == 3:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "stands with it's longest side vertical"
                if shape_2_orientation_choice == 0:
                    shape_2_orientation = "to the top"
                else:
                    shape_2_orientation = "to the bottom"
                
            else:
                shape_1_orientation = "stands with it's longest side horizontal"
                if shape_2_orientation_choice == 0:
                    shape_2_orientation = "to the right side"
                else:
                    shape_2_orientation = "to the left side"
        #For pyramids
        elif mode == 4:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is positioned flat side up"
                shape_2_orientation = "to the top"
            else:
                shape_1_orientation = "is positioned flat side down"
                shape_2_orientation = "to the bottom"

        
    #Compute volumes
    #cylinder and cone
    if mode == 0 and shape_2_index == 0:
        dimensions = "the cylinder has radius " + str(dimension_1) +" and side length " + str(dimension_2) + ", and the cone has altitude " + str(dimension_4)
        formula = "\\pi r^2h_1 + \\frac{1}{3}\\pi r^2h_2"
        total_volume = (math.pi)*(dimension_1**2)*dimension_2 + 1/3*(math.pi)*(dimension_1**2)*dimension_4
    #cylinder and hemisphere
    elif mode == 0 and shape_2_index == 1:
        dimensions = "the cylinder has radius " + str(dimension_1) + " and side length " + str(dimension_2)
        formula = "\\pi r^2h + \\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3"
        total_volume = (math.pi)*(dimension_1**2)*dimension_2 + 1/2*4/3*(math.pi)*(dimension_1**3)
    #cone and cylinder
    elif mode == 1 and shape_2_index == 0:
        dimensions = "the cone has radius " + str(dimension_1) + " and altitude " + str(dimension_3) + ", and the cylinder has side length " + str(dimension_4)
        formula = "\\frac{1}{3}\\pi r^2h_1 + \\pi r^2h_2"
        total_volume = 1/3*(math.pi)*(dimension_1**2)*dimension_3 + (math.pi)*(dimension_1**2)*dimension_4
    #cone and hemisphere
    elif mode == 1 and shape_2_index == 1:
        dimensions =  "the cone has radius " + str(dimension_1) + " and altitude " + str(dimension_3)
        formula = "\\frac{1}{3}\\pi r^2h + \\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3"
        total_volume = 1/3*(math.pi)*(dimension_1**2)*dimension_3 + 1/2*4/3*(math.pi)*(dimension_1**3)
    #hemisphere and cylinder
    elif mode == 2 and shape_2_index == 0:
        dimensions = "the hemisphere has radius " + str(dimension_1) + " and the cylinder has side length " + str(dimension_2)
        formula = "\\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3 + \\pi r^2h"
        total_volume = 1/2*4/3*(math.pi)*(dimension_1**3) + (math.pi)*(dimension_1**2)*dimension_2
    #hemisphere and cone
    elif mode == 2 and shape_2_index == 1:
        dimensions = "the hemisphere has radius " + str(dimension_1) + " and the cone has altitude " + str(dimension_3)
        formula = "\\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3 + \\frac{1}{3}\\pi r^2h"
        total_volume = 1/2*4/3*(math.pi)*(dimension_1**3) + 1/3*(math.pi)*(dimension_1**2)*dimension_3
    #prism and pyramid
    elif mode == 3:
        sizes = [3,4,5,6,7,8,9,10,11]
        dim_1 = choice(sizes)
        sizes.remove(dim_1)
        dim_2 = choice(sizes)
        sizes.remove(dim_2)
        dim_3 = choice(sizes)
        prism_dims = [dim_1,dim_2,dim_3]
        longest_side = max(prism_dims)
        prism_dims.remove(longest_side)
        side_1 = prism_dims[0]
        side_2 = prism_dims[1]
        #Longest side vertical
        if shape_1_orientation_choice == 0:
            dimensions = "the rectangular prism has height " + str(longest_side) + ", length " + str(side_1) + ", and width " + str(side_2) + ", and the pyramid has altitude " + str(dimension_2)
        #Longest side horizontal
        else:
            dimensions = "the rectangular prism has length " + str(longest_side) + ", width " + str(side_1) + ", and height " + str(side_2) + ", and the pyramid has altitude " + str(dimension_2)
        formula = "\\ell w h_1 + \\frac{1}{3}\\ell w h_2"
        total_volume = side_1*side_2*longest_side + 1/3*side_1*side_2*dimension_2
    #pyramid and prism
    else:
        dimensions = "The pyramid has base length " + str(dimension_1) + ", base width " + str(dimension_2) + ", and altitude " + str(dimension_4) + ", and the rectangular prism has height " + str(dimension_5)
        formula = "\\frac{1}{3}l\\ell w h_1 + \\ell w h_2"
        total_volume = 1/3*dimension_1*dimension_2*dimension_4 + dimension_1*dimension_2*dimension_5
        
    #clean up the total volume
    total_volume_approx = round(total_volume,2)
    total_volume_string = str(total_volume_approx)
        
    #choice of units
    unit_choices = [("inches","in"), ("feet","ft"), ("millimeters","mm"), ("centimeters","cm"), ("meters","m"), ("miles","mi"), ("kilometers","km")]
    unit_choice = choice(unit_choices)
    units_long = unit_choice[0]
    units_short = unit_choice[1]
        
    return {
        "shape_1": shape_1,
        "shape_1_orientation": shape_1_orientation,
        "shape_2": shape_2,
        "shape_2_orientation": shape_2_orientation,
        "dimensions": dimensions,
        "formula": formula,
        "total_volume": total_volume_string,
        "units_long": units_long,
        "units_short": units_short,
    }