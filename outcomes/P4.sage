def generator():
    #decide sick probability
    sick_prob = randrange(1,15)
    #decide false negative rate
    false_negative = randrange(1,20)
    #decide false positive rate
    false_positive = randrange(1,20)
    #decide test result
    test_result = choice(["positive","negative"])
    #decide actual result
    actual_result = choice(["sick","healthy"])
    
    #decide to include "and" in the question
    question = choice([test_result + " and is actually " + actual_result, test_result])
    
    #the case where we just ask about the result
    if question == test_result:
        #probability of a positive result
        if test_result == "positive":
            prob = (sick_prob/100)*(1 -(false_negative/100)) + (1 -(sick_prob/100))*(false_positive/100)
            prob_string = "P(positive) = P(sick)P(positive|sick) + P(healthy)P(positive|healthy)"
        #probability of a negative result
        else:
            prob = (sick_prob/100)*(false_negative/100) + (1 -(sick_prob/100))*(1 -(false_positive/100))
            prob_string = "P(negative) = P(sick)P(negative|sick) + P(healthy)P(negative|healthy)"
        
    #the case where we ask the "and" question
    else:
        #compute probabilities
        if test_result == "positive":
            #test positive and sick
            if actual_result == "sick":
                prob = (sick_prob/100)*(1 -(false_negative/100))
                prob_string = "P(positive\\, and\\, sick) = P(sick)P(positive|sick)"
            #test positive and healthy
            else:
                prob = (1 -(sick_prob/100))*(false_positive/100)
                prob_string = "P(positive\\, and\\, healthy) = P(healthy)P(positive|healthy)"
        else:
            #test negative and sick
            if actual_result == "healthy":
                prob = (sick_prob/100)*(false_negative/100)
                prob_string = "P(negative\\, and\\, sick) = P(sick)P(negative|sick)"
            #test negative and healthy
            else:
                prob = (1 -(sick_prob/100))*(1 -(false_positive/100))
                prob_string = "P(negative\\, and\\, healthy) = P(healthy)P(negative|healthy)"
            
    prob = round(prob,4)
            
    #changing up the wording
    scenario = choice(["disease","factory"])
    if scenario == "disease":
        problem = choice(["virus","bacteria","illness"])
        pop_subjects = [("people", "person"),("animals", "animal"),("children","child"),("adults","adult")]
        pop_subject = choice(pop_subjects)
        population = pop_subject[0]
        subject = pop_subject[1]
        researchers = choice(["Scientists","Doctors"])
    else:
        problem = choice(["defect","issue","error"])
        pop_subjects = [("products", "product"),("devices", "device"),("gadgets","gadget")]
        pop_subject = choice(pop_subjects)
        population = pop_subject[0]
        subject = pop_subject[1]
        researchers = choice(["Engineers","Quality inspectors"])
        prob_string = prob_string.replace("sick","defective")
        prob_string = prob_string.replace("healthy","not \\, defective")
        actual_result = actual_result.replace("sick","defective")
        actual_result = actual_result.replace("healthy","not \\, defective")
        question = question.replace("sick","defective")
        question = question.replace("healthy","not \\, defective")
    
    
    return {
        "problem": problem,
        "population": population,
        "subject": subject,
        "researchers": researchers,
        "sick_prob":sick_prob,
        "false_negative":false_negative,
        "false_positive":false_positive,
        "test_result":test_result,
        "actual_result":actual_result,
        "question": question,
        "prob":prob,
        "prob_string": prob_string,
    }