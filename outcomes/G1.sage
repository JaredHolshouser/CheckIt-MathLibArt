def generator():
    
    #Choose a mode: normal shapes (0-3) or circle with part removed (4)
    mode = choice([0,1,2,3,4])
    #DEBUG LINE
    #mode = 4
    
    #Normal choices
    if mode < 4:
        #Choose a first shape
        shapes = [
        "rectangle",
        "triangle",
        "semicircle",
        "trapezoid",
        ]
        shape_1 = shapes[mode]
        shape_1_short = shape_1
        
        #Choose a second shape
        shapes.remove(shape_1)
        shape_2_index = choice([0,2])
        #DEBUG LINE
        #shape_2_index = 2
        shape_2 = shapes[shape_2_index]
        
        #choose some dimensions
        num_range = [3,4,5,6,7,8,9,10,11]
        dimension_1 = choice(num_range)
        num_range.remove(dimension_1)
        dimension_2 = choice(num_range)
        num_range.remove(dimension_2)
        dimension_3 = choice(num_range)
        num_range.remove(dimension_3)
        dimension_4 = choice(num_range)
        
        #deciding object orientations
        shape_1_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_1_orientation_choice = 1
        shape_2_orientation_choice = choice([0,1])
        #DEBUG LINE
        #shape_2_orientation_choice = 1
        #For Rectangles
        if mode == 0:
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
        #For Triangles
        if mode == 1:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is positioned with the point facing up"
                shape_2_orientation = "to the bottom"
            else:
                shape_1_orientation = "is positioned with the point facing down"
                shape_2_orientation = "to the top"
        #For Semicircles
        if mode == 2:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is positioned with the curve opening up (like a smile)"
                shape_2_orientation = "to the top"
            else:
                shape_1_orientation = "is positioned with the curve opening down (like a frown)"
                shape_2_orientation = "to the bottom"
        #For Trapezoids
        if mode == 3:
            if shape_1_orientation_choice == 0:
                shape_1_orientation = "is placed with the shorter parallel side on top"
            else:
                shape_1_orientation = "is placed with the longer parallel side on top"
            if shape_2_orientation_choice == 0:
                shape_2_orientation = "to the top"
            else:
                shape_2_orientation = "to the bottom"
                
    #Choices for a circle with a portion removed
    else:
        shape_1 = "circle has had a 90 degree slice removed"
        shape_1_short = "circle"
        
        #Choose a second shape
        shapes = ["square","triangle"]
        shape_2_index = choice([0,1])
        #DEBUG LINE
        #shape_2_index = 1
        shape_2 = shapes[shape_2_index]
        
        #choose some dimensions
        num_range = [3,4,5,6,7,8,9,10,11]
        dimension_1 = choice(num_range)
        num_range.remove(dimension_1)
        dimension_2 = choice(num_range)
        num_range.remove(dimension_2)
        dimension_3 = choice(num_range)
        
        shape_1_orientation_choice = choice([0,1,2,3])
        #DEBUG LINE
        #shape_1_orientation_choice = 3
        if shape_1_orientation_choice == 0:
            shape_1_orientation = "from the top right portion of the circle"
        elif shape_1_orientation_choice == 1:
            shape_1_orientation = "from the top left portion of the circle"
        elif shape_1_orientation_choice == 2:
            shape_1_orientation = "from the bottom right portion of the circle"
        else:
            shape_1_orientation = "from the bottom left portion of the circle"
        shape_2_orientation = "to the missing section"
    
        
    #Compute Areas
    #rectangles and ___
    if mode == 0:
        long_side = max(dimension_1,dimension_2)
        short_side = min(dimension_1,dimension_2)
        #longest side vertical
        if shape_1_orientation_choice == 0:
            #triangles
            if shape_2_index == 0:
                dimensions = "the rectangle has base " + str(short_side) +" and height " + str(long_side) + " and the triangle has altitude " + str(dimension_3)
                formula = "bh_1 + \\frac{1}{2}bh_2"
                total_area = short_side*long_side + 1/2*short_side*dimension_3
            #semicircles
            elif shape_2_index == 1:
                dimensions = "the rectangle has base " + str(short_side) + " and height " + str(long_side)
                formula = "bh + \\frac{1}{2}\\pi r^2"
                total_area = short_side*long_side + 1/2*math.pi*(short_side/2)**2
            #trapezoids
            else:
                dimensions = "the rectangle has base " + str(short_side) + " and height " + str(long_side) + "; the trapezoid has altitude " + str(dimension_3) + ", and the other parallel side of the trapezoid is " + str(dimension_4)
                formula = "b_1 h_1 + \\frac{1}{2}\\left(b_1 + b_2\\right)h_2"
                total_area = short_side*long_side + 1/2*(short_side + dimension_4)*dimension_3
        #longest size horizontal
        else:
            #triangles
            if shape_2_index == 0:
                dimensions = "the rectangle has base " + str(long_side) +" and height " + str(short_side) + " and the triangle has altitude " + str(dimension_3)
                formula = "bh_1 + \\frac{1}{2}h_1(altitude)"
                total_area = long_side*short_side + 1/2*short_side*dimension_3
            #semicircles
            elif shape_2_index == 1:
                dimensions = "the rectangle has base " + str(long_side) + " and height " + str(short_side)
                formula = "bh + \\frac{1}{2}\\pi r^2"
                total_area = long_side*short_side + 1/2*math.pi*(short_side/2)**2
            #trapezoids
            else:
                dimensions = "the rectangle has base " + str(long_side) + " and height " + str(short_side) + "; the trapezoid has altitude " + str(dimension_3) + ", and the other parallel side of the trapezoid is " + str(dimension_4)
                formula = "b_1 h_1 + \\frac{1}{2}\\left(h_1 + (other side)\\right)\\cdot altitude"
                total_area = long_side*short_side + 1/2*(short_side + dimension_4)*dimension_3
    #triangles and ______
    elif mode == 1:
        #rectangles
        if shape_2_index == 0:
            dimensions = "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2) +", and the rectangle has height " + str(dimension_3)
            formula = "\\frac{1}{2}b h_1 + b h_2"
            total_area = 1/2*dimension_1*dimension_2 + dimension_1*dimension_3
        #semicircles
        elif shape_2_index == 1:
            dimensions = "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2)
            formula = "\\frac{1}{2}b h + \\frac{1}{2}\\pi r^2"
            total_area = 1/2*dimension_1*dimension_2 + 1/2*math.pi*(dimension_1/2)**2
        #trapezoids
        else:
            dimensions = "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2) + "; the trapezoid has altitude " + str(dimension_3) + ", and the other parallel side of the trapezoid is " + str(dimension_4)
            formula = "\\frac{1}{2}b_1 h_1 + \\frac{1}{2}\\left(b_1 + b_2\\right)h_2"
            total_area = 1/2*dimension_1*dimension_2 + 1/2*(dimension_1 + dimension_4)*dimension_3
    #semicircles and ______
    elif mode == 2:
        #rectangles
        if shape_2_index == 0:
            dimensions =  "the semicircle has radius " + str(dimension_1) + " and the rectangle has height " + str(dimension_2)
            formula = "\\frac{1}{2}\\pi r^2 + b h"
            total_area = 1/2*math.pi*(dimension_1)**2 + 2*dimension_1*dimension_2
        #triangles
        elif shape_2_index == 1:
            dimensions = "the semicircle has radius " + str(dimension_1) + " and the triangle has height " + str(dimension_2)
            formula = "\\frac{1}{2}\\pi r^2 + \\frac{1}{2}b h"
            total_area = 1/2*math.pi*(dimension_1)**2 + dimension_1*dimension_2
        #trapezoids
        else:
            dimensions = "the semicircle has radius " + str(dimension_1) + "; the trapezoid has altitude " + str(dimension_2) + ", and the other parallel side of the trapezoid is " + str(dimension_3)
            formula = "\\frac{1}{2}\\pi r^2 + \\frac{1}{2}\\left(b_1 + b_2\\right)h"
            total_area = 1/2*math.pi*(dimension_1)**2 + 1/2*(2*dimension_1 + dimension_3)*dimension_2
    #trapezoids and ______
    elif mode == 3:
        long_side = max(dimension_1,dimension_2)
        short_side = min(dimension_1,dimension_2)
        #short side on top
        if shape_1_orientation_choice == 0:
            #second shape on top
            if shape_2_orientation_choice == 0:
                #rectangles
                if shape_2_index == 0:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_2 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + short_side*dimension_4
                #triangles
                elif shape_2_index == 1:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_2 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*short_side*dimension_4
                #semicircles
                else:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*math.pi*(short_side/2)**2
            #second object on bottom
            else:
                #rectangles
                if shape_2_index == 0:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_1 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + long_side*dimension_4
                #triangles
                elif shape_2_index == 1:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_1 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*long_side*dimension_4
                #semicircles
                else:
                    dimensions = "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + ", and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*math.pi*(long_side/2)**2
        #long side on top
        else:
            #second object on top
            if shape_2_orientation_choice == 0:
                #rectangles
                if shape_2_index == 0:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_2 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + long_side*dimension_4
                #triangles
                elif shape_2_index == 1:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_2 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*long_side*dimension_4
                #semicircles
                else:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*math.pi*(long_side/2)**2
            #second object on bottom
            else:
                #rectangles
                if shape_2_index == 0:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_1 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + short_side*dimension_4
                #triangles
                elif shape_2_index == 1:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_1 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*short_side*dimension_4
                #semicircles
                else:
                    dimensions = "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + ", and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*math.pi*(short_side/2)**2
    #circle with a 90 degree slice removed and ___
    else:
        dimensions = "The circle has radius " + str(dimension_1)
        #square
        if shape_2_index == 0:
            formula = "\\frac{3}{4}\\pi r^2 + s^2"
            total_area = 3/4*math.pi*dimension_1**2 + dimension_1**2
        #triangle
        else:
            formula = "\\frac{3}{4}\\pi r^2 + \\frac{1}{2}bh"
            total_area = 3/4*math.pi*dimension_1**2 + 1/2*dimension_1**2

        
    #clean up the total area
    total_area_approx = round(total_area,2)
    total_area_string = str(total_area_approx)
        
    #choice of units
    unit_choices = [("inches","in"), ("feet","ft"), ("millimeters","mm"), ("centimeters","cm"), ("meters","m"), ("miles","mi"), ("kilometers","km")]
    unit_choice = choice(unit_choices)
    units_long = unit_choice[0]
    units_short = unit_choice[1]
        
    return {
        "shape_1": shape_1,
        "shape_1_short": shape_1_short,
        "shape_1_orientation": shape_1_orientation,
        "shape_2": shape_2,
        "shape_2_orientation": shape_2_orientation,
        "dimensions": dimensions,
        "formula": formula,
        "total_area": total_area_string,
        "units_long": units_long,
        "units_short": units_short,
    }