def generator():
    
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

    #generate a scenario
    random_scenario = choice(["phrasing1","phrasing2"])
    
    if random_scenario == "phrasing1":
        #generate a number of sides for the die
        k = randrange(4,20)
        #generate a number they want to roll
        n = randrange(1,k)
        #generate a bet amount
        bet = randrange(5,15)
        #generate a win amount
        win_amount = randrange(2*bet, 4*bet)
        #compute expected value
        expected_value = round((1/k)*win_amount+(-1)*(bet)*(k-1)/k,2)
        expected_value_computation = "\\frac{1}{"+str(k)+"}("+str(win_amount)+") + \\frac{"+str(k-1)+"}{"+str(k)+"}(-"+str(bet)+")"
        #format the string
        if expected_value < 0:
            expected_value_string = "-"+f"${float(abs(expected_value)):,}"
        else:
            expected_value_string = f"${float(expected_value):,}"
        return {
            "scenario": {random_scenario: True},
            "name": name,
            "k": k,
            "n": n,
            "bet": bet,
            "win_amount": win_amount,
            "expected_value": expected_value_string,
            "expected_value_computation": expected_value_computation,
            }
        
    if random_scenario == "phrasing2":
        #generate a number of cookies
        k = randrange(10,25)
        #generate a number of 5 off cookies
        n = randrange(2,5)
        #generate a number of 1 off cookies
        x = k-n
        r = randrange (3,max(k-n-5,4))
        #compute expected value
        expected_value = round((n/k)*5+(r/k)*1,2)
        expected_value_computation = "\\frac{"+str(n)+"}{"+str(k)+"}(5) + \\frac{"+str(r)+"}{"+str(k)+"}(1) + 0"
        #format the string
        if expected_value < 0:
            expected_value_string = "-"+f"${float(abs(expected_value)):,}"
        else:
            expected_value_string = f"${float(expected_value):,}"
        
        return {
            "scenario": {random_scenario: True},
            "name": name,
            "k": k,
            "n": n,
            "r": r,
            "expected_value": expected_value_string,
            "expected_value_computation": expected_value_computation,
        }