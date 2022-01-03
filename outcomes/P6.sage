def generator():
    #choose a random scenario
    random_scenario = choice(["12", "13", "21", "23", "31", "32"])
    
    #First part, use FPC
    
    #choose a password situation
    password_situations = [
        "an bank website",
        "a school website",
        "an insurance website",
        "a school laptop",
        "a work computer",
    ]
    password_situation = choice(password_situations)
    
    #choose password amounts
    p_letter_amount = randrange(5,9)
    p_digit_amount = randrange(2,4)

    #decide if letters and numbers can repeat
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
    #build a box diagram
    box_diagram = []
    if letter_repeat_bool:
        for i in range(p_letter_amount):
            box_diagram.append(26)
    else:
        for i in range(p_letter_amount):
            box_diagram.append(26 - i)
    if digit_repeat_bool:
        for i in range(p_digit_amount):
            box_diagram.append(10)
    else:
        for i in range(p_digit_amount):
            box_diagram.append(10 - i)

    total_amount = len(box_diagram)
    answer_1 = 1
    slot_string = ""
    for i in range(total_amount):
        answer_1 *= box_diagram[i]
        slot_string += "(" + str(box_diagram[i]) + ")"
    answer_1 = 1/answer_1
    answer_string_1 = "\\frac{1}{"+slot_string+"}"
    
    #Second part, pokers hands
    #Produce a random poker hand
    values = ["Aces", "Ones", "Twos", "Threes", "Fours", "Fives", "Sixes", "Sevens", "Eights", "Nines", "Tens", "Jacks", "Queens", "Kings"]
    value_1 = choice(values)
    values.remove(value_1)
    value_2 = choice(values)
    values.remove(value_2)
    value_3 = choice(values)
    values.remove(value_3)
    
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
    suit_1 = choice(suits)
    suits.remove(suit_1)
    suit_2 = choice(suits)
    suits.remove(suit_2)
    
    specific_card = choice(values)[0:-1] + " of " + choice(suits)
    
    hands = [
        "two {}".format(value_1),
        "three {}".format(suit_1),
        "a pair of {} and a pair of {}".format(value_1,value_2),
        "five {}".format(suit_1),
        "four {} and the {}".format(suit_1, specific_card),
        "a {}, a {}, and a {} all in the same suit".format(value_1[0:-1],value_2[0:-1],value_3[0:-1]),
        "three {}".format(value_1),
        "two {} and two {}".format(suit_1,suit_2)
    ]
    hand_number = randrange(0,len(hands))
    cards = hands[hand_number]
    
    #two Aces
    if hand_number == 0:
        prob = (6*binomial(48,3))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{4}C_2)(\\,_{48}C_3)}{\\,_{52}C_5}"
    #3 clubs
    elif hand_number == 1:
        prob = (binomial(13,3)*binomial(49,2))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{13}C_3)(\\,_{49}C_2)}{\\,_{52}C_5}"
    #a pair of Jacks and a pair of tens
    elif hand_number == 2:
        prob = (binomial(4,2)*binomial(4,2)*binomial(44,1))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{4}C_2)(\\,_{4}C_2)(\\,_{44}C_1)}{\\,_{52}C_5}"
    #five diamonds
    elif hand_number == 3:
        prob = (binomial(13,5))/(binomial(52,5))
        prob_string = "\\frac{\\,_{13}C_5}{\\,_{52}C_5}"
    #four Hearts and the Jack of Spades
    elif hand_number == 4:
        prob = (binomial(13,4)*1)/(binomial(52,5))
        prob_string = "\\frac{(\\,_{13}C_4)\\cdot 1}{\\,_{52}C_5}"
    #a Jack, Queen, and King all the same suit
    elif hand_number == 5:
        prob = (binomial(4,1)*binomial(49,2))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{4}C_1) \\cdot 1 \\cdot 1 \\cdot 1 \\cdot (\\,_{49}C_2)}{\\,_{52}C_5}"
    #three Fives
    elif hand_number == 6:
        prob = (binomial(4,3)*binomial(49,2))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{4}C_3)(\\,_{49}C_2)}{\\,_{52}C_5}"
    #two hearts and two spades
    else:
        prob = (binomial(13,2)*binomial(13,2)*binomial(48,1))/(binomial(52,5))
        prob_string = "\\frac{(\\,_{13}C_2)(\\,_{13}C_2)(\\,_{48}C_1)}{\\,_{52}C_5}"
    
    
    #third part, nPr
    #Choose a number of total candidates
    num_candidates = randrange(20,41)
    #choose a number of friends
    num_friends = randrange(10,16)
    #choose a team size
    num_selection = randrange(4,9)
    #choose a situation
    team_situation = choice([" consists only of you and your friends", " does not include you or any of your friends"])
    
    #compute the probability
    if team_situation == " consists only of you and your friends":
        answer_3 = math.perm(num_friends+1, num_selection)/math.perm(num_candidates, num_selection)
        answer_string_3 = "\\frac{\\,_{"+str(num_friends+1)+"}P_{"+str(num_selection)+"}}{\\,_{"+str(num_candidates)+"}P_{"+str(num_selection)+"}}"
    else:
        num_not_friends = num_candidates - num_friends - 1
        answer_3 = math.perm(num_not_friends, num_selection)/math.perm(num_candidates, num_selection)
        answer_string_3 = "\\frac{\\,_{"+str(num_not_friends)+"}P_{"+str(num_selection)+"}}{\\,_{"+str(num_candidates)+"}P_{"+str(num_selection)+"}}"
    
    
    
    #OTHER VARIANT BELOW
    #xml problem statement is : What is the probability of rolling a {{r}} on a {{n}}-sided die and drawing a {{card1}} from a poker deck.
    #card1 = choice(["Ace","King","Queen","Jack", "Club", "Heart", "Spade", "Diamond", "Ten of Spades", "Duce of Diamonds", "Four of Clubs", "Five of Hearts"])
    #n = randrange(4,12)
    #r = randrange(1,n)
    
    #if card1 == "Ace" or card1 == "King" or card1 == "Queen" or card1 =="Jack":
        #prob = (1/n)*(4/52)
    #if card1 == "Heart" or card1 == "Spade" or card1 == "Diamond" or card1 =="Club":
        #prob = (1/n)*(13/52)
    #if card1 == "Ten of Spades" or card1 == "Duce of Diamonds" or card1== "Four of Clubs" or card1== "Five of Hearts":
        #prob = (1/n)*(13/52)
    
        
    return {
        "scenario": {random_scenario: True},
        "password_situation": password_situation,
        "p_letter_amount": p_letter_amount,
        "p_digit_amount": p_digit_amount,
        "letter_repeat": letter_repeat,
        "digit_repeat": digit_repeat,
        "answer_1": answer_1,
        "answer_string_1": answer_string_1,
        
        "cards": cards,
        "prob_string": prob_string,
        "prob":prob,
        
        "num_candidates": num_candidates,
        "num_friends": num_friends,
        "num_selection": num_selection,
        "team_situation": team_situation,
        "answer_3": answer_3,
        "answer_string_3": answer_string_3,
        
        #OTHER VARIANT BELOW
        #"card1": card1,
        #"r": r,
        #"n":n,
        #"prob": prob
    }