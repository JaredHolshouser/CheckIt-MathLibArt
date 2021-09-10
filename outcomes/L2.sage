def generator():
    #basic building blocks for the statements
    blocks1 = [
        "(p&q)",
        "(p|q)",
        "(p->q)",
        "(q->p)",
        "(~p&q)",
        "(~p|q)",
        "(~p->q)",
        "(~q->p)",
        "(p&~q)",
        "(p|~q)",
        "(p->~q)",
        "(q->~p)",
        "(p&r)",
        "(p|r)",
        "(p->r)",
        "(r->p)",
        "(~p&r)",
        "(~p|r)",
        "(~p->r)",
        "(~r->p)",
        "(p&~r)",
        "(p|~r)",
        "(p->~r)",
        "(r->~p)",
    ]
    blocks2 = [
        "(q&r)",
        "(q|r)",
        "(q->r)",
        "(r->q)",
        "(~q&r)",
        "(~q|r)",
        "(~q->r)",
        "(~r->q)",
        "(q&~r)",
        "(q|~r)",
        "(q->~r)",
        "(r->~q)",
    ]
    
    #Connectors
    connectors = [
        "&",
        "|",
        "->",
        "&~",
        "|~",
        "->~",
    ]
    
    #generating a random formula
    choice1 = randrange(0,len(blocks1))
    block1 = blocks1[choice1]
    choice2 = randrange(0,len(blocks2))
    block2 = blocks2[choice2]
    conn_choice = randrange(0,len(connectors))
    connection = connectors[conn_choice]
    
    coin_flip = randrange(0,2)
    if coin_flip == 0:
        statement = block1 + connection + block2
    else:
        statement = block2 + connection + block1
    
    f = propcalc.formula(statement)
    truth_table = [["\\text{p}", "\\text{q}", "\\text{r}", "\\text{Final Column}"]]
    for value1 in [True, False]:
        for value2 in [True, False]:
            for value3 in [True, False]:
                truth_table.append([value1, value2, value3, f.evaluate({'p':value1, 'q':value2, 'r':value3})])

    nice_statement = statement.replace("&", " \\wedge ")
    nice_statement = nice_statement.replace("|", " \\vee ")
    nice_statement = nice_statement.replace("->", " \\rightarrow ")
    nice_statement = nice_statement.replace("~", "\\sim ")
    
    latex_truth_table = "\\begin{array}{lllcc} " + str(truth_table[0][0]) + " & " + str(truth_table[0][1]) + " & " + str(truth_table[0][2]) + " & \\cdots & " + str(truth_table[0][3]) + " \\\\ " + "\\hline "
    for i in range(1,9):
        latex_truth_table += str(truth_table[i][0]) + " & " + str(truth_table[i][1]) + " & " + str(truth_table[i][2]) + " & \\cdots & " + str(truth_table[i][3]) + " \\\\ "
    latex_truth_table += "\\end{array}"
    latex_truth_table = latex_truth_table.replace("True", "\\text{T}")
    latex_truth_table = latex_truth_table.replace("False", "\\text{F}")
        
    

    return {
        "Statement": nice_statement,
        "Truth_Table": latex_truth_table,
    }
