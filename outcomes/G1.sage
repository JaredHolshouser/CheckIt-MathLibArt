def generator():
    
    #Choose a first object
    first_objects = [
        "rectangle",
        "triangle",
        "semicircle",
        "circle has had a 90 degree slice removed",
        "trapezoid",
    ]
    object_1 = choice(first_objects)
    if object_1 == "circle has had a 90 degree slice removed":
        object_1_short = "circle"
    else:
        object_1_short = object_1
    
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
    #rectangle orientations
    if object_1 == "rectangle":
        object_1_orientation = choice(["stands with it's longest side vertical", "stands with it's longest side horizontal"])
        if object_1_orientation == "stands with it's longest side vertical":
            #second objection orientation
            object_2_orientation = choice(["to the top", "to the bottom"])
        else:
            #second objection orientation
            object_2_orientation = choice(["to the right side", "to the left side"])
    #triangle orientations
    elif object_1 == "triangle":
        object_1_orientation = choice(["is positioned with the point facing up", "is positioned with the point facing down"])
        if object_1_orientation == "is positioned with the point facing up":
            #second objection orientation
            object_2_orientation = "to the bottom"
        else:
            #second objection orientation
            object_2_orientation = "to the top"
    #semicircle orientations
    elif object_1 == "semicircle":
        object_1_orientation = choice(["is positioned with the curve facing up", "is positioned with the curve facing down"])
        if object_1_orientation == "is positioned with the curve facing up":
            #second objection orientation
            object_2_orientation = "to the bottom"
        else:
            #second objection orientation
            object_2_orientation = "to the top"
    #trapezoid orientations
    elif object_1 == "trapezoid":
        object_1_orientation = choice(["is placed with the shorter parallel side on top", "is placed with the longer parallel side on top"])
        #second objection orientation
        object_2_orientation = choice(["to the top", "to the bottom"])
    #circle with slice removed orientations
    else:
        object_1_orientation = choice(["from the top right portion of the circle", "from the top left portion of the circle", "from the bottom right portion of the circle", "from the bottom left portion of the circle"])
        object_2_orientation = "to the missing section"
        

    #Choose a second object
    if object_1 == "rectangle":
        object_2 = choice(["triangle","semicircle","trapezoid"])
    elif object_1 == "triangle":
        object_2 = choice(["semicircle","trapezoid","rectangle"])
    elif object_1 == "semicircle":
        object_2 = choice(["trapezoid","rectangle","triangle"])
    elif object_1 == "trapezoid":
        object_2 = choice(["rectangle","triangle","semicircle"])
    else:
        object_2 = choice(["square","triangle"])
        
    #Compute Areas
    #rectangles and ___
    if object_1 == "rectangle":
        long_side = max(dimension_1,dimension_2)
        short_side = min(dimension_1,dimension_2)
        #longest side vertical
        if object_1_orientation == "stands with it's longest side vertical":
            #triangles
            if object_2 == "triangle":
                dimensions = "the rectangle has base " + str(short_side) +" and height " + str(long_side) + " and the triangle has altitude " + str(dimension_3)
                formula = "bh_1 + \\frac{1}{2}bh_2"
                total_area = short_side*long_side + 1/2*short_side*dimension_3
            #semicircles
            elif object_2 == "semicircle":
                dimensions = "the rectangle has base " + str(short_side) + " and height " + str(long_side)
                formula = "bh + \\frac{1}{2}\\pi r^2"
                total_area = short_side*long_side + 1/2*math.pi*(short_side/2)**2
            #trapezoids
            else:
                dimensions = "the rectangle has base " + str(short_side) + " and height " + str(long_side) + ", and the trapezoid has altitude " + str(dimension_3) + " and the other parallel side of the trapezoid is " + str(dimension_4)
                formula = "b_1 h_1 + \\frac{1}{2}\\left(b_1 + b_2\\right)h_2"
                total_area = short_side*long_side + 1/2*(short_side + dimension_4)*dimension_3
        #longest size horizontal
        else:
            #triangles
            if object_2 == "triangle":
                dimensions = "the rectangle has base " + str(long_side) +" and height " + str(short_side) + " and the triangle has altitude " + str(dimension_3)
                formula = "bh_1 + \\frac{1}{2}h_1(altitude)"
                total_area = long_side*short_side + 1/2*short_side*dimension_3
            #semicircles
            elif object_2 == "semicircle":
                dimensions = "the rectangle has base " + str(long_side) + " and height " + str(short_side)
                formula = "bh + \\frac{1}{2}\\pi r^2"
                total_area = long_side*short_side + 1/2*math.pi*(short_side/2)**2
            #trapezoids
            else:
                dimensions = "the rectangle has base " + str(long_side) + " and height " + str(short_side) + ", and the trapezoid has altitude " + str(dimension_3) + " and the other parallel side of the trapezoid is " + str(dimension_4)
                formula = "b_1 h_1 + \\frac{1}{2}\\left(h_1 + (other side)\\right)\\cdot altitude"
                total_area = long_side*short_side + 1/2*(short_side + dimension_4)*dimension_3
    #triangles and ______
    elif object_1 == "triangle":
        #rectangles
        if object_2 == "rectangle":
            dimensions =  "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2) +", and the rectangle has height " + str(dimension_3)
            formula = "\\frac{1}{2}b h_1 + b h_2"
            total_area = 1/2*dimension_1*dimension_2 + dimension_1*dimension_3
        #semicircles
        elif object_2 == "semicircle":
            dimensions =  "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2)
            formula = "\\frac{1}{2}b h + \\frac{1}{2}\\pi r^2"
            total_area = 1/2*dimension_1*dimension_2 + 1/2*math.pi*(dimension_1/2)**2
        #trapezoids
        else:
            dimensions =  "the triangle has base " + str(dimension_1) + " and height " + str(dimension_2) + ", and the trapezoid has altitude " + str(dimension_3) + " and the other parallel side of the trapezoid is " + str(dimension_4)
            formula = "\\frac{1}{2}b_1 h_1 + \\frac{1}{2}\\left(b_1 + b_2\\right)h_2"
            total_area = 1/2*dimension_1*dimension_2 + 1/2*(dimension_1 + dimension_4)*dimension_3
    #semicircles and ______
    elif object_1 == "semicircle":
        #rectangles
        if object_2 == "rectangle":
            dimensions =  "the semicircle has radius " + str(dimension_1) + ", and the rectangle has height " + str(dimension_2)
            formula = "\\frac{1}{2}\\pi r^2 + b h"
            total_area = 1/2*math.pi*(dimension_1)**2 + 2*dimension_1*dimension_2
        #triangles
        elif object_2 == "triangle":
            dimensions =  "the semicircle has radius " + str(dimension_1) + ", and the triangle has height " + str(dimension_2)
            formula = "\\frac{1}{2}\\pi r^2 + \\frac{1}{2}b h"
            total_area = 1/2*math.pi*(dimension_1)**2 + dimension_1*dimension_2
        #trapezoids
        else:
            dimensions =  "the semicircle has radius " + str(dimension_1) + ", and the trapezoid has altitude " + str(dimension_2) + " and the other parallel side of the trapezoid is " + str(dimension_3)
            formula = "\\frac{1}{2}\\pi r^2 + \\frac{1}{2}\\left(b_1 + b_2\\right)h"
            total_area = 1/2*math.pi*(dimension_1)**2 + 1/2*(2*dimension_1 + dimension_3)*dimension_2
    #trapezoids and ______
    elif object_1 == "trapezoid":
        long_side = max(dimension_1,dimension_2)
        short_side = min(dimension_1,dimension_2)
        #short side on top
        if object_1_orientation == "is placed with the shorter parallel side on top":
            #second object on top
            if object_2_orientation == "to the top":
                #rectangles
                if object_2 == "rectangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_2 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + short_side*dimension_4
                #triangles
                elif object_2 == "triangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_2 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*short_side*dimension_4
                #semicircles
                else:
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*math.pi*(short_side/2)**2
            #second object on bottom
            else:
                #rectangles
                if object_2 == "rectangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_1 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + long_side*dimension_4
                #triangles
                elif object_2 == "triangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_1 h_2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*long_side*dimension_4
                #semicircles
                else:
                    dimensions =  "the bottom of the trapezoid has length " + str(long_side) + ", the top of the trapezoid has length " + str(short_side) + " and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(long_side + short_side)*dimension_3 + 1/2*math.pi*(long_side/2)**2
        #long side on top
        if object_1_orientation == "is placed with the longer parallel side on top":
            #second object on top
            if object_2_orientation == "to the top":
                #rectangles
                if object_2 == "rectangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_2 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + long_side*dimension_4
                #triangles
                elif object_2 == "triangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_2 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*long_side*dimension_4
                #semicircles
                else:
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*math.pi*(long_side/2)**2
            #second object on bottom
            else:
                #rectangles
                if object_2 == "rectangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3) + ", while the rectangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + b_1 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + short_side*dimension_4
                #triangles
                elif object_2 == "triangle":
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3) + ", while the triangle has height " + str(dimension_4)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}b_1 h_2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*short_side*dimension_4
                #semicircles
                else:
                    dimensions =  "the bottom of the trapezoid has length " + str(short_side) + ", the top of the trapezoid has length " + str(long_side) + " and the altitude is " + str(dimension_3)
                    formula = "\\frac{1}{2}\\left(b_1 + b_2\\right)h_1 + \\frac{1}{2}\\pi r^2"
                    total_area = 1/2*(short_side + long_side)*dimension_3 + 1/2*math.pi*(short_side/2)**2
    #circle with a 90 degree slice removed and ___
    else:
        dimensions = "The circle has radius " + str(dimension_1)
        #square
        if object_2 == "square":
            formula = "\\frac{3}{4}\\pi r^2 + s^2"
            total_area = 3/4*math.pi*dimension_1**2 + dimension_1**2
        #triangle
        if object_2 == "triangle":
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
        "object_1": object_1,
        "object_1_short": object_1_short,
        "object_1_orientation": object_1_orientation,
        "object_2": object_2,
        "object_2_orientation": object_2_orientation,
        "dimensions": dimensions,
        "formula": formula,
        "total_area": total_area_string,
        "units_long": units_long,
        "units_short": units_short,
    }