def generator():
    
    #choose a random scenario
    random_scenario = choice(["disjoint","overlaps"])
    
    #phrasing1, disjoint
    if random_scenario == "disjoint":
        #generate a random number of tiles
        n = randrange(2,5)*10
        r = randrange(3,round((1/3)*n,0))
        b = randrange(3,round((1/4)*n,0))
        g = n-r-b

        #generate a random color
        colors = ["red","blue","green"]
        color1 = choice(colors)
        colors.remove(color1)
        color2 = choice(colors)

        #compute probabilities: OR first
        if color1 == "red" and color2 == "blue":
            ProbOr = (r+b)/n
            ProbOrString = "\\frac{"+str(r)+"+"+str(b)+"}{"+str(n)+"}"
            ProbNot = (b+g)/n
            ProbNotString = "1 - \\frac{"+str(r)+"}{"+str(n)+"}"
        if color1 =="red" and color2 =="green":
            ProbOr = (r+g)/n
            ProbOrString = "\\frac{"+str(r)+"+"+str(g)+"}{"+str(n)+"}"
            ProbNot = (b+g)/n
            ProbNotString = "1 - \\frac{"+str(r)+"}{"+str(n)+"}"
        if color1=="blue" and color2 =="red":
            ProbOr = (r+b)/n
            ProbOrString = "\\frac{"+str(b)+"+"+str(r)+"}{"+str(n)+"}"
            ProbNot = (r+g)/n
            ProbNotString = "1 - \\frac{"+str(b)+"}{"+str(n)+"}"
        if color1 =="blue" and color2 =="green":
            ProbOr = (g+b)/n
            ProbOrString = "\\frac{"+str(b)+"+"+str(g)+"}{"+str(n)+"}"
            ProbNot = (r+g)/n
            ProbNotString = "1 - \\frac{"+str(b)+"}{"+str(n)+"}"
        if color1 == "green" and color2 =="red":
            ProbOr = (r+g)/n
            ProbOrString = "\\frac{"+str(g)+"+"+str(r)+"}{"+str(n)+"}"
            ProbNot = (r+b)/n
            ProbNotString = "1 - \\frac{"+str(g)+"}{"+str(n)+"}"
        if color1 =="green" and color2=="blue":
            ProbOr = (b+g)/n
            ProbOrString = "\\frac{"+str(g)+"+"+str(b)+"}{"+str(n)+"}"
            ProbNot = (r+b)/n
            ProbNotString = "1 - \\frac{"+str(g)+"}{"+str(n)+"}"

        return {
            "scenario": {random_scenario: True},
            "n":n,
            "r":r,
            "b":b,
            "g":g,
            "color1":color1,
            "color2":color2,
            "ProbOr":ProbOr,
            "ProbOrString": ProbOrString,
            "ProbNot":ProbNot,
            "ProbNotString": ProbNotString,
        }
    
    #phrasing2, overlaps
    else:
        #choose A - ??
        letters = ["E","F","G","H","I"]
        end_letter_index = randrange(0,len(letters))
        end_letter = letters[end_letter_index]
        #choose 1 - ??
        end_number = randrange(5,12)

        #choose starting column range and ending column range
        all_letters = ["A","B","C","D"] + letters[0:end_letter_index+1]
        start_col_index = randrange(len(all_letters)-1)
        start_col = all_letters[start_col_index]
        end_col_index = randrange(start_col_index+1,len(all_letters))
        end_col = all_letters[end_col_index]

        #choose a starting row and ending row
        start_row = randrange(1,end_number)
        end_row = randrange(start_row+1, end_number+1)

        #calculate the column probability
        col_difference = end_col_index - start_col_index + 1
        col_total = len(all_letters)
        col_prob = col_difference/col_total
        #calculate the row probability
        row_difference = end_row - start_row + 1
        row_total = end_number
        row_prob = row_difference/row_total
        #calculate the overlap probability
        overlap_amount = row_difference*col_difference
        total_total = col_total*row_total
        overlap_prob = overlap_amount/total_total
        #calculate the or probability
        or_prob = col_prob + row_prob - overlap_prob
        or_prob_string = "\\frac{"+str(col_difference)+"}{"+str(col_total)+"} + \\frac{"+str(row_difference)+"}{"+str(row_total)+"} - \\frac{"+str(overlap_amount)+"}{"+str(total_total)+"}"
        #calculate the not probability
        not_prob = 1 - col_prob
        not_prob_string = "1 - \\frac{"+str(col_difference)+"}{"+str(col_total)+"}"

        return {
            "scenario": {random_scenario: True},
            "end_letter":end_letter,
            "end_number":end_number,
            "start_col":start_col,
            "end_col":end_col,
            "start_row":start_row,
            "end_row":end_row,
            "or_prob":or_prob,
            "or_prob_string": or_prob_string,
            "not_prob":not_prob,
            "not_prob_string": not_prob_string,
        }