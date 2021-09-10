def generator():

    #decide if order matters
    letter_repeat_bool = choice([True,False])
    if letter_repeat_bool:
        letter_repeat = "can"
    else:
        letter_repeat = "can't"
    digit_repeat_bool = choice([True,False])
    if digit_repeat_bool:
        digit_repeat = "can"
    else:
        digit_repeat = "can't"

    #choose between the scenarios
    random_scenarios = ["phrasing1", "phrasing2", "phrasing3"]
    scenario_choice = randint(0,2)
    random_scenario = random_scenarios[scenario_choice]

    #initiate the box diagram
    box_diagram = []

    #passwords
    if scenario_choice == 0:
        #choose a password situation
        password_situations = [
            "your bank website",
            "your school website",
            "your insurance website",
            "your school laptop",
            "your work computer",
            "your student loan website",
        ]
        context = choice(password_situations)

        #choose password amounts
        letter_amount = randrange(5,9)
        digit_amount = randrange(2,4)

        #build the box diagram
        if letter_repeat_bool:
            for i in range(letter_amount):
                box_diagram.append(26)
        else:
            for i in range(letter_amount):
                box_diagram.append(26 - i)
        if digit_repeat_bool:
            for i in range(digit_amount):
                box_diagram.append(10)
        else:
            for i in range(digit_amount):
                box_diagram.append(10 - i)
        box_diagram.append(33)

    #license plates
    elif scenario_choice == 1:
        #choose a fictional place
        fictional_places = [
            "Foglaunia",
            "Ugrecia",
            "Utreau",
            "Kuswos",
            "Clonia",
            "Smurhiel",
            "Epros",
            "Oclad",
            "Fleyt Strain",
            "Griyl Fren",
            "Yugraivania",
            "Peswaeye",
            "Detrua",
            "Ushon",
            "Flueles",
            "Priodal",
            "Eshain",
            "Uspein",
            "Sniar Plos",
            "Fliod Clium",
        ]
        context = choice(fictional_places)

        #choose licence plate amounts
        letter_amount = randrange(2,5)
        digit_amount = randrange(3,6)

        #build the box diagram
        if letter_repeat_bool:
            for i in range(letter_amount):
                box_diagram.append(26)
        else:
            for i in range(letter_amount):
                box_diagram.append(26 - i)
        if digit_repeat_bool:
            for i in range(digit_amount):
                box_diagram.append(10)
        else:
            for i in range(digit_amount):
                box_diagram.append(10 - i)

    #id cards
    else:
        #choose an id setting
        id_settings = [
            "school id card",
            "state id card",
            "gym membership card",
            "golf course membership card",
            "driver's license",
            "hunting license",
            "pilot's license",
        ]
        context = choice(id_settings)

        #choose id amounts
        digit_amount = randrange(5,10)
        letter_amount = randrange(2,5)

        #build the box diagram
        box_diagram.append(4)
        if digit_repeat_bool:
            for i in range(digit_amount):
                box_diagram.append(10)
        else:
            for i in range(digit_amount):
                box_diagram.append(10 - i)
        if letter_repeat_bool:
            for i in range(letter_amount):
                box_diagram.append(26)
        else:
            for i in range(letter_amount):
                box_diagram.append(26 - i)


    #create the rest of the answer using the box diagram
    total_amount = len(box_diagram)
    answer = 1
    slot_string = ""
    for i in range(total_amount):
        answer *= box_diagram[i]
        slot_string += "[" + str(box_diagram[i]) + "]"

    #return all the things
    return {
        "scenario": {random_scenario: True},
        "context": context,
        "letter_amount": letter_amount,
        "digit_amount": digit_amount,
        "letter_repeat": letter_repeat,
        "digit_repeat": digit_repeat,
        "total_amount": total_amount,
        "slot_string": slot_string,
        "answer": answer,
    }