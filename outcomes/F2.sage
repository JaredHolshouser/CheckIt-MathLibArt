def generator():
    #generate a random problme type 1 -> future value, 2 -> present value
    random_scenario = choice(["phrasing1", "phrasing2"])

    #generate a random interest rate
    yearly_rate = randrange(23,55)
    yearly_rate_rounded = round(yearly_rate*.1,2)
    yearly_rate_decimal = yearly_rate*.001
    
    #generate a random number of years
    years = randrange(3,17)
    
    #generate a random amount to invest
    amount_seed = randrange(20,270)
    amount = amount_seed*10
    amount_string = f"${amount}"
    
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
    
    #generate a random compounding period
    periods = ["monthly", "annually", "quarterly", "semiannually", "weekly"]
    period = choice(periods)
    
    if period =="monthly":
        n=12
    if period =="annually":
        n=1
    if period =="quarterly":
        n=4
    if period =="semiannually":
        n=2
    if period =="weekly":
        n=52
    
    #Future Value Answers
    if random_scenario == "phrasing1":
        final_amount_formula = str(amount) + "(1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{" + str(n) + "})^{" + str(n) + "\\cdot " + str(years) + "}"
        final_amount = round(amount*((1+yearly_rate_decimal/n)^(n*years)),2)
        interest_formula = str(final_amount) + " - " + str(amount)
        interest = round((final_amount - amount)*1.0,2)
    #Present Value Answers
    if random_scenario == "phrasing2":
        final_amount_formula = "\\frac{" + str(amount) + "}{(1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{" + str(n) + "})^{" + str(n) + "\\cdot " + str(years) + "}}"
        final_amount = round(amount/((1+yearly_rate_decimal/n)^(n*years)),2)
        interest_formula = str(amount) + " - " + str(final_amount)
        interest = round((amount - final_amount)*1.0,2)
    
    accrued_interest_string = f"${float(interest):,}"
    final_amount_string = f"${float(final_amount):,}"
        
    return {
        "scenario": {random_scenario: True},
        "yearly_rate": yearly_rate_rounded,
        "years": years,
        "name": name,
        "amount_string": amount_string,
        "period": period,
        "final_amount_formula": final_amount_formula,
        "final_amount": final_amount_string,
        "interest_formula": interest_formula,
        "accrued_interest_string": accrued_interest_string
    }