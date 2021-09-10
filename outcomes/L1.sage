def generator():
    #Array of different contexts to plug into the evaluated statement.
    contexts1 = [
        "it is raining today",
        "it is hot today",
        "it is below freezing today",
        "campus is closed",
        "campus is open",
        "I wake up on time",
        "there is no traffic today",
        "I slept well last night",
        "I slept poorly last night",
        "everybody is laid back",
        "everybody is stressed",
    ]
    contexts2 = [
        "I am in a good mood",
        "I am in a bad mood",
        "time marches on",
        "I do the dishes",
        "I take out the trash",
        "I exercise regularly",
        "I have a healthy diet",
        "I have an unhealthy diet",
        "class is cancelled",
        "class is in session",
    ]
    
    part_1 = choice(contexts1)
    part_2 = choice(contexts2)
    
    #Connecting the context with and, or, or if...then...
    connector_choice = randint(1,3)
    if connector_choice == 1:
        statement_1 = part_1 + " and " + part_2
    if connector_choice == 2:
        statement_1 = part_1 + " or " + part_2
    if connector_choice == 3:
        statement_1 = "if " + part_1 + ", then " + part_2
        
    #Generating random truth values
    truth_value_1 = choice([True, False])
    truth_value_2 = choice([True, False])
    
    #Computing the truth value of the statement
    if connector_choice == 1:
        truth_value = truth_value_1 and truth_value_2
    if connector_choice == 2:
        truth_value = truth_value_1 or truth_value_2
    if connector_choice == 3:
        truth_value = (not truth_value_1) or truth_value_2

    #Array of nouns
    nouns = [
        "aircraft",
        "bison",
        "cacti",
        "dwarves",
        "elves",
        "fish",
        "geese",
        "horses",
        "insects",
        "jackelopes",
        "kangaroos",
        "larvae",
        "mice",
        "nuclei",
        "octopuses",
        "phantoms",
        "quetzlcoatls",
        "ravens",
        "spiders",
        "tigers",
        "urchins",
        "venomous snakes",
        "waterbears",
        "xerus",
        "yellowfin tuna",
        "zebras",
    ]
    noun = choice(nouns)
    
    #Array of adjectives
    adjectives = [
        "angry",
        "benign",
        "curious",
        "denied",
        "extreme",
        "faithful",
        "great",
        "hairy",
        "inedible",
        "jumping",
        "keen",
        "lean",
        "massive",
        "nice",
        "obtuse",
        "pesky",
        "quixotic",
        "rowdy",
        "small",
        "tiny",
        "unflappable",
        "vile",
        "weak",
        "xenophobic",
        "yelling",
        "zoned out",
    ]
    adjective = choice(adjectives)
    
    #flip a coin to place a not (or not)
    coin_flip = randint(0,1)
    
    #choose a quantifier
    quantifier_choice = randint(1,3)
    
    if quantifier_choice == 1:
        if coin_flip == 0:
            statement_2 = "all " + noun + " are " + adjective
            negation = "some " + noun + " are not " + adjective
        if coin_flip == 1:
            statement_2 = "all " + noun + " are not " + adjective
            negation = "some " + noun + " are " + adjective
    if quantifier_choice == 2:
        if coin_flip == 0:
            statement_2 = "some " + noun + " are " + adjective
            negation = "all " + noun + " are not " + adjective
        if coin_flip == 1:
            statement_2 = "some " + noun + " are not " + adjective
            negation = "all " + noun + " are " + adjective
    if quantifier_choice == 3:
        if coin_flip == 0:
            statement_2 = "no " + noun + " are " + adjective
            negation = "some " + noun + " are " + adjective
        if coin_flip == 1:
            statement_2 = "no " + noun + " are not " + adjective
            negation = "some " + noun + " are not " + adjective
        
    return {
        "part_1": part_1,
        "part_2": part_2,
        "statement_1": statement_1,
        "truth_value_1": truth_value_1,
        "truth_value_2": truth_value_2,
        "truth_value": truth_value,
        "statement_2": statement_2,
        "negation": negation,
    }
