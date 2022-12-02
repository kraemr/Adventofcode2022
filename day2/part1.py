


# rock: X paper: Y and scissors: Z
# for enemy A = rock B = Paper C = scissors
# rock = 1, point paper = 2, scissors = 3 points

def play_rps(me,enemy):
    if me == enemy:
        return 3 # is a draw
    elif me == 'A' and enemy == 'B' or me == 'B' and enemy == 'C' or me == 'C' and enemy == 'A':
        return 0 # lose
    else: 
        return 6

#X means you need to lose, 
#Y means you need to end the round in a draw, 
#Z means you need to win. Good luck!"

def play_rps_newstrat(me,enemy)
    if me == 'X'

file = open('input.txt','r')
Lines = file.readlines()
points = 0
for line in Lines:
    point = 0
    passchr = '0'
    if line[2] == 'X': #rock 1 point
        point = 1
        passchr = 'A'
    elif line[2] == 'Y':# paper 2 point 
        point = 2
        passchr = 'B'
    else:
        point = 3
        passchr = 'C'
    roundpoint = play_rps( passchr,line[0]) 
    points += roundpoint + point

print(points)
