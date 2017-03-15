
# import geocoder


# def getCoordinates(address,state,zip):
#     addr = address+','+state+','+zip
#     print addr
#     g = geocoder.google(addr)
#     return g.latlng


# print getCoordinates('kphb','hyderabad','533223')[1]

# AIzaSyCye_va9sO9jLx8-DrR5DK3IjyCNIxVLmk

import requests
url = 'https://maps.googleapis.com/maps/api/geocode/json'
params = {'sensor': 'false', 'address': 'Mountain View, CA','city':'san jose','state':'ca'}
r = requests.get(url, params=params)
results = r.json()['results']
location = results[0]['geometry']['location']
print location['lat']
print location['lng']