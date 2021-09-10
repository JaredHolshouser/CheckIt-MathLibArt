def generator():
    #generate a random starting age
    start_age = randrange(25,41)
    
    #generate a random retirement age
    time_span = randrange(25,41)
    end_age = start_age+time_span
    
    #generate a random retirement amount
    desired_amount = randrange(15,40)
    desired_amount *= 100000
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
    
    #Generate a fake company name
    companies = [
        "Gutkowski, Gaylord and Stroman",
        "Senger, Murray and Konopelski",
        "Steuber LLC",
        "Kessler, Jakubowski and Hettinger",
        "Reichert, Conn and Bode",
        "Leannon Inc",
        "Hodkiewicz-Johns",
        "Dooley, Stark and Hintz",
        "Spencer, Mills and Mosciski",
        "Oberbrunner-Stoltenberg",
        "West LLC",
        "Howe-Effertz",
        "Wunsch and Sons",
        "Jaskolski, Durgan and Greenholt",
        "Quitzon, Glover and Lueilwitz",
    ]
    company = choice(companies)
    
    #Choose between annuities
    instruments = [
        "401k",
        "403b",
        "retirement fund",
    ]
    instrument_number = randrange(0,3)
    instrument = instruments[instrument_number]
    
    #Computing the monthly payment using the present value formula for annuites
    monthly_rate = yearly_rate_decimal/12
    compounding_periods = (end_age-start_age)*12
    monthly_payment = (desired_amount*monthly_rate)/((1 + monthly_rate)^compounding_periods-1)
    
    rounded_monthly_payment = round(monthly_payment*1.0, 2)
    monthly_payment_string = f"${float(rounded_monthly_payment):,}"
    
    #Computing the total contribution
    total_contribution = round(rounded_monthly_payment*time_span*12.0,2)
    total_contribution_string = f"${float(total_contribution):,}"
    
    #Computing the accrued interest
    accrued_interest = round((desired_amount - total_contribution)*1.0,2)
    accrued_interest_string = f"${float(accrued_interest):,}"

    random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
    return {
        "scenario": {random_scenario: True},
        "start_age": start_age,
        "end_age": end_age,
        "desired_amount": desired_amount_string,
        "yearly_rate": yearly_rate_rounded,
        "name": name,
        "company": company,
        "instrument": instrument,
        "monthly_payment": monthly_payment_string,
        "total_contribution": total_contribution_string,
        "accrued_interest": accrued_interest_string
    }
