def generator():
    #generate a random number of to pick from
    n = randrange(5,15)
    
    #generate a random number to pick
    r = randrange(2,n)
    
    #generate a random diverse name
    names = [
        "Dennis",
        "Denise",
        "Catherine",
        "Blanca",
        "Roman",
        "Charles",
        "Marie",
        "Lei",
        "Juan",
        "Yan",
        "Tao",
        "Natsu",
        "Kazuyo",
        "Nuriyah",
        "Firas",
        "Asmaa",
        "Bahiya",
        "Chovka",
        "Solta",
        "Kurbika",
        "Alia",
        "Fahtima",
        "Sara",
        "Rahul",
        "Kabir",
    ]
    name = choice(names)
    
    #Generate a fake school name
    schools = ["Woodcreek Academy",
        "Desert Winds Elementary",
        "the Central Conservatory",
        "the Grand Mountain Institute",
        "the Vista Charter School",
        "the Da Vinci Institute",
        "Spring Hill School"
        "Sandalwood Elementary",
        "Sierra University",
        "the Seal Bay Charter School",
    ]
    school = choice(schools)

    random_scenario = choice(["phrasing1", "phrasing1a", "phrasing2", "phrasing2a"])
    
    if random_scenario == "phrasing1":
        solution = binomial(n,r)
        solution_text = f"_{ {n} }C_{ {r} }"
        reason = "We are selecting " + str(r) + " from a total of " + str(n) + " possibilities (without repeats), and the order of the selections does not matter"
    if random_scenario == "phrasing1a":
        solution = binomial(n,r)
        solution_text = f"_{ {n} }C_{ {r} }"
        reason = "We are selecting " + str(r) + " from a total of " + str(n) + " possibilities (without repeats), and the order of the selections does not matter"
    if random_scenario == "phrasing2":
        solution = factorial(n)//factorial(n-r)
        solution_text = f"_{ {n} }P_{ {r} }"
        reason = "We are selecting " + str(r) + " from a total of " + str(n) + " possibilities (without repeats), and the order of the selections matters"
    if random_scenario == "phrasing2a":
        solution = factorial(n)//factorial(n-r)
        solution_text = f"_{ {n} }P_{ {r} }"
        reason = "We are selecting " + str(r) + " from a total of " + str(n) + " possibilities (without repeats), and the order of the selections matters"

    
    return {
        "scenario": {random_scenario: True},
        "n": n,
        "r": r,
        "Solution": solution,
        "Solution_text": solution_text,
        "name": name,
        "School": school,
        "reason": reason,
    }
