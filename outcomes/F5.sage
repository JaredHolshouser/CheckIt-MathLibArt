def generator():
    
    # 1 -> car, 2 -> student loans, 3 -> mortgages
    random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
    #generate a random loan duration
    if random_scenario == "phrasing1":
        time_span = randrange(3,10)
    if random_scenario == "phrasing2":
        temp = randrange(1, 4)
        time_span = temp*5
    if random_scenario == "phrasing3":
        temp = randrange(3,6)
        time_span = temp*5
    
    #generate a random borrowed amount
    desired_amount = randrange(15,40)
    if random_scenario == "phrasing1":
        desired_amount *= 1000
    if random_scenario == "phrasing2":
        desired_amount *= 5000
    if random_scenario == "phrasing3":
        desired_amount *= 10000
    desired_amount_string = f"${int(desired_amount):,}"
    
    #generate a random interest rate
    yearly_rate = randrange(33,55)
    yearly_rate_rounded = round(yearly_rate*.1,2)
    yearly_rate_decimal = yearly_rate*.001
    
    #generate a down payment amount
    down_payment = choice([5,10,15,20])
    down_payment_decimal = down_payment*.01
    
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
    
    
    #Computing the monthly payment using the formula for amortized loans
    monthly_rate = yearly_rate_decimal/12
    compounding_periods = time_span*12
    if random_scenario == "phrasing3":
        amount = round(desired_amount - down_payment_decimal*desired_amount,2)
        monthly_payment_formula = "\\frac{" + str(amount) + "(\\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})}{1 - (1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})^{-12 \\cdot " + str(time_span) + "}}"
        monthly_payment = (amount*monthly_rate)/(1 - (1 + monthly_rate)^(-1*compounding_periods))
    else:
        monthly_payment_formula = "\\frac{" + str(desired_amount) + "(\\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})}{1 - (1 + \\frac{" + str(round(yearly_rate_decimal,3)) + "}{12})^{-12 \\cdot " + str(time_span) + "}}"
        monthly_payment = (desired_amount*monthly_rate)/(1 - (1 + monthly_rate)^(-1*compounding_periods))
    
    rounded_monthly_payment = round(monthly_payment*1.0, 2)
    monthly_payment_string = f"${float(rounded_monthly_payment):,}"
    
    #Computing the total paid
    total_paid_formula = str(rounded_monthly_payment) + "\\cdot 12 \\cdot" + str(time_span)
    total_paid = round(rounded_monthly_payment*time_span*12.0,2)
    total_paid_string = f"${float(total_paid):,}"
    
    #Computing the accrued interest
    if random_scenario == "phrasing3":
        interest_formula = str(total_paid) + " - " + str(amount)
        accrued_interest = round((total_paid - amount)*1.0,2)
        accrued_interest_string = f"${float(accrued_interest):,}"
    else:
        interest_formula = str(total_paid) + " - " + str(desired_amount)
        accrued_interest = round((total_paid - desired_amount)*1.0,2)
        accrued_interest_string = f"${float(accrued_interest):,}"

    return {
        "scenario": {random_scenario: True},
        "time_span": time_span,
        "loan_amount": desired_amount_string,
        "yearly_rate": yearly_rate_rounded,
        "down_payment": down_payment,
        "name": name,
        "monthly_payment_formula": monthly_payment_formula,
        "monthly_payment": monthly_payment_string,
        "total_paid_formula": total_paid_formula,
        "total_paid": total_paid_string,
        "interest_formula": interest_formula,
        "accrued_interest": accrued_interest_string
    }
