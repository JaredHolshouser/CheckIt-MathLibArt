def generator():

    #generates a random survey question. Make sure these lists are the same length.
    options1 = [
        "dogs",
        "phone calls",
        "ice cream",
        "music",
        "apple",
        "cake",
        "football",
        "jogging",
        "glasses",
        "shopping online",
        "writing in pen",
        "iced coffee",
        "horror movies",
        "beer",
    ]
    
    options2 = [
        "cats",
        "texts",
        "a snow cone",
        "podcasts",
        "android phones",
        "pie",
        "basketball",
        "hiking",
        "contacts",
        "shopping in a store",
        "writing in pencil",
        "hot coffee",
        "comedies",
        "wine",
    ]
    scenario_number = randrange(0,len(options1))
    option_A = options1[scenario_number]
    option_B = options2[scenario_number]
    survey_question = "Do you prefer " + option_A + " or " + option_B
    
    #generates a random survey size
    survey_size = randrange(2,9)*100
    
    #partitions the space up
    amount_A_min = floor(0.15*survey_size)
    amount_A_max = floor(0.7*survey_size)
    amount_A = randrange(amount_A_min, amount_A_max)
    
    amount_B_min = floor(0.15*survey_size)
    amount_B_max = floor(0.7*survey_size)
    amount_B = randrange(amount_A_min, amount_A_max)
    
    overlap_amount_min = floor(0.3*min(amount_A,amount_B))
    overlap_amount_max = floor(0.7*min(amount_A,amount_B))
    overlap_amount = randrange(overlap_amount_min, overlap_amount_max)
    
    amount_A_only = amount_A - overlap_amount
    amount_B_only = amount_B - overlap_amount
    amount_neither = survey_size - (amount_A + amount_B_only)
    
    amount_not_A = survey_size - amount_A
    amount_not_B = survey_size - amount_B
    
    #chooses four random pieces of information to give out
    info_options = [0,1,2,3,4,5]
    first_info_number = choice(info_options)
    info_options.remove(first_info_number)
    second_info_number = choice(info_options)
    info_options.remove(second_info_number)
    third_info_number = choice(info_options)
    info_options.remove(third_info_number)
    fourth_info_number = choice(info_options)
    info_options.remove(fourth_info_number)
    
    info_phrases = [
        str(amount_A) + " reported that they prefer " + option_A,
        str(amount_B) + " reported that they prefer " + option_B,
        str(overlap_amount) + " reported that they prefer both " + option_A + " and " + option_B,
        str(amount_A_only) + " reported that they prefer " + option_A + " only",
        str(amount_B_only) + " reported that they prefer " + option_B + " only",
        str(amount_neither) + " reported that they prefer neither " + option_A + " nor " + option_B,
        str(amount_not_A) + " reported that they do not prefer " + option_A,
        str(amount_not_B) + " reported that they do not prefer " + option_B,
    ]
    
    reason_phrases = [
        str(amount_A) + " is the number for the entire " + option_A + " circle",
        str(amount_B) + " is the number for the entire " + option_B + " circle",
        str(overlap_amount) + " is the number for the little oval overlap part",
        str(amount_A_only) + " is the number for the crescent moon part of " + option_A,
        str(amount_B_only) + " is the number for the crescent moon part of " + option_B,
        str(amount_neither) + " is the number for the portion outside of both circles",
        str(amount_not_A) + " is the number for the region outside of the " + option_A + " circle",
        str(amount_not_B) + " is the number for the region outside of the " + option_B + " circle",
    ]
    
    given_info_1 = info_phrases[first_info_number]
    given_info_2 = info_phrases[second_info_number]
    given_info_3 = info_phrases[third_info_number]
    given_info_4 = info_phrases[fourth_info_number]
    
    reason_1 = reason_phrases[first_info_number]
    reason_2 = reason_phrases[second_info_number]
    reason_3 = reason_phrases[third_info_number]
    reason_4 = reason_phrases[fourth_info_number]
    
    #creates the questions to answer.
    question_phrases = [
        " reported that they prefer " + option_A,
        " reported that they prefer " + option_B,
        " reported that they prefer both " + option_A + " and " + option_B,
        " reported that they prefer " + option_A + " only",
        " reported that they prefer " + option_B + " only",
        " reported that they prefer neither " + option_A + " nor " + option_B,
        " reported that they do not prefer " + option_A,
        " reported that they do not prefer " + option_B,
    ]
    
    info_options.append(6)
    info_options.append(7)
    
    first_question_number = choice(info_options)
    info_options.remove(first_question_number)
    second_question_number = choice(info_options)
    
    question_1 = question_phrases[first_question_number]
    question_2 = question_phrases[second_question_number]
    
    #creates the answers
    answer_1 = info_phrases[first_question_number]
    answer_2 = info_phrases[second_question_number]
        
    return {
        "survey_size": survey_size,
        "survey_question": survey_question,
        "option_A": option_A,
        "option_B": option_B,
        "given_info_1": given_info_1,
        "given_info_2": given_info_2,
        "given_info_3": given_info_3,
        "given_info_4": given_info_4,
        "question_1": question_1,
        "question_2": question_2,
        "answer_1": answer_1,
        "answer_2": answer_2,
        "reason_1": reason_1,
        "reason_2": reason_2,
        "reason_3": reason_3,
        "reason_4": reason_4,
    }