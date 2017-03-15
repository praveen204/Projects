from flask import Flask, render_template, request
from flask_cors import CORS, cross_origin
import json
import re
app = Flask(__name__)

cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'
@app.route('/')
def tes_first_page():
       return render_template("Home2.html")
      
      

@app.route('/v1/prices',methods = ['POST'])
@cross_origin()
def result():
      reques_data =request.form

      print reques_data

      print request.form['src_zip']
      final_dict = {}
      count = 1
      for key, value in reques_data.iteritems():
            s1 = re.search(r'src',key)
            s2 = re.search(r'dst',key)
            s3 = re.search(r'mid',key)
            print s3
            
            if s1:
                  final_dict['source']={'address':request.form['src_zip'].encode('utf-8')}
            elif s2:
                  final_dict['Destination']={'address':request.form['dst_zip']}
            elif s3:
                  print key
                  count+= 1
                  print count
            num_mid_points = count /5

            print num_mid_points
            
            if s3:

                  print "**********************************************************"

                  print request.form['mid1_zip']

                  for mid_value in range(1,num_mid_points+1):
                        mid_value1=str(mid_value)
                        final_dict['midpoint'+mid_value1]={'address':request.form['mid'+mid_value1+'_zip']}

      print final_dict

      return render_template("Menu.html",result = final_dict)




      
      # if request.method == 'POST':
      #       # request_data = request.get_json(force=True)
      #       res = request.form
      #       for key,value in res:
      #             print key,value
      #       print request_data['name']
      return "bhanu praksah"

if __name__ == '__main__':
   app.run(host="0.0.0.0",port =9999, debug=True,use_reloader=False,threaded=True)