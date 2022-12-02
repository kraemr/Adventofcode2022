



#X means you need to lose, 
#Y means you need to end the round in a draw, 
#Z means you need to win. Good luck!"

# A is rock 
# B is paper 
# C is scissors 

file = open('input.txt','r')
Lines = file.readlines()


def play_rps(me,enemy):
    if me == enemy:
        return 3 # is a draw
    elif me == 'A' and enemy == 'B' or me == 'B' and enemy == 'C' or me == 'C' and enemy == 'A':
        return 0 # lose
    else: 
        return 6

def get_point(passchr):
    if passchr == 'A':
        return 1
    elif passchr == 'B':
        return 2
    else:
        return 3
points = 0
for line in Lines:
    passchr = '0'
    point = 0
    if line[2] == 'X':
        # we need to lose
        if line[0] == 'A':
            passchr = 'C'
            point = get_point(passchr)
        elif line[0] == 'B':
            passchr = 'A'
            point = get_point(passchr)
        else:
            passchr = 'B'
            point = get_point(passchr)

    elif line[2] == 'Y':
        # we need to draw
        passchr = line[0]
        point = get_point(passchr)

    else:
        # we need to win
        if line[0] == 'A':
            passchr = 'B'
            point = get_point(passchr)
        elif line[0] == 'B':
            passchr = 'C'
            point = get_point(passchr)
        else:
            passchr = 'A'
            point = get_point(passchr)

    roundpoint =play_rps(passchr,line[0])
    print('roundpoint ',roundpoint , ' point: ', point,'Chose: ',passchr,' vs ',line[0],' condition: ',line[2])
    points += point + roundpoint

print(points)
        