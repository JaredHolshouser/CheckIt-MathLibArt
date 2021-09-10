def generator():
    
    point_up_ascii_shapes = [
        "/\\",
        "_/\\",
        "/\\_",
        "_/\\_ ",
        "/|_",
        "_/|_",
        "_|\\",
        "_|\\_",
        "/‾\\",
        "_/‾\\",
        "/‾\\_",
        "_/‾\\_",
        "_|‾\\",
        "_|‾\\_",
        "/‾|_",
        "_/‾|_",
        "_|‾|_",
    ]
    
    point_down_ascii_shapes = [
        "\\/",
        "‾\\/",
        "\\/‾",
        "‾\\/‾",
        "\\|‾",
        "‾\\|‾",
        "‾|/",
        "‾|/‾",
        "\\_/",
        "‾\\_/",
        "\\_/‾",
        "‾\\_/‾",
        "\\_|‾",
        "‾\\_|‾",
        "‾|_/",
        "‾|_/‾",
        "‾|_|‾",
    ]
        
    gen_string = ""
    #decide up or down
    up_bool = choice([True,False])
    
    #decide length
    length = randrange(3,5)
    
    if up_bool:
        for i in range(length):
            gen_string += choice(point_up_ascii_shapes)

    else:
        for i in range(length):
            gen_string += choice(point_down_ascii_shapes)

    #removing double under and double over scores for clarity
    gen_string = gen_string.replace("__","_")
    gen_string = gen_string.replace("‾‾","‾")
            
    pieces = len(gen_string)
    
    gen_string_scale_counter = gen_string.replace("_","+1")
    gen_string_scale_counter = gen_string_scale_counter.replace("‾","+1")
    gen_string_scale_counter = gen_string_scale_counter.replace("|","+0")
    gen_string_scale_counter = gen_string_scale_counter.replace("/","+0.5")
    gen_string_scale_counter = gen_string_scale_counter.replace("\\","+0.5")
    
    scale = eval(gen_string_scale_counter)
    
    dimension = round(math.log(pieces)/math.log(scale),3)

        
    return {
        "gen_string": gen_string,
        "scale": scale,
        "pieces": pieces,
        "dimension": dimension,
    }