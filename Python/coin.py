import random

def save_values(value, values = 'values.csv'):
    save = open(values, 'w')
    content = []
    for k, v in value.items():
        content.append(str(k) + ' ' + str(v) + '\n')
    save.writelines(content)
    save.close()

def read_values(values = 'values.csv'):
    try:
        save = open(values, 'r')
        lines = save.readlines()

        value = {}
        for i in lines:
            k, v = i.strip().split(' ')
            value[int(k)] = float(v)
        #print(...)
    except:
        return initialize()

def rand_play(state, p):
    a = random.randint(1, min(state, 100 - state))
    if (random.random() >= p):
        s = state + a
    else:
        s = state - a
    return s

def best_play(value, state):
    best = 1
    for i in range(1, min(state, (100 - state))):
        if (value[i] >= value[best]):
            best = i
    return best

def generate_graph(value):
    aux = {}
    for i in range(1, 100):
        aux[i] = best_play(value, i)
    save_values(aux, 'graph.csv')

def initialize():
    v = {}
    for i in range(0, 100):
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
            for state in range(1, 100):
                next_state = rand_play(state, p)
                aux = value[next_state] - value[state]
                value[state] = value[state] + (alfa * aux)
            count += 1
    except:
        save_values(value)
        generate_graph(value)
        print(count)

main()
