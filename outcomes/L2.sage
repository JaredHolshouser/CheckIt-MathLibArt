def generator():
    #basic building blocks for the statements
    blocks1_simple = [
        "(P&Q)",
        "(P|Q)",
        "(P->Q)",
        "(Q->P)",
        "(P&R)",
        "(P|R)",
        "(P->R)",
        "(R->P)",
    ]
    
    blocks1_complex = [
        "(~P&Q)",
        "(~P|Q)",
        "(~P->Q)",
        "(~Q->P)",
        "(P&~Q)",
        "(P|~Q)",
        "(P->~Q)",
        "(Q->~P)",
        "(~P&R)",
        "(~P|R)",
        "(~P->R)",
        "(~R->P)",
        "(P&~R)",
        "(P|~R)",
        "(P->~R)",
        "(R->~P)",
    ]
    
    blocks2_simple = [
        "(Q&R)",
        "(Q|R)",
        "(Q->R)",
        "(R->Q)",
    ]
    
    blocks2_complex = [
        "(~Q&R)",
        "(~Q|R)",
        "(~Q->R)",
        "(~R->Q)",
        "(Q&~R)",
        "(Q|~R)",
        "(Q->~R)",
        "(R->~Q)",
    ]
    
    #Connectors
    connectors_simple = [
        "&",
        "|",
        "->",
    ]
    
    connectors_complex = [
        "&~",
        "|~",
        "->~",
    ]
    
    #generating a random formula
    #0 = complex simple simple, 1 = simple complex simple, and 2 = simple simple complex
    structures = [0,1,2]
    structure = choice(structures)
    
    if structure == 0:
        choice1 = randrange(0,len(blocks1_complex))
        block1 = blocks1_complex[choice1]
        conn_choice = randrange(0,len(connectors_simple))
        connection = connectors_simple[conn_choice]
        choice2 = randrange(0,len(blocks2_simple))
        block2 = blocks2_simple[choice2]
    elif structure == 1:
        choice1 = randrange(0,len(blocks1_simple))
        block1 = blocks1_simple[choice1]
        conn_choice = randrange(0,len(connectors_complex))
        connection = connectors_complex[conn_choice]
        choice2 = randrange(0,len(blocks2_simple))
        block2 = blocks2_simple[choice2]
    else:
        choice1 = randrange(0,len(blocks1_simple))
        block1 = blocks1_simple[choice1]
        conn_choice = randrange(0,len(connectors_simple))
        connection = connectors_simple[conn_choice]
        choice2 = randrange(0,len(blocks2_complex))
        block2 = blocks2_complex[choice2]
    
    #Decide the order of the blocks
    coin_flip = randrange(0,2)
    if coin_flip == 0:
        statement = block1 + connection + block2
    else:
        statement = block2 + connection + block1
    
    f = propcalc.formula(statement)
    truth_table = [["P", "Q", "R", "\\text{Final Column}"]]
    for value1 in [True, False]:
        for value2 in [True, False]:
            for value3 in [True, False]:
                truth_table.append([value1, value2, value3, f.evaluate({'P':value1, 'Q':value2, 'R':value3})])

    nice_statement = statement.replace("&", " \\wedge ")
    nice_statement = nice_statement.replace("|", " \\vee ")
    nice_statement = nice_statement.replace("->", " \\rightarrow ")
    nice_statement = nice_statement.replace("~", "\\sim ")
    
    latex_truth_table = "\\begin{array}{lllcc} " + str(truth_table[0][0]) + " & " + str(truth_table[0][1]) + " & " + str(truth_table[0][2]) + " & \\cdots & " + str(truth_table[0][3]) + " \\\\ " + "\\hline "
    for i in range(1,9):
        latex_truth_table += str(truth_table[i][0]) + " & " + str(truth_table[i][1]) + " & " + str(truth_table[i][2]) + " & \\cdots & " + str(truth_table[i][3]) + " \\\\ "
    latex_truth_table += "\\end{array}"
    latex_truth_table = latex_truth_table.replace("True", "\\text{True}")
    latex_truth_table = latex_truth_table.replace("False", "\\text{False}")
        
    

    return {
        "Statement": nice_statement,
        "Truth_Table": latex_truth_table,
    }
