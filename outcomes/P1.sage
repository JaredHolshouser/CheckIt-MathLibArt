def generator():
    #generating random spinners
    spinner_product = 1
    sizes = []
    temp = 0
    for x in range(20):
        temp = randrange(2,7)
        if (spinner_product*temp < 40 and len(sizes) < 3):
            spinner_product = spinner_product*temp
            sizes.append(temp)
    n = len(sizes)
    first_sizes = sizes[0:-1]
    first_size_string = str(first_sizes)[1:-1] + ","
    if n == 2:
        first_size_string = first_size_string.replace(",","")
    
    last_size = sizes[-1]

    #find the total sum of the spinners
    spinner_sum = sum(sizes)
    
    #write some prompts "What is the probability that ..."
    comparing_amount = randrange(3,spinner_sum - 1)
    prompts = [
        "the sum of the spinner results is even",
        "the sum of the spinner results is odd",
        "the first spinner lands on an even number",
        "the first spinner lands on an odd number",
        "the sum of the spinner results is less than "+str(comparing_amount),
        "the sum of the spinner results is more than "+str(comparing_amount),
    ]
    prompt_number = choice(range(6))
    
    prompt = prompts[prompt_number]
    

    #Make the sample space
    
    if n == 2:
        sample_space = [(i+1,j+1) for i in range(sizes[0]) for j in range(sizes[1])]
        #building the obnoxious string
        array_alignment = ""
        for i in range(sizes[1]):
            array_alignment += "l"
        sample_space_string = "\\begin{array} {"+array_alignment+"} \\{"
        #make everything but the last row
        for i in range(sizes[0] - 1):
            #make everything but the last row entry
            for j in range(sizes[1] - 1):
                sample_space_string += "(" + str(i+1) + "," + str(j+1) + "), & "
            #make the last row entry
            sample_space_string += "(" + str(i+1) + "," + str(sizes[1]) + "), \\\\ "
        #make the last row except for the last entry
        for j in range(sizes[1] - 1):
            sample_space_string += "(" + str(sizes[0]) + "," + str(j+1) + "), & "
        #make the very last entry
        sample_space_string += "(" + str(sizes[0]) + "," + str(sizes[1]) + ") \\}"
            
    if n == 3:
        sample_space = [(i+1,j+1,k+1) for i in range(sizes[0]) for j in range(sizes[1]) for k in range(sizes[2])]
        #building the obnoxious string
        array_alignment = ""
        for i in range(sizes[1]*sizes[2]):
            array_alignment += "l"
        sample_space_string = "\\begin{array} {"+array_alignment+"} \\{"
        #make everything but the last row
        for i in range(sizes[0] - 1):
            #make everything but the last subrow inside of the current row
            for j in range(sizes[1] - 1):
                for k in range(sizes[2]):
                    sample_space_string += "(" + str(i+1) + "," + str(j+1) + "," + str(k+1) + "), & "
            #make the last subrow except the last row enry
            for k in range(sizes[2] - 1):
                    sample_space_string += "(" + str(i+1) + "," + str(sizes[1]) + "," + str(k+1) + "), & "
            #make the last row entry
            sample_space_string += "(" + str(i+1) + "," + str(sizes[1]) + "," + str(sizes[2]) + "), \\\\ "
        #make the last row except for the last subrow of the last row
        for j in range(sizes[1] - 1):
            for k in range(sizes[2]):
                    sample_space_string += "(" + str(sizes[0]) + "," + str(j+1) + "," + str(k+1) + "), & " 
        #make the last subrow in the last row except the last entry
        for k in range(sizes[2] - 1):
            sample_space_string += "(" + str(sizes[0]) + "," + str(sizes[1]) + "," + str(k+1) + "), & "
        #make the very last entry
        sample_space_string += "(" + str(sizes[0]) + "," + str(sizes[1]) + "," + str(sizes[2]) + ") \\}"
    
    sample_space_string += "\\end{array}"
    bottom = len(sample_space)
     
    #Make the answers
    if prompt_number == 0:
        answers = [t for t in sample_space if sum(t)%2 == 0 ]
    if prompt_number == 1:
        answers = [t for t in sample_space if not(sum(t)%2 == 0)]
    if prompt_number == 2:
        answers = [t for t in sample_space if t[0]%2 == 0]
    if prompt_number == 3:
        answers = [t for t in sample_space if not(t[0]%2 == 0)]
    if prompt_number == 4:
        answers = [t for t in sample_space if sum(t) < comparing_amount]
    if prompt_number == 5:
        answers = [t for t in sample_space if sum(t) > comparing_amount]
    top = len(answers)
    

    return {
        "Spinner_Amount": n,
        "Spinner_Sizes": first_size_string,
        "Last_Spinner_Size": last_size,
        "Prompt": prompt,
        "Sample_Space": sample_space_string,
        "Top": top,
        "Bottom": bottom,
    }
