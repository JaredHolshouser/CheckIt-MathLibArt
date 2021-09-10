def generator():
    #generate a random symmetry
    symmetry = choice(["rotational", "reflectional", "translational"])
    shapes = choice(["pentagons and triangles", "squares and triangles", "hexagons and triangles", "squares, triangles, and pentagons", "rectangles and squares"])
        
    return {
        "shape":shapes,
        "symmetry":symmetry
    }