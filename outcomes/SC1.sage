def generator():
    
    
    #basic building blocks for the questions
    blocks1 = [
        "a ? A", #? will be \in
        "a ? A", #? will be \in
        "B < A", #| will be \subseteq
        "B < A", #| will be \subseteq
        "A < B",
        "A < B",
        "A > B", #> will be \supseteq
    ]
    
    #generating random sets
    size_a = randrange(4,13)
    start_a = randrange(1,6)
    A = Set([start_a..size_a+start_a])
    
    size_not = randrange(3,8)
    start_not = randrange(1,7)
    B = Set[start_not..size_not+start_not]
        
        
    #generating a random questoin
    elem = randrange(1,20)
    choice1 = randrange(0,len(blocks1))
    block1 = blocks1[choice1]
    
    question1 = block1
    
    #converting questin to text form
    text_question1 = question1.replace("?", " &#8712; ")
    text_question1 = text_question1.replace("<", " &#8838; ")
    text_question1 = text_question1.replace(">", " &#8839; ")
   
    #solving and creating a solution.
    if question1 == "a ? A":
        T = Set([elem])
        S = A.issuperset(T)
    if question1 == "B < A":
        S = A.issuperset(B)
    if question1 == "A < B":
        S = A.issubset(B)
    if question1 == "A > B":
        S = A.issuperset(B)
        
    #making the sets printer friendly
    A_string = str(A).replace("\\left\\","")
    A_string = A_string.replace("\\left\\","")
    B_string = str(B).replace("\\left\\","")
    B_string = B_string.replace("\\left\\","")
    

    return {
        "a": elem,
        "A": A,
        "B": B,
        "A_string": A_string,
        "B_string": B_string,
        "Find": text_question1,
        "Solution":S,
    }