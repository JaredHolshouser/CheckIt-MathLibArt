def generator():
    #choose a random scenario
    random_scenario = choice(["marble","jellybean","coin"])
    
    #Set out the options
    marble_choices = ["red", "blue", "yellow", "black", "white"]
    jelly_bean_choices = ["grape flavored", "cherry flavored", "butter flavored", "licorice flavored"]
    coin_choices = ["a penny", "a nickel", "a dime", "a quarter"]
    
    #Build a bag of things
    number_1 = randrange(10,50)
    number_2 = randrange(10,50)
    number_3 = randrange(10,50)
    number_4 = randrange(10,50)
    number_5 = randrange(10,50)
    
    #calculate the total and decide how many to pull
    if random_scenario == "marble":
        total = number_1 + number_2 + number_3 + number_4 + number_5
        amount_pulled = randrange(2,5)
    else:
        total = number_1 + number_2 + number_3 + number_4
        amount_pulled = randrange(2,4)
    
    #Choose to be dependent or independent
    ind_or_dep_bin = choice([0,1])
    if ind_or_dep_bin == 0:
        ind_or_dep = " " + random_scenario + "s, putting them back in the container and shaking between selections"
    else:
        ind_or_dep = " " + random_scenario + "s, setting each of them to the side as you pull them out"
    
    situation = str(amount_pulled) + ind_or_dep
    
    #Set up a question
    if random_scenario == "marble":
        options = marble_choices
    elif random_scenario == "jellybean":
        options = jelly_bean_choices
    else:
        options = coin_choices
    options_used = []
    indecies_used = []
    question = ""
    for i in range(amount_pulled):
        index = choice(range(0,len(options)))
        indecies_used.append(index)
        feature = options[index]
        options_used.append(feature)
        if i < amount_pulled - 2:
            question += random_scenario + " " + str(i+1) + " is " + feature + ", "
        elif i == amount_pulled - 2:
            question += random_scenario + " " + str(i+1) + " is " + feature + ", and "
        else:
            question += random_scenario + " " + str(i+1) + " is " + feature
    
    #compute the probability
    probs = []
    prob_strings = []
    #independent case
    if ind_or_dep_bin == 0:
        for i in range(amount_pulled):
            if indecies_used[i] == 0:
                probs.append(number_1/total)
                prob_strings.append("\\left( \\frac{"+str(number_1)+"}{"+str(total)+"} \\right)")
            elif indecies_used[i] == 1:
                probs.append(number_2/total)
                prob_strings.append("\\left( \\frac{"+str(number_2)+"}{"+str(total)+"} \\right)")
            elif indecies_used[i] == 2:
                probs.append(number_3/total)
                prob_strings.append("\\left( \\frac{"+str(number_3)+"}{"+str(total)+"} \\right)")
            elif indecies_used[i] == 3:
                probs.append(number_4/total)
                prob_strings.append("\\left( \\frac{"+str(number_4)+"}{"+str(total)+"} \\right)")
            else:
                probs.append(number_5/total)
                prob_strings.append("\\left( \\frac{"+str(number_5)+"}{"+str(total)+"} \\right)")
    #dependent case
    else:
        temp_1 = number_1
        temp_2 = number_2
        temp_3 = number_3
        temp_4 = number_4
        temp_5 = number_5
        temp_total = total
        for i in range(amount_pulled):
            if indecies_used[i] == 0:
                probs.append(temp_1/temp_total)
                prob_strings.append("\\left( \\frac{"+str(temp_1)+"}{"+str(temp_total)+"} \\right)")
                temp_1 = temp_1 - 1
            elif indecies_used[i] == 1:
                probs.append(temp_2/temp_total)
                prob_strings.append("\\left( \\frac{"+str(temp_2)+"}{"+str(temp_total)+"} \\right)")
                temp_2 = temp_2 - 1
            elif indecies_used[i] == 2:
                probs.append(temp_3/temp_total)
                prob_strings.append("\\left( \\frac{"+str(temp_3)+"}{"+str(temp_total)+"} \\right)")
                temp_3 = temp_3 - 1
            elif indecies_used[i] == 3:
                probs.append(temp_4/temp_total)
                prob_strings.append("\\left( \\frac{"+str(temp_4)+"}{"+str(temp_total)+"} \\right)")
                temp_4 = temp_4 - 1
            else:
                probs.append(temp_5/temp_total)
                prob_strings.append("\\left( \\frac{"+str(temp_5)+"}{"+str(temp_total)+"} \\right)")
                temp_5 = temp_5 - 1
            temp_total = temp_total - 1

    prob = 1
    prob_string = ""
    for i in range(amount_pulled):
        prob = prob*probs[i]
        prob_string += prob_strings[i]
        
    return {
        "scenario": {random_scenario: True},
        "number_1": number_1,
        "number_2": number_2,
        "number_3": number_3,
        "number_4": number_4,
        "number_5": number_5,
        "total": total,
        "situation": situation,
        "question": question,
        "prob_string": prob_string,
        "prob":prob,
    }