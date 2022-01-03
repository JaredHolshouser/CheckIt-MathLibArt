def generator():
    
    #choose a random dining option
    dining_options = [
        "formal dinner",
        "food truck",
        "fancy restaurant",
        "wedding",
        "pop-up restaurant",
        "bowling alley",
    ]
    dining_option = choice(dining_options)
    
    #choose a random npc title
    npc_titles = [
        "the local warlord",
        "the shopkeeper",
        "the king's advisor",
        "the gatekeeper",
        "the innkeeper",
        "the blacksmith",
        "the high priest",
    ]
    npc_title = choice(npc_titles)
    
    #three random amounts
    amounts = [randrange(2,5), randrange(2,3), randrange(2,4)]
    amount_1 = choice(amounts)
    amounts.remove(amount_1)
    amount_2 = choice(amounts)
    amounts.remove(amount_2)
    amount_3 = amounts[0]
    
    #The final answer
    answer_amount = amount_1 * amount_2 * amount_3
    answer = str(amount_1) + "\\cdot" + str(amount_2) + "\\cdot" + str(amount_3) + " = " + str(answer_amount)
    
    random_scenario = choice(["phrasing1","phrasing2","phrasing3"])

    return {
        "scenario": {random_scenario: True},
        "dining_option": dining_option,
        "npc_title": npc_title,
        "amount_1": amount_1,
        "amount_2": amount_2,
        "amount_3": amount_3,
        "answer": answer,
    }