def generator():
    
    
    #basic building blocks for the questions
    blocks1 = [
        "(A & B)", #& will be \cap
        "(A|B)", #| will be \cup
        "A~", #~ will be complement as ^c
        "B~",
        "@A@", #@ will be \vert
        "@B@",
        "(A & B)~",
        "(A|B)~",
        "A-B", #- will be \setminus
        "B-A",
        "A & B~",
        "A | B~",
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
        
        
    #generating a random questoin
    choice1 = randrange(0,len(blocks1))
    block1 = blocks1[choice1]
    
    question1 = block1
    
    #converting question to latex form
    latex_question1 = question1.replace("&", " \\cap ")
    latex_question1 = latex_question1.replace("|", " \\cup ")
    latex_question1 = latex_question1.replace("~", " ^{c} ")
    latex_question1 = latex_question1.replace("@", " \\vert ")
    latex_question1 = latex_question1.replace("-","\\setminus ")
    
    #converting the question to text form
    text_question1 = question1.replace("&", "&#8745;")
    text_question1 = text_question1.replace("|", "&#8746;")
    text_question1 = text_question1.replace("~", "&#x1D9C;")
    text_question1 = text_question1.replace("@", "|")
    text_question1 = text_question1.replace("-", "&#8726;")
   
    #solving and creating a solution.
    if question1 == "(A & B)":
        S = A.intersection(B)
    if question1 == "(A|B)":
        S = A.union(B)
    if question1 == "A~":
        S = U.difference(A)
    if question1 == "B~":
        S = U.difference(B)
    if question1 == "A-B":
        S = A.difference(B)
    if question1 == "B-A":
        S = B.difference(A)
    if question1 == "@A@":
        S = A.cardinality()
    if question1 == "@B@":
        S = B.cardinality()
    if question1 == "(A & B)~":
        S1 = A.intersection(B)
        S = U.difference(S1)
    if question1 == "(A|B)~":
        S1 = A.union(B)
        S = U.difference(S1)
    if question1 == "A & B~":
        S1 = U.difference(B)
        S = A.intersection(S1)
    if question1 == "A | B~":
        S1 = U.difference(B)
        S = A.union(S1)
    
    #making the sets printer friendly
    A_string = str(A).replace("\\left\\","")
    A_string = A_string.replace("\\left\\","")
    B_string = str(B).replace("\\left\\","")
    B_string = B_string.replace("\\left\\","")
    U_string = str(U).replace("\\left\\","")
    U_string = U_string.replace("\\left\\","")
    S_string = str(S).replace("\\left\\","")
    S_string = S_string.replace("\\left\\","")
        
    

    return {
        "Universe": U,
        "Universe_string": U_string,
        "A": A,
        "A_string": A_string,
        "B": B,
        "B_string": B_string,
        "Find": text_question1,
        "Solution":S,
        "Solution_string": S_string,
    }
