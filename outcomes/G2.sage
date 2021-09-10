def generator():
    
    #Choose a first object
    first_objects = [
        "cylinder",
        "cone",
        "hemisphere",
        "rectangular prism",
        "pyramid",
    ]
    object_1 = choice(first_objects)
    
    #choose some dimensions
    dimension_1 = randrange(3,12)
    dimension_2 = randrange(3,12)
    dimension_3 = randrange(3,12)
    dimension_4 = randrange(3,12)
    dimension_5 = randrange(3,12)
    
    #deciding object orientations
    if object_1 == "cylinder":
        object_1_orientation = choice(["stands upright", "lies on its side"])
        if object_1_orientation == "stands upright":
            object_2_orientation = choice(["to the top", "to the bottom"])
        else:
            object_2_orientation = choice(["to the right side", "to the left side"])
    elif object_1 == "cone" or object_1 == "hemisphere" or object_1 == "pyramid":
        object_1_orientation = choice(["is positioned flat side up", "is positioned flat side down"])
        if object_1_orientation == "is positioned flat side up":
            object_2_orientation = "to the top"
        else:
            object_2_orientation = "to the bottom"
    else:
        object_1_orientation = choice(["stands with it's longest side vertical", "stands with it's longest side horizontal"])
        if object_1_orientation == "stands with it's longest side vertical":
            object_2_orientation = choice(["to the top", "to the bottom"])
        else:
            object_2_orientation = choice(["to the right side", "to the left side"])

    #Choose a second object
    if object_1 == "cylinder":
        object_2 = choice(["cone","hemisphere"])
    elif object_1 == "cone":
        object_2 = choice(["hemisphere","cylinder"])
    elif object_1 == "hemisphere":
        object_2 = choice(["cylinder", "cone"])
    elif object_1 == "rectangular prism":
        object_2 = "pyramid"
    else:
        object_2 = "rectangular prism"
        
    #Compute volumes
    #cylinder and cone
    if object_1 == "cylinder" and object_2 == "cone":
        dimensions = "the cylinder has radius " + str(dimension_1) +" and side length " + str(dimension_2) + " and the cone has altitude " + str(dimension_4)
        formula = "\\pi r^2h_1 + \\frac{1}{3}\\pi r^2h_2"
        total_volume = (math.pi)*(dimension_1**2)*dimension_2 + 1/3*(math.pi)*(dimension_1**2)*dimension_4
    #cylinder and hemisphere
    elif object_1 == "cylinder" and object_2 == "hemisphere":
        dimensions = "the cylinder has radius " + str(dimension_1) + " and side length " + str(dimension_2)
        formula = "\\pi r^2h + \\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3"
        total_volume = (math.pi)*(dimension_1**2)*dimension_2 + 1/2*4/3*(math.pi)*(dimension_1**3)
    #cone and cylinder
    elif object_1 == "cone" and object_2 == "cylinder":
        dimensions = "the cone has radius " + str(dimension_1) + " and altitude " + str(dimension_3) + ", and the cylinder has side length " + str(dimension_4)
        formula = "\\frac{1}{3}\\pi r^2h_1 + \\pi r^2h_2"
        total_volume = 1/3*(math.pi)*(dimension_1**2)*dimension_3 + (math.pi)*(dimension_1**2)*dimension_4
    #cone and hemisphere
    elif object_1 == "cone" and object_2 == "hemisphere":
        dimensions =  "the cone has radius " + str(dimension_1) + " and altitude " + str(dimension_3)
        formula = "\\frac{1}{3}\\pi r^2h + \\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3"
        total_volume = 1/3*(math.pi)*(dimension_1**2)*dimension_3 + 1/2*4/3*(math.pi)*(dimension_1**3)
    #hemisphere and cylinder
    elif object_1 == "hemisphere" and object_2 == "cylinder":
        dimensions = "the hemisphere has radius " + str(dimension_1) + " and the cylinder has side length " + str(dimension_2)
        formula = "\\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3 + \\pi r^2h"
        total_volume = 1/2*4/3*(math.pi)*(dimension_1**3) + (math.pi)*(dimension_1**2)*dimension_2
    #hemisphere and cone
    elif object_1 == "hemisphere" and object_2 == "cone":
        dimensions = "the hemisphere has radius " + str(dimension_1) + " and the cone has altitude " + str(dimension_3)
        formula = "\\frac{1}{2}\\cdot\\frac{4}{3}\\pi r^3 + \\frac{1}{3}\\pi r^2h"
        total_volume = 1/2*4/3*(math.pi)*(dimension_1**3) + 1/3*(math.pi)*(dimension_1**2)*dimension_3
    #prism and pyramid
    elif object_1 == "rectangular prism":
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
        if object_1_orientation == "stands with it's longest side vertical":
            dimensions = "the rectangular prism has height " + str(longest_side) + ", length " + str(side_1) + ", and width " + str(side_2) + ", and the pyramid has altitude " + str(dimension_2)
        else:
            dimensions = "the rectangular prism has length " + str(longest_side) + ", width " + str(side_1) + "and height " + str(side_2) + ", and the pyramid has altitude " + str(dimension_2)
        formula = "l \\cdot w \\cdot h_1 + \\frac{1}{3}l \\cdot w \\cdot h_2"
        total_volume = side_1*side_2*longest_side + 1/3*side_1*side_2*dimension_2
    #pyramid and prism
    else:
        dimensions = "The pyramid has base length " + str(dimension_1) + ", base width " + str(dimension_2) + ", and altitude " + str(dimension_4) + ", and the rectangular prism has height " + str(dimension_5)
        formula = "\\frac{1}{3}l \\cdot w \\cdot h_1 + l \\cdot w \\cdot h_2"
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
        "object_1": object_1,
        "object_1_orientation": object_1_orientation,
        "object_2": object_2,
        "object_2_orientation": object_2_orientation,
        "dimensions": dimensions,
        "formula": formula,
        "total_volume": total_volume_string,
        "units_long": units_long,
        "units_short": units_short,
    }