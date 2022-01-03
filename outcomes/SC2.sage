def generator():
    
    
    #basic building blocks for the questions
    questions_1 = [
        "A \\cap B",
        "A \\cup B",
        "A^c",
        "B^c",
    ]
    
    questions_2 = [
        "(A \\cap B)^c",
        "(A \\cup B)^c",
        "A \\cap B^c",
        "A \\cup B^c",
        "A^c \\cap B",
        "A^c \\cup B",
    ]
    
    #generating random sets
    size_u = randrange(7,13)
    U = Set([1..size_u])
    size_a = randrange(3,6)
    Options_a = list(U.subsets(size_a))
    random_a_index = randrange(0,len(Options_a))
    A = Options_a[random_a_index]
    
    size_b = randrange(3,7)
    while size_b == size_a:
        size_b = randrange(3,6)
    Options_b = list(U.subsets(size_b))
    random_b_index = randrange(0,len(Options_b))
    B = Options_b[random_b_index]
        
        
    #generating a random question
    question_1 = choice(questions_1)
    question_2 = choice(questions_2)
    question_3_choice = choice([0,1])
    if question_3_choice == 0:
        question_3 = "n(" + question_1 + ")"
    else:
        question_3 = "n(" + question_2 + ")"
   
    #solving and creating a solution.
    #question 1
    if question_1 == "A \\cap B":
        solution_1 = A.intersection(B)
    elif question_1 == "A \\cup B":
        solution_1 = A.union(B)
    elif question_1 == "A^c":
        solution_1 = U.difference(A)
    else:
        solution_1 = U.difference(B)
    
    #question 2
    if question_2 == "(A \\cap B)^c":
        temp = A.intersection(B)
        solution_2 = U.difference(temp)
    elif question_2 == "(A \\cup B)^c":
        temp = A.union(B)
        solution_2 = U.difference(temp)
    elif question_2 == "A \\cap B^c":
        temp = U.difference(B)
        solution_2 = A.intersection(temp)
    elif question_2 == "A \\cup B^c":
        temp = U.difference(B)
        solution_2 = A.union(temp)
    elif question_2 == "A^c \\cap B":
        temp = U.difference(A)
        solution_2 = temp.intersection(B)
    elif question_2 == "A^c \\cup B":
        temp = U.difference(A)
        solution_2 = temp.union(B)
    
    #question 3
    if question_3_choice == 0:
        solution_3 = solution_1.cardinality()
    else:
        solution_3 = solution_2.cardinality()

    return {
        "U": U,
        "A": A,
        "B": B,
        "question_1": question_1,
        "question_2": question_2,
        "question_3": question_3,
        "solution_1": solution_1,
        "solution_2": solution_2,
        "solution_3": solution_3,
    }
