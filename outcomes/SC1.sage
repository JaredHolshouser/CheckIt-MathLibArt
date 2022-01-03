def generator():
    
    #decide the first question
    questions_1 = [
        "x \\in A",
        "x \\in B",
        "x \\notin A",
        "x \\notin B",
    ]
    question_1 = choice(questions_1)
    
    #decide the second question
    questions_2 = [
        "A \\subseteq B",
        "B \\subseteq A",
        "A \\supseteq B",
        "B \\supseteq A",
    ]
    question_2 = choice(questions_2)
    
    #generating random sets
    size_a = randrange(4,13)
    start_a = randrange(1,6)
    A = Set([start_a..size_a+start_a])
    
    size_not = randrange(3,8)
    start_not = randrange(1,7)
    B = Set[start_not..size_not+start_not]
    
    #generating a random element
    x = randrange(1,20)
    x_set = Set([x])
    
    #Creating solutions and reasons
    if question_1 == "x \\in A":
        solution_1 = x_set.issubset(A)
        if solution_1 == True:
            reason_1 = "x is one of the listed elements of A"
        else:
            reason_1 = "x is not one of the listed elements of A"
    elif question_1 == "x \\in B":
        solution_1 = x_set.issubset(B)
        if solution_1 == True:
            reason_1 = "x is one of the listed elements of B"
        else:
            reason_1 = "x is not one of the listed elements of B"
    elif question_1 == "x \\notin A":
        solution_1 = not x_set.issubset(A)
        if solution_1 == True:
            reason_1 = "x is not one of the listed elements of A"
        else:
            reason_1 = "x is one of the listed elements of A"
    else:
        solution_1 = not x_set.issubset(B)
        if solution_1 == True:
            reason_1 = "x is not one of the listed elements of B"
        else:
            reason_1 = "x is one of the listed elements of B"

    if question_2 == "A \\subseteq B":
        solution_2 = A.issubset(B)
        if solution_2 == True:
            reason_2 = "every element of A is also an element of B"
        else:
            reason_2 = "A has elements that are not in B"
    elif question_2 == "B \\subseteq A":
        solution_2 = B.issubset(A)
        if solution_2 == True:
            reason_2 = "every element of B is also an element of A"
        else:
            reason_2 = "B has elements that are not in A"
    elif question_2 == "A \\supseteq B":
        solution_2 = B.issubset(A)
        if solution_2 == True:
            reason_2 = "every element of B is also an element of A"
        else:
            reason_2 = "B has elements that are not in A"
    else:
        solution_2 = A.issubset(B)
        if solution_2 == True:
            reason_2 = "every element of A is also an element of B"
        else:
            reason_2 = "A has elements that are not in B"
        
    #making the sets printer friendly
    A_string = str(A).replace("\\left\\","")
    A_string = A_string.replace("\\left\\","")
    B_string = str(B).replace("\\left\\","")
    B_string = B_string.replace("\\left\\","")
    

    return {
        "x": x,
        "A": A,
        "B": B,
        "question_1": question_1,
        "question_2": question_2,
        "solution_1": solution_1,
        "solution_2": solution_2,
        "reason_1": reason_1,
        "reason_2": reason_2,
    }