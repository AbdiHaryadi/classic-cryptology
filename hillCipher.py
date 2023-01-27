import numpy as np
from numpy.linalg import inv
import string


class HillCipher:
    def __init__(self, plain=None, cypher=None, key=None):
        self.plain = plain if plain else np.array([])
        self.cypher = cypher if cypher else np.array([])
        self.key = key
        self.maxPartisi = 3 if (len(self.key)==3) else 2

    def setCypher(self, cypher):
        self.cypher = cypher
    
    def getPlain(self):
        return self.plain
    
    def getKey(self):
        return self.key

    def getCypher(self):
        return self.cypher
    
    def encrypt(self, partialPlain):
        return np.matmul(self.key, partialPlain.transpose())%26

    def doEncryptAll(self):
        # mengencrypt per maxPartisi huruf
        count = 0
        partisi = np.array([])
        cypherNum = np.array([])
        idx = 0

        while ((len(self.getPlain())>idx)):
            # ubah alpha ke num dan append ke per partisi
            partisi = np.append(partisi, self.getPlain()[idx])
            count+=1
            if (count == self.maxPartisi):
                # lakukan encrypt partial dan append ke array encrypt
                partialPlainNum = self.convertAllAlphaToNum(partisi)
                cypherNum = np.append(cypherNum, self.encrypt(partialPlainNum))
                # hapus count dan kosongkan per3char
                count = 0
                partisi = np.array([])
            
            idx+=1
        
        # ubah num ke alpha lalu tambahkan ke self.cyper
        cypherAlpha = self.convertAllNumToAlpha(cypherNum.astype(int))
        self.cypher = np.append(self.cypher, cypherAlpha)
    


    def decrypt(self, partialCypher):
        print('inv', inv(self.key))
        return np.matmul(inv(self.key),partialCypher.transpose())%26
    
    def doDecryptAll(self):
        # mendecrypt per maxPartisi huruf
        count = 0
        partisi = np.array([])
        plainNum = np.array([])
        idx = 0

        while ((len(self.getCypher())>idx)):
            # ubah alpha ke num dan append ke per partisi
            partisi = np.append(partisi, self.getCypher()[idx])
            count+=1
            if (count == self.maxPartisi):
                # lakukan decrypt partial dan append ke array derypt
                partialCypherNum = self.convertAllAlphaToNum(partisi)
                plainNum = np.append(plainNum, self.decrypt(partialCypherNum))
                # hapus count dan kosongkan partisi
                count = 0
                partisi = np.array([])
            
            idx+=1
        
        # ubah num ke alpha lalu tambahkan ke self.plain
        plainAlpha = self.convertAllNumToAlpha(plainNum.astype(int))
        self.plain = np.append(self.plain, plainAlpha)

    def convertAllAlphaToNum(self, alpha):
        num = np.array([])
        for i in range(len(alpha)):
            num = np.append(num, self.alphaToNum(alpha[i]))
        return num
    
    def convertAllNumToAlpha(self, num):
        alpha = np.array([])
        for i in range(len(num)):
            alpha = np.append(alpha, self.numToAlpha(num[i]))
        return alpha

    def alphaToNum(self, alpha):
        # Increment character
        if alpha.isupper():
            # Use ascii_uppercase if character is uppercase
            letters = string.ascii_uppercase
        else:
            # Use ascii_lowercase if character is lowercase
            letters = string.ascii_lowercase
        
        # Find index of character in letters
        index = letters.index(alpha)

        return index
    
    def numToAlpha(self, num):
        ch = 'a'
        # Increment character
        if ch.isupper():
            # Use ascii_uppercase if character is uppercase
            letters = string.ascii_uppercase
        else:
            # Use ascii_lowercase if character is lowercase
            letters = string.ascii_lowercase
        
        # Find index of character in letters
        index = letters.index(ch)
        
        # Increment index and retrieve next character from letters
        str = letters[index + num]

        return str
    

# enkripsi testing

# 3*3
# test = HillCipher(['p','a','y','m','o','r','e','m','o','n','e','y'], [[17,17,5],[21,18,21],[2,2,19]])
# 2*2
# test = HillCipher(plain=['p','a','y','m'], key=[[17,17],[21,18]])
# print(test.getPlain())
# test.doEncryptAll()
# print(test.getCypher())

# deskripsi testing

# 3*3
test = HillCipher(cypher=['l','n','s'], key=[[17,17,5],[21,18,21],[2,2,19]])
print(test.getCypher())
test.doDecryptAll()
print(test.getPlain())

# 2*2
# test = HillCipher(cypher=['v','d','o','s'], key=[[17,17],[21,18]])
# print(test.getCypher())
# test.doDecryptAll()
# print(test.getPlain())