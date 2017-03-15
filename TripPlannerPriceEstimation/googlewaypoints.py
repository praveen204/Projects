import requests
# from flask import Flask



# app = Flask(__name__)
# # @app.route('/')

# # place ='new+york&destination=san+jose'
# city ='origin=37.3382,-121.8863&destination=37.3357192,-121.8867076&waypoints=optimize:true|37.6213129,-122.3789554|37.432335,-121.899574' 
# url_waypoints = 'https://maps.googleapis.com/maps/api/directions/json?'+city+'&key=AIzaSyC9d1IRb_XlaMi0G8UuacIearDejw5XBVc'
# waypoints_response = requests.get(url_waypoints)
# print waypoints_response.json()['routes'][0]['waypoint_order']


# # def way_point():

# #     url = 'https://maps.googleapis.com/maps/api/directions/json'
# #     params = {
# #                 'orogin': 'false', 
# #                 'destination': address,
# #                 'waypoints':optimize=true|,
# #                 'state':state
# #                 }
# #     r = requests.get(url, params=params)


url_google3 = 'https://maps.googleapis.com/maps/api/geocode/json'
params = {
                    'sensor': 'false', 
                    
                    'city':'san jose',
                    'state':'ca'
                    
                    }
r = requests.get(url_google3, params=params)
print r.data
# results = r.json()['results']
# location = results[0]['geometry']['location']
# latitude = location['lat']
# longitude = location['lng']


# print [0].geometry.location.lat()



        