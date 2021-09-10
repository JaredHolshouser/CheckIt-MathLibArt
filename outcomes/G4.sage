def generator():
        
    #generate the first shape
    #bank of upward pointing generators
    ascii_shapes = [
        "_/|_",
        "_|\\_",
        "_/‾|_",
        "_|‾\\_",
        "_/‾\\_",
        "/\\_",
        "/|_",
        "|\\_",
        "/‾|_",
        "|‾\\_",
        "/‾\\_",
        "_/\\",
        "_/|",
        "_|\\",
        "_/‾|",
        "_|‾\\",
        "_/‾\\",
        "/\\",
        "/|",
        "|\\",
        "/‾|",
        "|‾\\",
        "/‾\\",
        "|‾|",
        "‾\\/‾",
        "‾\\|‾",
        "‾|/‾",
        "‾\\_|‾",
        "‾|_/‾",
        "‾\\_/‾",
        "\\/‾",
        "\\|‾",
        "|/‾",
        "\\_|‾",
        "|_/‾",
        "\\_/‾",
        "‾\\/",
        "‾\\|",
        "‾|/",
        "‾\\_|",
        "‾|_/",
        "‾\\_/",
        "\\/",
        "\\|",
        "|/",
        "\\_|",
        "|_/",
        "\\_/",
        "|_|",
    ]
    
    gen_string_1 = choice(ascii_shapes)
    init_string_1 = ""
    for i in range(len(gen_string_1)):
        init_string_1 += "_"
    
    ascii_trees = [
        "-<",
        "-<-",
        "-<-<",
        "-<-<-",
        "-<-<-<",
        "-<-<-<-",
        ">-",
        "->-",
        ">->-",
        "->->-",
        ">->->-",
        "->->->-",
    ]
    gen_string_2 = choice(ascii_trees)
    init_string_2 = gen_string_2.replace("<","")
    init_string_2 = init_string_2.replace(">","")

        
    return {
        "gen_string_1": gen_string_1,
        "init_string_1": init_string_1,
        "gen_string_2": gen_string_2,
        "init_string_2": init_string_2,
    }