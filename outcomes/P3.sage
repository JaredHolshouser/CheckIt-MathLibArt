def generator():
    #Build a jar of marbles
    red_number = randrange(10,50)
    green_number = randrange(10,50)
    blue_number = randrange(10,50)
    yellow_number = randrange(10,50)
    black_number = randrange(10,50)
    white_number = randrange(10,50)
    total = red_number + green_number + blue_number + yellow_number + black_number + white_number
    marble_string = str(red_number) + " red marbles, " + str(green_number) + " green marbles, " + str(blue_number) + " blue marbles, " + str(yellow_number) + " yellow marbles, " + str(black_number) + " black marbles, and " + str(white_number) + " white marbles, " + " for a total of " + str(total) + " marbles"
    
    #choose number of marbles to pull
    amount_pulled = randrange(2,5)
    
    #Choose to be dependent or independent
    ind_or_dep = choice([" marbles, putting them back in the jar and shaking between selections", " marbles, setting each of them to the side as you pull them out"])
    situation = str(amount_pulled) + ind_or_dep
    
    #Set up a question
    colors_used = []
    question = ""
    for i in range(amount_pulled):
        color = choice(["red", "green", "blue", "yellow", "black", "white"])
        colors_used.append(color)
        if i < amount_pulled - 2:
            question += "marble " + str(i+1) + " is " + color + ", "
        elif i == amount_pulled - 2:
            question += "marble " + str(i+1) + " is " + color + ", and "
        else:
            question += "marble " + str(i+1) + " is " + color
    
    #compute the probability
    probs = []
    prob_strings = []
    if ind_or_dep == " marbles, putting them back in the jar and shaking between selections":
        for i in range(amount_pulled):
            if colors_used[i] == "red":
                probs.append(red_number/total)
                prob_strings.append("\\left( \\frac{"+str(red_number)+"}{"+str(total)+"} \\right)")
            elif colors_used[i] == "green":
                probs.append(green_number/total)
                prob_strings.append("\\left( \\frac{"+str(green_number)+"}{"+str(total)+"} \\right)")
            elif colors_used[i] == "blue":
                probs.append(blue_number/total)
                prob_strings.append("\\left( \\frac{"+str(blue_number)+"}{"+str(total)+"} \\right)")
            elif colors_used[i] == "yellow":
                probs.append(yellow_number/total)
                prob_strings.append("\\left( \\frac{"+str(yellow_number)+"}{"+str(total)+"} \\right)")
            elif colors_used[i] == "black":
                probs.append(black_number/total)
                prob_strings.append("\\left( \\frac{"+str(black_number)+"}{"+str(total)+"} \\right)")
            else:
                probs.append(white_number/total)
                prob_strings.append("\\left( \\frac{"+str(white_number)+"}{"+str(total)+"} \\right)")
    else:
         for i in range(amount_pulled):
            if colors_used[i] == "red":
                probs.append(red_number/total)
                prob_strings.append("\\left( \\frac{"+str(red_number)+"}{"+str(total)+"} \\right)")
                red_number = red_number - 1
            elif colors_used[i] == "green":
                probs.append(green_number/total)
                prob_strings.append("\\left( \\frac{"+str(green_number)+"}{"+str(total)+"} \\right)")
                green_number = green_number - 1
            elif colors_used[i] == "blue":
                probs.append(blue_number/total)
                prob_strings.append("\\left( \\frac{"+str(blue_number)+"}{"+str(total)+"} \\right)")
                blue_number = blue_number - 1
            elif colors_used[i] == "yellow":
                probs.append(yellow_number/total)
                prob_strings.append("\\left( \\frac{"+str(yellow_number)+"}{"+str(total)+"} \\right)")
                yellow_number = yellow_number - 1
            elif colors_used[i] == "black":
                probs.append(black_number/total)
                prob_strings.append("\\left( \\frac{"+str(black_number)+"}{"+str(total)+"} \\right)")
                black_number = black_number - 1
            else:
                probs.append(white_number/total)
                prob_strings.append("\\left( \\frac{"+str(white_number)+"}{"+str(total)+"} \\right)")
                white_number = white_number - 1
            total = total - 1

    prob = 1
    prob_string = ""
    for i in range(amount_pulled):
        prob = prob*probs[i]
        prob_string += prob_strings[i]
        
    return {
        "marble_string": marble_string,
        "situation": situation,
        "question": question,
        "prob_string": prob_string,
        "prob":prob,
    }