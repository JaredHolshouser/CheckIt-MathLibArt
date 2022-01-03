def generator():
    
    #Array of different contexts to plug into the evaluated statement.
    contexts1 = [
        "it is raining today",
        "it is hot today",
        "it is below freezing today",
        "campus is closed",
        "campus is open",
        "I wake up on time",
        "there is no traffic today",
        "I slept well last night",
        "I slept poorly last night",
        "everybody is laid back",
        "everybody is stressed",
    ]
    contexts2 = [
        "I am in a good mood",
        "I am in a bad mood",
        "time marches on",
        "I do the dishes",
        "I take out the trash",
        "I exercise regularly",
        "I have a healthy diet",
        "I have an unhealthy diet",
        "class is cancelled",
        "class is in session",
    ]
    contexts3 = [
        "dog is a shape",
        "a hot dog is a sandwich",
        "pineapple belongs on pizza",
        "birds are fake",
        "disco is thriving",
        "slam poetry is cool",
    ]
    
    #make p the first context, q the second, and r the third
    part_1 = choice(contexts1)
    part_2 = choice(contexts2)
    part_3 = choice(contexts3)
    
    #Decide if the argument is valid or not
    answer = choice(["valid", "not valid"])
    
    if answer == "valid":
        #choose a valid argument form
        valid_forms = [
            ("If P, then Q. P. Therefore, Q.", "the law of detachment"),
            ("If it is false that P, then Q. It is false that P. Therefore, Q.", "the law of detachment"),
            ("If P, then Q. It is false that Q. Therefore, it is false that P", "the law of contraposition"),
            ("If P, then it is false that Q. Q. Therefore, it is false that P", "the law of contraposition"),
            ("If P, then Q. If Q, then R. Therefore, if P, then R.", "the transitive property"),
            ("If P, then it is false that Q. If it is false that Q, then R. Therefore, if P, then R.", "the transitive property"),
            ("P or Q. It is false that P. Therefore, Q.", "because it has the form of a disjunctive syllogism"),
            ("P or Q. It is false that Q. Therefore, P.", "because it has the form of a disjunctive syllogism"),
        ]
        short_valid_forms = [
            ("P \\rightarrow Q", "P", "Q"),
            ("\\sim P \\rightarrow Q", "\\sim P", "Q"),
            ("P \\rightarrow Q", "\\sim Q", "\\sim P"),
            ("P \\rightarrow \\sim Q", "Q", "\\sim P"),
            ("P \\rightarrow Q", "Q \\rightarrow R", "P \\rightarrow R"),
            ("P \\rightarrow \\sim Q", "\\sim Q \\rightarrow R", "P \\rightarrow R"),
            ("P \\vee Q", "\\sim P", "Q"),
            ("P \\vee Q", "\\sim Q", "P"),
        ]
        symbolic_valid_forms = [
            ("\\square \\rightarrow \\triangle", "\\square", "\\triangle"),
            ("\\square \\rightarrow \\triangle", "\\square", "\\triangle"),
            ("\\square \\rightarrow \\triangle", "\\sim \\triangle", "\\sim \\square"),
            ("\\square \\rightarrow \\triangle", "\\sim \\triangle", "\\sim \\square"),
            ("\\square \\rightarrow \\triangle", "\\triangle \\rightarrow \\bigcirc", "\\square \\rightarrow \\bigcirc"),
            ("\\square \\rightarrow \\triangle", "\\triangle \\rightarrow \\bigcirc", "\\square \\rightarrow \\bigcirc"),
            ("\\square \\vee \\triangle", "\\sim \\square", "\\triangle"),
            ("\\triangle \\vee \\square", "\\sim \\square", "\\triangle"),
        ]
        index = randrange(0,len(valid_forms))
        selection = valid_forms[index]
        short_form = short_valid_forms[index]
        symbolic_form = symbolic_valid_forms[index]
        premise_1 = short_form[0]
        premise_2 = short_form[1]
        conclusion = short_form[2]
        premise_1_symbolic = symbolic_form[0]
        premise_2_symbolic = symbolic_form[1]
        conclusion_symbolic = symbolic_form[2]
        
    else:
        #choose an invalid form
        invalid_forms = [
            ("if P, then Q. Q. Therefore, P.","the fallacy of the converse"),
            ("if it is false that P, then Q. Q. Therefore, it is false that P.","the fallacy of the converse"),
            ("if P, then Q. It is false that P. Therefore, it is false that Q.", "the fallacy of the inverse"),
            ("if it is false that P, then Q. P. Therefore, it is false that Q.", "the fallacy of the inverse"),
        ]
        short_invalid_forms = [
            ("P \\rightarrow Q","Q","P"),
            ("\\sim P \\rightarrow Q","Q","\\sim P"),
            ("P \\rightarrow Q","\\sim P","\\sim Q"),
            ("\\sim P \\rightarrow Q","P","\\sim Q"),
        ]
        symbolic_invalid_forms = [
            ("\\square \\rightarrow \\triangle","\\triangle","\\square"),
            ("\\square \\rightarrow \\triangle","\\triangle","\\square"),
            ("\\square \\rightarrow \\triangle","\\sim \\square","\\sim \\triangle"),
            ("\\square \\rightarrow \\triangle","\\sim \\square","\\sim \\triangle"),
        ]
        index = randrange(0,len(invalid_forms))
        selection = invalid_forms[index]
        short_form = short_invalid_forms[index]
        symbolic_form = symbolic_invalid_forms[index]
        premise_1 = short_form[0]
        premise_2 = short_form[1]
        conclusion = short_form[2]
        premise_1_symbolic = symbolic_form[0]
        premise_2_symbolic = symbolic_form[1]
        conclusion_symbolic = symbolic_form[2]
    
    #building out the argument in text
    argument = selection[0]
    argument = argument.replace("P",part_1)
    argument = argument.replace("Q",part_2)
    argument = argument.replace("R",part_3)
    
    #building out the reasoning in text
    reason = selection[1]

        
    return {
        "answer": answer,
        "argument": argument,
        "reason": reason,
        "premise_1": premise_1,
        "premise_2": premise_2,
        "conclusion": conclusion,
        "premise_1_symbolic": premise_1_symbolic,
        "premise_2_symbolic": premise_2_symbolic,
        "conclusion_symbolic": conclusion_symbolic,
    }