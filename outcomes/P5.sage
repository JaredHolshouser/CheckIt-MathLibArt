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
        #generate a number of spots in the roulette wheel
        k = randrange(8,32)
        #generate a number they want to roll
        n = randrange(k//4,k//2)
        #generate a bet amount
        bet = randrange(5,15)
        #generate a win amount
        win_amount = randrange(2*bet, 4*bet)
        #compute expected value
        expected_value = (n/k)*win_amount+(-1)*(bet)*(k-n)/k
        adjusted_expected_value = str(floor(100*expected_value))
        expected_value_computation = "\\frac{"+str(n)+"}{"+str(k)+"}("+str(win_amount)+") + \\frac{"+str(k-n)+"}{"+str(k)+"}(-"+str(bet)+")"
        #format the string
        adjusted_expected_value = str(floor(100*expected_value))
        if expected_value <= -1:
            expected_value_string = adjusted_expected_value[0] + "$"+ adjusted_expected_value[1:-2] + "." + adjusted_expected_value[-2:]
        elif expected_value > -1 and expected_value <=0:
            expected_value_string = adjusted_expected_value[0] + "$0"+ adjusted_expected_value[1:-2] + "." + adjusted_expected_value[-2:]
        elif expected_value > 0 and expected_value < 1:
            expected_value_string = "$0"+ adjusted_expected_value[0:-2] + "." + adjusted_expected_value[-2:]
        else:
            expected_value_string = "$"+ adjusted_expected_value[0:-2] + "." + adjusted_expected_value[-2:]
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
        adjusted_expected_value = str(floor(100*expected_value))
        if expected_value < 1:
            expected_value_string = "$0"+ adjusted_expected_value[0:-2] + "." + adjusted_expected_value[-2:]
        else:
            expected_value_string = "$"+ adjusted_expected_value[0:-2] + "." + adjusted_expected_value[-2:]
        
        return {
            "scenario": {random_scenario: True},
            "name": name,
            "k": k,
            "n": n,
            "r": r,
            "expected_value": expected_value_string,
            "expected_value_computation": expected_value_computation,
        }