from algorithm.hillCipher import HillCipher
from utils.utils import*


def remove(string_input):
    #define special characters list
    # string_input = string_input.replace("\n",'')
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

def write_file(chars):
    with open(chars, 'rb') as f:
       line = remove(f.read())
       line = f.read()
       chars += list(line)
    return chars


if __name__ == '__main__':  
#    p = './testing.txt'
#    print("tt")
#    input = read_file(p)
#    print(input)
#    mat = formTextToArray("17 17 18 19 20 21 22 23 22", 3)
#    test = HillCipher(plain=input, key=mat)
#    print('cek1')
#    print(len(test.getPlain()))
#    print('cek2')
#    test.doEncryptAll()
#    print('cek3')
#    print(list(test.getCypher()))

    test = HillCipher(cypher=['f', 'a', 'g', 'a', 'n', 'i', 'x', 'h', 'a', 'f', 'p', 's', 'l', 't', 'u', 'v', 'm', 'a', 'w', 'h', 'm', 'w', 'p', 'u', 'w', 'h', 'm', 't', 'f', 'm', 't', 'b', 'm', 't', 'm', 'x', 'f', 'a', 'd', 'l', 't', 'u', 'l', 't', 'u', 'l', 't', 'u', 't', 'b', 'm', 'w', 'p', 'u', 'a', 'y', 'w'], key=[[17,17,18],[19,20,21],[22,23,22]])
    print('cek1')
    print(len(test.getCypher()))
    print('cek2')
    test.doDecryptAll()
    print('cek3')
    print(list(test.getPlain()))


   