import numpy as np

def remove(string_input):
    #define special characters list
    numbers = ['0','1','2','3','4','5','6','7','8','9']
    special_characters = ['!','#','$','%', '&','@','[',']',' ',']','_', '\n']
    clean_number = ''.join(filter(lambda i:i not in numbers, string_input))
    clean_number_special_char = ''.join(filter(lambda i:i not in special_characters, clean_number))
    return clean_number_special_char

def read_file(path):
    chars = []
    with open(path, 'r') as f:
       line = remove(f.read())
       chars += list(line)
    return chars

def formKeyMatricesFromInput(entry, n):
    matrices= np.array(entry).reshape(n, n)
    return matrices

def formTextToArray(string, n):
    listNumber = string.split()
    print(listNumber)
    for i in range(len(listNumber)):
        listNumber[i] = int(listNumber[i])
    print(listNumber)
    array = np.array(listNumber).reshape(n,n).tolist()
    return array

if __name__ == '__main__':
    print(formTextToArray("17 17 18 19 20 21 22 23 22", 3))