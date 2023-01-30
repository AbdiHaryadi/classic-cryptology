from flask import *  
from fileinput import filename
from werkzeug.utils import secure_filename
import os

UPLOAD_FOLDER = './upload'

app = Flask(__name__)  
  
@app.route('/')  
def input():  
   return render_template('hillCypherPage.html')  
  
@app.route('/hill',methods = ['GET', 'POST'])  
def hillCypher():
#    method get buat nampilin plaintext sama cyphertext
   if request.method == 'POST':
      # other  
      result = request.form
      # file upload
      files=request.files["upload"]
      # sanitize user input
      filename = secure_filename(files.filename)
      # file directory
      file_direct = os.path.join(UPLOAD_FOLDER, filename)
      # save file upload to upload folder
      files.save(file_direct)
      # read file txt
      print("coba read")
      with open(file_direct, 'r') as f:
         lines = f.readlines()
         print(lines)
      
      print("res",result)
      return render_template("result.html",result = result)  
   
if __name__ == '__main__':  
   app.run(debug = True)