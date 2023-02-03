from flask import *  
from fileinput import filename
from werkzeug.utils import secure_filename

from algorithm.hillCipher import HillCipher
from algorithm.playfair_cipher import PlayfairCipher
from algorithm.affine_cipher import AffineCipher
from algorithm.standard_vigenere_cipher import StandardVigenereCipher
from algorithm.auto_key_vigenere_cipher import AutoKeyVigenereCipher
from algorithm.extended_vigenere_cipher import ExtendedVigenereCipher

from utils.utils import *
import re
import os

UPLOAD_FOLDER = './upload'
# DOWNLOAD_FOLDER = './result'

def display5LetterGroup(text):
    result = re.findall('.{1,5}', text)
    result = ' '.join(result)
    return result


app = Flask(__name__)  
  
@app.route('/')  
def index():  
   return render_template('index.html')  
  
@app.route('/hill/encrypt',methods = ['GET', 'POST'])  
def hillCypher():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key_size = int(input['text1'])
      # isi key
      key_input = input['text2']
      key = formTextToArray(key_input, key_size)
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      # file upload
      # files=request.files["upload"]
      # sanitize user input
      # filename = secure_filename(files.filename)
      # # file directory
      # file_direct = os.path.join(UPLOAD_FOLDER, filename)
      
      # download result directory
      # ada if enc or decrypt harusnya
      # DOWNLOAD_FOLDER = os.path.join('./result/encrypted/', filename)

      # save file upload to upload folder
      # files.save(file_direct)
      # # read file txt
      # print("coba read")
      # plain = read_file(files)
      # # read key


      # Hill Cypher algorithm
      hill = HillCipher(plain=plain, key=key)
      print(hill.getKey())
      # do cypher
      hill.doEncryptAll()
      cypher = ''.join(hill.getCypher())
      print("res",input)
      print("hasil", cypher)
      print(hill.getKey())
      return render_template("hill.html", mode="Encrypt", plaintext=plain, result=cypher, n=key_size, array=key_input, display=display)
   
   return render_template("hill.html", mode="Encrypt", display="option1")


@app.route('/hill/decrypt',methods = ['GET', 'POST'])  
def hillDecrypt():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key_size = int(input['text1'])
      # isi key
      key_input = input['text2']
      key = formTextToArray(key_input,key_size)
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # Hill Cypher algorithm
      hill = HillCipher(cypher=cypher, key=key)
      print(hill.getKey())
      # do cypher
      hill.doDecryptAll()
      plain = ''.join(hill.getPlain())
      print("res",input)
      print("hasil", plain)
      print(hill.getKey())
      return render_template("hill.html", mode="Decrypt", ciphertext=cypher, result=plain, n=key_size, array=key_input, display=display)
   
   return render_template("hill.html", mode="Decrypt", display="option1")


@app.route('/playfair/encrypt',methods = ['GET', 'POST'])
def playfairCypher():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = int(input['text1'])
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair Cipher algorithm, , sementara ku Hill biar bisa jalan html nya :v
      playfair = PlayfairCipher(key=key)
      # do cypher
      cypher = playfair.encrypt(plain)
      
      return render_template("playfair.html", mode="Encrypt", plaintext=plain, result=cypher, key=key, display=display)
   
   return render_template("playfair.html", mode="Encrypt", display="option1")

@app.route('/playfair/decrypt',methods = ['GET', 'POST'])
def playfairDecrypt():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = int(input['text1'])
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair algorithm, sementara ku Hill biar bisa jalan html nya :v
      playfair = PlayFairCipher(key=key)
      # do decrypt
      plain = playfair.decrypt(cypher)


      return render_template("playfair.html", mode="Decrypt", ciphertext=cypher, result=plain, key=key, display=display)
   
   return render_template("playfair.html", mode="Decrypt", display="option1")

@app.route('/affine/encrypt',methods = ['GET', 'POST'])  
def affineCypher():

   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci skala
      skala = int(input['text1'])
      # ukuran kunci bias 
      bias = int(input['text2'])
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # Affine Cypher algorithm, sementara ku Hill biar bisa jalan html nya :v
      affine = AffineCipher(scale_key=skala, bias_key=bias)
      # do cypher
      cypher = affine.encrypt(plain)
      
      return render_template("affine.html", mode="Encrypt", plaintext=plain, result=cypher, skala=skala, bias=bias, display=display)
   
   return render_template("affine.html", mode="Encrypt", display="option1")


@app.route('/affine/decrypt',methods = ['GET', 'POST'])  
def affineDecrypt():

   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci skala
      skala = int(input['text1'])
      # ukuran kunci bias
      bias = int(input['text2'])
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # Affine Cypher algorithm, sementara ku Hill biar bisa jalan html nya :v
      affine = AffineCipher(scale_key=skala, bias_key= bias)
      # do decrypt
      plain = affine.decrypt(cypher)


      return render_template("affine.html", mode="Decrypt", ciphertext=cypher, result=plain, skala=skala, bias=bias, display=display)
   
   return render_template("affine.html", mode="Decrypt", display="option1")




@app.route('/standard/encrypt',methods = ['GET', 'POST'])
def standardVigenereCypher():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair Cipher algorithm, , sementara ku Hill biar bisa jalan html nya :v
      standard = StandardVigenereCipher(key=key)
      # do cypher
      cypher = standard.encrypt(plain)
      
      return render_template("standard.html", mode="Encrypt", plaintext=plain, result=cypher, key=key, display=display)
   
   return render_template("standard.html", mode="Encrypt", display="option1")


@app.route('/standard/decrypt',methods = ['GET', 'POST'])
def standardVigenereDecrypt():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair algorithm, sementara ku Hill biar bisa jalan html nya :v
      standard = StandardVigenereCipher(key=key)
      # do decrypt
      plain = standard.decrypt(cypher)


      return render_template("standard.html", mode="Decrypt", ciphertext=cypher, result=plain, key=key, display=display)
   
   return render_template("standard.html", mode="Decrypt", display="option1")



@app.route('/autokey/encrypt',methods = ['GET', 'POST'])
def autoKeyVigenereCypher():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair Cipher algorithm, , sementara ku Hill biar bisa jalan html nya :v
      autokey = AutoKeyVigenereCipher(key=key)
      # do cypher
      cypher = autokey.encrypt(plain)
      
      return render_template("autokey.html", mode="Encrypt", plaintext=plain, result=cypher, key=key, display=display)
   
   return render_template("autokey.html", mode="Encrypt", display="option1")


@app.route('/autokey/decrypt',methods = ['GET', 'POST'])
def autoKeyVigenereDecrypt():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair algorithm, sementara ku Hill biar bisa jalan html nya :v
      autokey = AutoKeyVigenereCipher(key=key)
      # do decrypt
      plain = autokey.decrypt(cypher)


      return render_template("autokey.html", mode="Decrypt", ciphertext=cypher, result=plain, key=key, display=display)
   
   return render_template("autokey.html", mode="Decrypt", display="option1")


@app.route('/extended/encrypt',methods = ['GET', 'POST'])
def extendedVigenereCypher():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      plain = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair Cipher algorithm, , sementara ku Hill biar bisa jalan html nya :v
      extended = ExtendedVigenereCipher(key=key)
      # do cypher
      cypher = extended.encrypt(plain)
      
      return render_template("extended.html", mode="Encrypt", plaintext=plain, result=cypher, key=key, display=display)
   
   return render_template("extended.html", mode="Encrypt", display="option1")


@app.route('/extended/decrypt',methods = ['GET', 'POST'])
def extendedVigenereDecrypt():
   if request.method == 'POST':
      # other  
      input = request.form
      # ukuran kunci
      key = input['text1']
      # plaintext
      cypher = input['text3']
      # display
      display = input['inlineRadio']
      
      # file handle

      # playfair algorithm, sementara ku Hill biar bisa jalan html nya :v
      extended = ExtendedVigenereCipher(key=key)
      # do decrypt
      plain = extended.decrypt(cypher)


      return render_template("extended.html", mode="Decrypt", ciphertext=cypher, result=plain, key=key, display=display)
   
   return render_template("extended.html", mode="Decrypt", display="option1")


# @app.route('/download')
# def download():
#     uploads = os.path.join(current_app.root_path, DOWNLOAD_FOLDER)
#     return send_from_directory(directory=uploads, filename=filename)  

# @app.route('/download')
# def download_file():
#    return send_file(DOWNLOAD_FOLDER, as_attachment=True)

if __name__ == '__main__':  
   app.config['TEMPLATES_AUTO_RELOAD'] = True
   app.run(debug = True)