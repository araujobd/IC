import random

def save_values(value):
    save = open('values.csv', 'w')
    content = []
    for k, v in value.items():
        content.append(str(k) + ',' + str(v) + '\n')
    save.writelines(content)
    save.close()

def read_values():
    try:
        save = open('values.csv', 'r')
        lines = save.readlines()
        print(...)
    except:
        return initialize()
        

def rand_play(state, p):
    a = random.randint(1, min(state, 100 - state))
    if (random.random() <= p):
        s = state + a
    else:
        s = state - a
    return s

def initialize():
    v = {}
    for i in range(0,100):
        v[i] = 0
    v[100] = 1
    return v

def main():
    alfa = 0.01
    p = 0.4
    value = initialize()
    count = 0
    try:
        while(True):
            for state in range(1,100):
                next_state = rand_play(state, p)
                aux = value[next_state] - value[state]
                value[state] = value[state] + (alfa * aux)
            count = count + 1
    except:
        save_values(value)
        print(value.items())
        print()
        print(count)

main()
