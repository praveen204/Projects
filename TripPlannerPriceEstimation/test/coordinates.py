import geocoder


def getCoordinates(address,state,zip):
    addr = address +','+state+','+zip
    g = geocoder.google(addr)
    return g.latlng

