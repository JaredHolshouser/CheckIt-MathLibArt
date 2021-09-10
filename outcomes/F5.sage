def generator():
    
    random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
    #generate a random loan duration
    if random_scenario == "phrasing1":
        time_span = randrange(3,7)
    if random_scenario == "phrasing2":
        time_span = randrange(5,20)
    if random_scenario == "phrasing3":
        time_span = randrange(15,30)
    
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
    
    
    #Computing the monthly payment using the present value formula for annuites
    monthly_rate = yearly_rate_decimal/12
    compounding_periods = time_span*12
    if random_scenario == "phrasing3":
        amount = desired_amount - (0.15)*desired_amount
        monthly_payment = (desired_amount*monthly_rate)*((1+monthly_rate)^compounding_periods)/((1 + monthly_rate)^compounding_periods-1)
    else:
        monthly_payment = (desired_amount*monthly_rate)*((1+monthly_rate)^compounding_periods)/((1 + monthly_rate)^compounding_periods-1)
    
    rounded_monthly_payment = round(monthly_payment*1.0, 2)
    monthly_payment_string = f"${float(rounded_monthly_payment):,}"
    
    #Computing the total paid
    total_paid = round(rounded_monthly_payment*time_span*12.0,2)
    total_paid_string = f"${float(total_paid):,}"
    
    #Computing the accrued interest
    accrued_interest = round((total_paid - desired_amount)*1.0,2)
    accrued_interest_string = f"${float(accrued_interest):,}"

    return {
        "scenario": {random_scenario: True},
        "time_span": time_span,
        "loan_amount": desired_amount_string,
        "yearly_rate": yearly_rate_rounded,
        "name": name,
        "monthly_payment": monthly_payment_string,
        "total_paid": total_paid_string,
        "accrued_interest": accrued_interest_string
    }
