def generator():
    #generate a random problme type
    random_scenario = choice(["phrasing1", "phrasing2"])

    #generate a random interest rate
    yearly_rate = randrange(23,55)
    yearly_rate_rounded = round(yearly_rate*.1,2)
    yearly_rate_decimal = yearly_rate*.001
    
    #generate a random number of years
    years = randrange(17,37)
    
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
    
    #for the retirement scenario
    if random_scenario == "phrasing1":
        #generate a monthly withdrawal amount
        monthly_amount_seed = randrange(12,25)
        monthly_amount = round(monthly_amount_seed*100.00,0)
        monthly_amount_string = f"${monthly_amount:,}"
        
        #compute total amount needed to retire
        answer_formula = "\\frac{" + str(monthly_amount) + "(1 - (1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})^{-12 \\cdot " + str(years) + "})}{(\\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})}"
        amount = round((monthly_amount * (1-(1+yearly_rate_decimal/12)^(-12*years)))/(yearly_rate_decimal/12),2)
        amount_string = f"${float(amount):,}"

    #for the scholarship scenario
    if random_scenario == "phrasing2":
        #generate an initial amount
        amount_seed = randrange(23,34)
        amount = round(amount_seed*10000.00,0)
        amount_string = f"${amount:,}"
        
        #compute the yearly award
        answer_formula = "\\frac{" + str(amount) + "(\\frac{" + str(round(yearly_rate_decimal,3)) + "}{1})}{1 - (1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{1})^{-1 \\cdot " + str(years) + "}}"
        monthly_amount = round((amount*(yearly_rate_decimal/1))/((1+yearly_rate_decimal/1)^(-1*years)),2)
        monthly_amount_string = f"${float(monthly_amount):,}"
        
    return {
        "scenario": {random_scenario: True},
        "rate": yearly_rate_rounded,
        "years": years,
        "name": name,
        "answer_formula": answer_formula,
        "amount_string": amount_string,
        "monthly_amount": monthly_amount_string

    }