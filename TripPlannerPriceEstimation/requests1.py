from flask import Flask, jsonify, Response, request
from flask import render_template
from model import db
from model import User
from model import Price
from model import CreateDB
from model import app as application
import geocoder
import requests
import json
import re




app = Flask(__name__)


# def getCoordinates(address,city,state,zip):
#         addr = address+','+city+','+state+','+zip
#         g = geocoder.google(addr)
#         return g.latlng
@app.route('/')
def first_page():
    return render_template("Home2.html")
@app.route('/v1/locations', methods= ['POST'])
def locationDetails():
    

    final_dict = {}      
    request_data = request.get_json(force=True)
    # CreateDB(hostname = "localhost")
    # db.create_all()
    
    # result = request.formest
    for x in request_data:
        address = request_data[x]['address']
        city = request_data[x]['city']
        state = request_data[x]['state']
        zip   = request_data[x]['zip']

        addr = address+','+city+','+state+','+zip
        print addr
        url = 'https://maps.googleapis.com/maps/api/geocode/json'
        params = {
            'sensor': 'false', 
            'address': address,
            'city':city,
            'state':state
            }
        r = requests.get(url, params=params)
        results = r.json()['results']
        location = results[0]['geometry']['location']
        
        # g = geocoder.google('101 E san fernando st')
        # latitude = getCoordinates('101 E san fernando st','san jose','ca','95112')[0]
        # longitude = getCoordinates('101 E san fernando st','san jose','ca','95112')[1]
        latitude = location['lat']
        longitude = location['lng']
        loc = User(address,city,state,zip,latitude,longitude)
        db.session.add(loc)
        db.session.commit()

        db_obj = User.query.filter_by(address=address).first()
        id2 = db_obj.Id

        final_dict[x]={'id':id2,'address':address,'city':city,'state':state,'zip':zip,'latitude':latitude,'longitude':longitude}
        
    response1 = jsonify(final_dict)
    response1.status_code =201

    return response1

@app.route('/v1/prices', methods= ['POST'])
def prices():
    try:
    
        final_dict = {}   
        waypoint_final =[]

        reques_data =request.form
        count =0
        s1 =''
        s2 =''
        s3 =''
        print "Reeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeqqqqqqttttttttttttttttttdsts%%%%%%%%%%%%%%%%%%%%%%%"
        print reques_data
        r =[]

        for key, value in reques_data.iteritems():
            s1 = re.search(r'src',key)
            s2 = re.search(r'dst',key)
            s3 = re.search(r'mid',key)
            if s3:
                count+=1
                
                print key
                       
        url_google1 = 'https://maps.googleapis.com/maps/api/geocode/json'
        add1 = request.form['src_address'].encode('utf-8')
        city1 = request.form['src_city'].encode('utf-8')
        state1 = request.form['src_state'].encode('utf-8')
        zip1 = request.form['src_zip'].encode('utf-8')
        latitude = request.form['src_lat'].encode('utf-8')
        longitude = request.form['src_long'].encode('utf-8')

        loc = User(add1,city1,state1,zip1,latitude,longitude)
        db.session.add(loc)
        db.session.commit()


        final_dict['source']={'address':add1,
        'state':state1,
        'zip': zip1,
        'city':city1,
        'latitude':latitude,
        'longitude':longitude}

        
        url_google2 = 'https://maps.googleapis.com/maps/api/geocode/json'
        add1 = request.form['dst_address'].encode('utf-8')
        print add1
        city1 = request.form['dst_city'].encode('utf-8')
        print city1
        state1 = request.form['dst_state'].encode('utf-8')
        print state1
        zip1 = request.form['dst_zip'].encode('utf-8')
        print zip1
        latitude = request.form['dst_lat'].encode('utf-8')
        longitude = request.form['dst_long'].encode('utf-8')

        loc = User(add1,city1,state1,zip1,latitude,longitude)
        db.session.add(loc)
        db.session.commit()

        final_dict['Destination']={'address':add1,
        'state':state1,
        'zip': zip1,
        'city':city1,
        'latitude':latitude,
        'longitude':longitude}
        
        print "my count ",count
        num_mid_points = count /7
        print "my middedddddddddddddddddddddddd valueee)))))))))))))))))",num_mid_points
        counter1 =0

        for key, value in reques_data.iteritems():
            s3 = re.search(r'mid',key)

            if s3:
                
                print "i am in s3"
                for mid_value in range(1,num_mid_points+1):
                    mid_value1=str(mid_value)

                    url_google3 = 'https://maps.googleapis.com/maps/api/geocode/json'
                    add1 = request.form['mid'+mid_value1+'_address'].encode('utf-8')
                    city1 = request.form['mid'+mid_value1+'_city'].encode('utf-8')
                    state1 = request.form['mid'+mid_value1+'_state'].encode('utf-8')
                    zip1 = request.form['mid'+mid_value1+'_zip'].encode('utf-8')
                    latitude = request.form['mid'+mid_value1+'_lat'].encode('utf-8')
                    longitude = request.form['mid'+mid_value1+'_long'].encode('utf-8')

                    
                    

                    final_dict['midpoint'+mid_value1]={'address':add1,
                    'state':state1,
                    'zip': zip1,
                    'city':city1,
                    'latitude':latitude,
                    'longitude':longitude}

                    

                    print "counter1 value",counter1

                    if counter1 < num_mid_points:
                        loc = User(add1,city1,state1,zip1,latitude,longitude)
                        db.session.add(loc)
                        db.session.commit()
                        counter1+=1
                        waypoint_final.append({final_dict['midpoint'+mid_value1]['city']:[final_dict['midpoint'+mid_value1]['latitude'],final_dict['midpoint'+mid_value1]['longitude']]})


        print final_dict        
                    

        #**********************************GOOGLE WAY POINTS ROUTE*********************************************************

        waypoints_list={}
        string_list= []
        print "way point final "
        print waypoint_final

        for iter in waypoint_final:
            for value in iter:
                string_list.append(iter[value][0])
                string_list.append(iter[value][1])  
        
#string preparation to send the way points data to google way points

        lenght_list = len(string_list)+len(string_list)
        for sameer in range(0,lenght_list+1):
            if sameer%2 !=0:
                string_list.insert(sameer,',')
        counter =3

        for key in string_list:
            if counter>= len(string_list):
                break
            string_list[counter] = '|'
            counter = counter +4

        print string_list

        final_way_string = "".join(str(e) for e in string_list)

        print final_way_string
        
        
        city ='origin='+str(final_dict['source']['latitude'])+','+str(final_dict['source']['longitude'])+'&destination='+str(final_dict['Destination']['latitude'])+','+str(final_dict['Destination']['longitude'])+'&waypoints=optimize:true|'+str(final_way_string)
        url_waypoints = 'https://maps.googleapis.com/maps/api/directions/json?'+city+'&key=AIzaSyC9d1IRb_XlaMi0G8UuacIearDejw5XBVc'
        waypoints_response = requests.get(url_waypoints)
        print "+++++++++++++++++++++++++++ way points route ++++++++++++++++++++++++++++++++++"
        print waypoints_response

        waypoints_response1= waypoints_response.json()['routes'][0]['waypoint_order']
        # waypoints_response1= waypoints_response.json()['routes'][0]
        sorted_waypoint = []
        print "way point response1",waypoints_response1
        
        for b in waypoints_response1:
            print b
            sorted_waypoint.append(waypoint_final[b])
        
        print sorted_waypoint 

        sorted_ways_uber=[]

        for way in sorted_waypoint:
            for latlong in way:
                sorted_ways_uber.append(way[latlong])
        print sorted_ways_uber

        sorted_ways_uber.insert(0,[final_dict['source']['latitude'],final_dict['source']['longitude']])
        sorted_ways_uber.append([final_dict['Destination']['latitude'],final_dict['Destination']['longitude']])

        
        print sorted_ways_uber





        #***********************************UBER COST CALCULATION **********************************************************************************
        print "uber cost calculation"
        uber_dict={}

        
        uber_dis_pool_distance = [] 
        uber_dis_pool_lowestimate = []
        uber_dis_xcartype_distance = []
        uber_xl_cartype_lowestimate = []
        uber_dis_xcartype_lowestimate = []
        # total_sum_distance = 0

        lyft_plus_cost = []
        lyft_line_cost = []
        lyft_normal_cost = []
        
        var= 0
        for another_value in range(1,len(sorted_ways_uber)):



            start_latitude = sorted_ways_uber[var][0]
            start_longitude = sorted_ways_uber[var][1]
            end_latitude  =  sorted_ways_uber[another_value][0]
            end_longitude = sorted_ways_uber[another_value][1]

            print "start latitude:%d",(start_latitude)
            print "start longitude:%d",(start_longitude)
            print "end latitude:%d",(end_latitude)
            print "end longitude:%d",(end_longitude)


            var = var + 1
            url_uber = 'https://api.uber.com/v1.2/estimates/price'
            parameters = {       
            'server_token': 'rzRLNgxRVSMbvJ5JrFX3ZiKbBcXO7vUZrNF99aB8',
            'start_latitude':start_latitude ,
            'start_longitude':start_longitude,
            'end_latitude': end_latitude,
            'end_longitude': end_longitude,
            }

            uber_res = requests.get(url_uber, params=parameters)
            uber_final_res = json.loads(uber_res.text)
            print uber_final_res

            if 'prices' in uber_final_res:

                uber_dis_pool_distance.append(uber_final_res['prices'][0]['distance'])
                uber_dis_pool_lowestimate.append(uber_final_res['prices'][0]['low_estimate'])
                print uber_dis_pool_distance
                print uber_dis_pool_lowestimate
                final_uberpool_distance = sum(uber_dis_pool_distance)

                uber_dis_xcartype_distance.append(uber_final_res['prices'][1]['distance'])
                uber_dis_xcartype_lowestimate.append(uber_final_res['prices'][1]['low_estimate'])

                print uber_dis_xcartype_distance

                print uber_dis_xcartype_lowestimate


                uber_xl_cartype_lowestimate.append(uber_final_res['prices'][2]['low_estimate'])           


                print uber_final_res['prices'][0]['distance']
            else:

                print "please enter distance below 100 miles"
    # ---------------------------------------------LYFT API---------------------------------------
            
            url = 'https://api.lyft.com/oauth/token'
            payload = {"Content-Type": "application/json","grant_type": "client_credentials", "scope": "public"}
            res = requests.post(url, data=payload,auth=("a_np8_VCFC2u","_zuYfIJUN3SkQEQy-gNYUYCkTxhNuS8g"))
            json_output = json.loads(res.text)
            token1 = json_output['access_token']
            print  token1
            headers = {"Authorization": "bearer " + token1}
            #response = requests.get("https://oauth.reddit.com/api/v1/me", headers=headers)
            parameters={"start_lat": start_latitude, "start_lng": start_longitude, "end_lat": end_latitude, "end_lng": end_longitude}
            # Make a get request with the parameters.
            lyft_data = requests.get("https://api.lyft.com/v1/cost", params=parameters, headers=headers).json()
            print lyft_data

            lyft_line_cost.append(lyft_data['cost_estimates'][1]['estimated_cost_cents_max'])
            lyft_plus_cost.append(lyft_data['cost_estimates'][0]['estimated_cost_cents_max'])
            lyft_normal_cost.append(lyft_data['cost_estimates'][2]['estimated_cost_cents_max'])

        final_uberpool_cost = sum(uber_dis_pool_lowestimate)
        final_uberx_cost = sum(uber_dis_xcartype_lowestimate)
        final_uberxl_cost =sum(uber_xl_cartype_lowestimate)


        final_lyftplus_cost = (sum(lyft_plus_cost)) / 100
        final_lyftnormal_cost = (sum(lyft_normal_cost)) / 100
        final_lyft_line_cost = (sum(lyft_line_cost)) / 100


    # **********************fianl Prices***************************

        print final_uberpool_cost
        print final_uberx_cost
        print final_uberxl_cost


        print final_lyftplus_cost
        print final_lyftnormal_cost 
        print final_lyft_line_cost

        db_count =0

        for db_list in range(1,len(sorted_ways_uber)):
            source_db =sorted_ways_uber[db_count][0]+','+sorted_ways_uber[db_count][1]
            destination_db =sorted_ways_uber[db_list][0]+','+sorted_ways_uber[db_list][1]
            uber_pool = uber_dis_pool_lowestimate[db_count]
            uber_x = uber_dis_xcartype_lowestimate[db_count]
            uber_xl = uber_xl_cartype_lowestimate[db_count]
            lyft_pool = lyft_line_cost[db_count]
            lyft_x = lyft_normal_cost[db_count]
            lyft_xl =lyft_plus_cost[db_count]
            

            pric =Price(source_db,destination_db,uber_pool,uber_x,uber_xl,lyft_pool,lyft_x,lyft_xl)
            db.session.add(pric)
            db.session.commit()
            db_count+=1

        response2=jsonify(uber_dict)


        sample_dict = {'uber_x':final_uberx_cost,'uber_pool':final_uberpool_cost,'lyft_x':final_lyftnormal_cost,'lyft_pool':final_lyft_line_cost,'uber_suv':final_uberxl_cost,'lyft_suv':final_lyftplus_cost}


        return render_template("Menu.html",result = sample_dict)
    except Exception,e:
        print e
        return render_template("Error.html",result=e)



if __name__ == "__main__":
	
	app.run(host="0.0.0.0",port =9000, debug=True,use_reloader=False,threaded=True)