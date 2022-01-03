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
    
    #generate a random loan amount
    loan_amount = randrange(10,40)
    loan_amount *= 100
    loan_amount_string = f"${int(loan_amount):,}"
    
    #generate a random interest rate
    yearly_rate = randrange(6,19)
    
    #generate a random number of months
    months = randrange(4,15)
    
    #compute the accrued interest.
    accrued_interest_formula = str(loan_amount) + "(" + str(round(0.01*yearly_rate,2)) + "\\cdot \\frac{" + str(months) + "}{12})"
    accrued_interest = round(loan_amount*0.01*yearly_rate*months/12,2)
    accrued_interest_string = f"${float(accrued_interest):,}"
    
    #compute the payoff amount
    payoff_formula = loan_amount_string[1:] + " + " + accrued_interest_string[1:]
    payoff_amount = loan_amount + accrued_interest
    payoff_amount_string = f"${float(payoff_amount):,}"
    
    random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
    return {
        "scenario": {random_scenario: True},
        "loan_amount": loan_amount_string,
        "yearly_rate": yearly_rate,
        "name": name,
        "months": months,
        "accrued_interest_formula": accrued_interest_formula,
        "accrued_interest": accrued_interest_string,
        "payoff_formula": payoff_formula,
        "payoff_amount": payoff_amount_string
    }