from playfair_cipher import PlayfairCipher
import nltk
import random
import math
import time

with open("cryptanalysis_data/ciphertext3.txt", mode="r") as file:
    ciphertext = file.read()

ciphertext = ciphertext.replace("\n", "")
ciphertext = ciphertext[:512]

with open("cryptanalysis_data/log_quadgrams.txt", mode="r") as file:
    data = file.read()

log_frequencies = {}
for line in data.strip().split("\n"):
    quadgram, log_count = line.split(" ")
    log_count = float(log_count)
    log_frequencies[quadgram] = log_count

def random_key():
    key_char_list = list("ABCDEFGHIKLMNOPQRSTUVWXYZ")
    random.shuffle(key_char_list)
    return "".join(key_char_list)

def switch_random_column(key):
    first_index = random.randint(0, 4)
    second_index = first_index
    while second_index == first_index:
        second_index = random.randint(0, 4)

    key_char_list = list(key)
    first_column = key_char_list[first_index::5]
    second_column = key_char_list[second_index::5]

    for row in range(5):
        key_char_list[row * 5 + first_index] = second_column[row]
        key_char_list[row * 5 + second_index] = first_column[row]

    return "".join(key_char_list)

def switch_random_row(key):
    first_index = random.randint(0, 4)
    second_index = first_index
    while second_index == first_index:
        second_index = random.randint(0, 4)

    key_char_list = list(key)
    first_row = key_char_list[(first_index * 5):((first_index + 1) * 5)]
    second_row = key_char_list[(second_index * 5):((second_index + 1) * 5)]

    for col in range(5):
        key_char_list[first_index * 5 + col] = second_row[col]
        key_char_list[second_index * 5 + col] = first_row[col]

    return "".join(key_char_list)

def reverse(key):
    return key[::-1]

def flip_horizontal(key):
    key_char_list = list(key)
    for row in range(5):
        old_row = key_char_list[(row * 5):((row + 1) * 5)]
        for col in range(5):
            key_char_list[row * 5 + col] = old_row[4 - col]

    return "".join(key_char_list)

def flip_vertical(key):
    key_char_list = list(key)
    for col in range(5):
        old_col = key_char_list[col::5]
        for row in range(5):
            key_char_list[row * 5 + col] = old_col[4 - row]

    return "".join(key_char_list)
    
def shuffle_key(key):
    random_number = random.randint(1, 6)

    if random_number == 1:
        new_key = switch_random_column(key)
    elif random_number == 2:
        new_key = switch_random_row(key)
    elif random_number == 3:
        new_key = reverse(key)
    elif random_number == 4:
        new_key = flip_horizontal(key)
    elif random_number == 5:
        new_key = flip_vertical(key)
    else:
        new_key = random_switch_cell(key)

    return new_key

def random_switch_cell(key):
    key_char_list = list(key)
    first_index = random.randint(0, 24)

    second_index = first_index
    while second_index == first_index:
        second_index = random.randint(0, 24)

    first_char = key_char_list[first_index]
    second_char = key_char_list[second_index]

    key_char_list[first_index] = second_char
    key_char_list[second_index] = first_char

    return "".join(key_char_list)

def fitness(key):
    message = PlayfairCipher(key).decrypt(ciphertext)

    # Clean the message first
    clean_message = ""
    for index in range(0, len(message), 2):
        quadgram = message[index:index+2]
        if len(quadgram) == 1:
            clean_message += quadgram
        elif quadgram[1] == "X":
            clean_message += quadgram[0]
        else:
            clean_message += quadgram

    fitness_value = 0.0
    quadgram_count = 0
    for quadgram in nltk.ngrams(message, 4):
        quadgram = "".join(quadgram)
        if quadgram not in log_frequencies:
            quadgram = "<UNK>"

        fitness_value += log_frequencies[quadgram]
        quadgram_count += 1

    return fitness_value / quadgram_count

current_best_key = ""
current_best_fitness = -99999999999.0

total_iteration = 50000
for epoch in range(100):
    parent_key = random_key()
    parent_fitness = fitness(parent_key)

    for iteration in range(total_iteration, 0, -1):
        temperature = 10 * iteration / total_iteration
        child_key = shuffle_key(parent_key)
        child_fitness = fitness(child_key)

        delta_fitness = child_fitness - parent_fitness
        if delta_fitness >= 0:
            parent_key = child_key
            parent_fitness = child_fitness
            print(iteration, parent_key, parent_fitness)
        else:
            if random.random() < math.exp(parent_fitness / temperature):
                parent_key = child_key
                parent_fitness = child_fitness
                print(iteration, parent_key, parent_fitness)

    print("---Result---")
    print("Key:", parent_key)
    print("Fitness:", parent_fitness)

    if current_best_fitness < parent_fitness:
        print("NEW BEST!")
        current_best_key = parent_key
        current_best_fitness = parent_fitness
        print("Plaintext:")
        print(PlayfairCipher(current_best_key).decrypt(ciphertext[:256]))
    else:
        print("---")
        print(f"Current best: {current_best_key} (fitness: {current_best_fitness})")
        print("Plaintext:")
        print(PlayfairCipher(current_best_key).decrypt(ciphertext[:256]))

    print("Continue in 5 seconds ....")
    time.sleep(5)
