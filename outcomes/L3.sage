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
    #make p the first context and q the second
    part_1 = choice(contexts1)
    part_2 = choice(contexts2)
    
    #Builds out english statements to correspond to the formulas
    def formula_to_string(formula):
        temp_statement = formula.replace("P",part_1)
        temp_statement = temp_statement.replace("Q",part_2)
        temp_statement = temp_statement.replace("~", "it is false that ")
        temp_statement = temp_statement.replace("&", " and ")
        temp_statement = temp_statement.replace("|", " or ")
        temp_statement = temp_statement.replace("->", " implies ")
        
        return temp_statement
    
    #Builds out truth tables for the formulas
    def formula_to_table(formula):
        f = propcalc.formula(formula)
        truth_table = [["P", "Q", "\\text{Final Column}"]]
        for value1 in [True, False]:
            for value2 in [True, False]:
                truth_table.append([value1, value2, f.evaluate({'P':value1, 'Q':value2})])

        latex_truth_table = "\\begin{array}{llcc} " + str(truth_table[0][0]) + " & " + str(truth_table[0][1]) + " & " + " & \\cdots & " + str(truth_table[0][2]) + " \\\\ " + "\\hline "
        for i in range(1,5):
            latex_truth_table += str(truth_table[i][0]) + " & " + str(truth_table[i][1]) + " & " + " & \\cdots & " + str(truth_table[i][2]) + " \\\\ "
        latex_truth_table += "\\end{array}"
        latex_truth_table = latex_truth_table.replace("True", "\\text{True}")
        latex_truth_table = latex_truth_table.replace("False", "\\text{False}")
        
        return latex_truth_table
    
    #make the python formula latex friendly
    def formula_to_latex(formula):
        latex_statement = formula.replace("&", " \\wedge ")
        latex_statement = latex_statement.replace("|", " \\vee ")
        latex_statement = latex_statement.replace("~", " \\sim ")
        latex_statement = latex_statement.replace("->", " \\rightarrow ")
        
        return latex_statement
    
    #decides to go with equivalent or inequivalent statements
    answer = choice(["equivalent", "inequivalent"])
    
    if answer == "equivalent":    
        #generating a random equivalent pair
        equivalent_firsts = [
            "(~P)&Q",
            "P&(~Q)",
            "(~P)|Q",
            "P|(~Q)",
            "(~P)->Q",
            "(~Q)->P",
            "(P|Q)->(P&Q)",
            "P->(P&Q)",
            "(P|Q)->P"
        ]
        equivalent_seconds = [
            "~(P|(~Q))",
            "~((~P)|Q)",
            "~(P&(~Q))",
            "~((~P)&Q)",
            "(~Q)->P",
            "(~P)->Q",
            "(P->Q)&(Q->P)",
            "(~P)|(P&Q)",
            "~(P&Q)|P",
        ]

        index = randrange(0,len(equivalent_firsts))
        first = equivalent_firsts[index]
        second = equivalent_seconds[index]
        
    else:
        #generate a random inequivalent pair
        inequivalent_formulas = [
            "(~P)&Q",
            "P&(~Q)",
            "(~P)|Q",
            "P|(~Q)",
            "(~P)->Q",
            "(P&Q)->(P|Q)",
        ]

        first = choice(inequivalent_formulas)
        inequivalent_formulas.remove(first)
        second = choice(inequivalent_formulas)
    
    #Create the english statements to compare
    first_string = formula_to_string(first)
    second_string = formula_to_string(second)
    
    #Create the latex statements to display
    first_latex = formula_to_latex(first)
    second_latex = formula_to_latex(second)

    #Create the tables to show the work
    first_table = formula_to_table(first).replace("\\text{Final Column}", first_latex)
    second_table = formula_to_table(second).replace("\\text{Final Column}", second_latex)
        
    return {
        "answer": answer,
        "first_latex": first_latex,
        "second_latex": second_latex,
        "first_string": first_string,
        "second_string": second_string,
        "first_table": first_table,
        "second_table": second_table,
    }