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
    
    #Builds out english statements to correspond to the formulas
    def formula_to_string(formula):
        temp_statement = formula.replace("P->Q","if P, then Q")
        temp_statement = temp_statement.replace("~P->Q","if ~P, then Q")
        temp_statement = temp_statement.replace("P->~Q","if P, then ~Q")
        temp_statement = temp_statement.replace("~P->~Q","if ~P, then ~Q")
        temp_statement = temp_statement.replace("P->R","if P, then R")
        temp_statement = temp_statement.replace("~P->R","if ~P, then R")
        temp_statement = temp_statement.replace("P->~R","if P, then ~R")
        temp_statement = temp_statement.replace("~P->~R","if ~P, then ~R")
        temp_statement = temp_statement.replace("Q->R","if Q, then R")
        temp_statement = temp_statement.replace("~Q->R","if ~Q, then R")
        temp_statement = temp_statement.replace("Q->~R","if Q, then ~R")
        temp_statement = temp_statement.replace("~Q->~R","if ~Q, then ~R")
        temp_statement = temp_statement.replace("P",part_1)
        temp_statement = temp_statement.replace("Q",part_2)
        temp_statement = temp_statement.replace("R",part_3)
        temp_statement = temp_statement.replace("~", "it is false that ")
        temp_statement = temp_statement.replace("&", " and ")
        temp_statement = temp_statement.replace("|", " or ")
        
        return temp_statement
    
    #Builds out truth tables for the formulas
    def formula_to_table(formula,varcount):
        f = propcalc.formula(formula)
        
        if varcount == 2:
            truth_table = [["P", "Q", "\\text{Final Column}"]]
            for value1 in [True, False]:
                for value2 in [True, False]:
                    truth_table.append([value1, value2, f.evaluate({'P':value1, 'Q':value2})])

            latex_truth_table = "\\begin{array}{llcc} " + str(truth_table[0][0]) + " & " + str(truth_table[0][1]) + " & " + " & \\cdots & " + str(truth_table[0][2]) + " \\\\ " + "\\hline "
            for i in range(1,5):
                latex_truth_table += str(truth_table[i][0]) + " & " + str(truth_table[i][1]) + " & " + " & \\cdots & " + str(truth_table[i][2]) + " \\\\ "
            latex_truth_table += "\\end{array}"
            latex_truth_table = latex_truth_table.replace("True", "\\text{T}")
            latex_truth_table = latex_truth_table.replace("False", "\\text{F}")
        
        else:
            truth_table = [["P", "Q", "R", "\\text{Final Column}"]]
            for value1 in [True, False]:
                for value2 in [True, False]:
                    for value3 in [True, False]:
                        truth_table.append([value1, value2, value3, f.evaluate({'P':value1, 'Q':value2, 'R':value3})])

            latex_truth_table = "\\begin{array}{lllcc} " + str(truth_table[0][0]) + " & " + str(truth_table[0][1]) + " & " + str(truth_table[0][2]) + " & \\cdots & " + str(truth_table[0][3]) + " \\\\ " + "\\hline "
            for i in range(1,9):
                latex_truth_table += str(truth_table[i][0]) + " & " + str(truth_table[i][1]) + " & " + str(truth_table[i][2]) + " & \\cdots & " + str(truth_table[i][3]) + " \\\\ "
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
    
    #Decide if the argument is valid or not
    answer = choice(["valid", "not valid"])
    
    if answer == "valid":
        #choose a valid argument form
        #first decide two or three variables:
        varnum = randrange(2,4)
        if varnum == 2:
            valid_forms = [
                ("P->Q","P","Q"),
                ("~P->Q","~P","Q"),
                ("P->~Q","P","~Q"),
                ("P->Q","~Q","~P"),
                ("~P->Q","~Q","P"),
                ("P->~Q","Q","~P"),
                ("P|Q","~P","Q"),
                ("P|Q","~Q","P"),
            ]
        else:
            valid_forms = [
                ("P->~Q","~Q->R","P->R"),
                ("P->Q","Q->~R","P->~R"),
                ("~P->Q","Q->R","~P->R"),
            ]
        selection = choice(valid_forms)
        #state why the argument is valid
        reason = "because all of the entries in the final column of the truth table are true"
        
    else:
        #choose an invalid form
        #first decide two or three variables:
        varnum = randrange(2,4)
        if varnum == 2:
            invalid_forms = [
                ("P->Q","Q","P"),
                ("~P->Q","Q","~P"),
                ("P->~Q","~Q","P"),
                ("~P->~Q","~Q","~P"),
                ("P->Q","~P","~Q"),
                ("~P->Q","P","~Q"),
                ("P->~Q","~P","Q"),
                ("~P->~Q","P","Q"),
            ]
        else:
            invalid_forms = [
                ("P->~Q","Q->R","P->R"),
                ("P->Q","~Q->~R","P->~R"),
                ("~P->Q","Q->~R","P->R"),
            ]
            
        selection = choice(invalid_forms)
        #state why the argument is not valid
        reason = "because there is at least one false entry in the final column of the truth table"
    
    #building out the argument in steps
    premise_1 = selection[0]
    premise_2 = selection[1]
    conclusion = selection[2]
    #construcing the text for the argument:
    premise_1_string = "Premise 1: " + formula_to_string(premise_1)
    premise_2_string = "Premise 2: " + formula_to_string(premise_2)
    conclusion_string = "Conclusion: " + formula_to_string(conclusion)
    
    #constructing the latex for the argument:
    premise_1_latex = formula_to_latex(premise_1)
    premise_2_latex = formula_to_latex(premise_2)
    conclusion_latex = formula_to_latex(conclusion)
    
    #constructing the truth table
    argument_formula = "((" + premise_1 + ")&(" + premise_2 + "))->(" + conclusion + ")"
    truth_table = formula_to_table(argument_formula,varnum)
    argument_formula_latex = formula_to_latex(argument_formula)
    truth_table = truth_table.replace("\\text{Final Column}",argument_formula_latex)
    

        
    return {
        "answer": answer,
        "reason": reason,
        "premise_1_string": premise_1_string,
        "premise_2_string": premise_2_string,
        "conclusion_string": conclusion_string,
        "premise_1_latex": premise_1_latex,
        "premise_2_latex": premise_2_latex,
        "conclusion_latex": conclusion_latex,
        "truth_table": truth_table,
        "argument_formula_latex": argument_formula_latex,
    }