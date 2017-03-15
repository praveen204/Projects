from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand



# Database Configurations
app = Flask(__name__)
DATABASE = 'project_cmpe273'
PASSWORD = 'bhanu'
USER = 'root'
HOSTNAME = 'localhost'

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:bhanu@localhost/project_cmpe273'
db = SQLAlchemy(app)

# Database migration command line
migrate = Migrate(app, db)
manager = Manager(app)
manager.add_command('db', MigrateCommand)

class User(db.Model):

	__tablename__="locations"
	Id = db.Column(db.Integer, primary_key=True)
	address = db.Column(db.String(100), unique=False)
	state = db.Column(db.String(100), unique=False)
	city = db.Column(db.String(100), unique=False)
	zip = db.Column(db.String(100), unique=False)
	latitude= db.Column(db.Integer, unique=False)
	longitude= db.Column(db.Integer, unique=False)

	
	def __init__(self,address, state, city, zip,latitude,longitude):
		# initialize columns
		self.address = address
		self.state = state
		self.city = city
		self.zip = zip
		self.latitude= latitude
		self.longitude = longitude

class Price(db.Model):

	__tablename__="prices"
	Id = db.Column(db.Integer, primary_key=True)
	source = db.Column(db.String(100), unique=False)
	destination = db.Column(db.String(100), unique=False)
	uber_x_price = db.Column(db.Integer, unique=False)
	uber_pool_price = db.Column(db.Integer, unique=False)
	uber_xl_price = db.Column(db.Integer, unique=False)
	lyft_normal_price= db.Column(db.Integer, unique=False)
	lyft_line_price= db.Column(db.Integer, unique=False)
	lyft_plus_price= db.Column(db.Integer, unique=False)
	
	def __init__(self,source, destination, uber_x_price, uber_pool_price,uber_xl_price,lyft_normal_price,lyft_line_price,lyft_plus_price):
		# initialize columns
		self.source = source
		self.destination = destination
		self.uber_x_price = uber_x_price
		self.uber_pool_price = uber_pool_price
		self.uber_xl_price= uber_xl_price
		self.lyft_normal_price = lyft_normal_price
		self.lyft_line_price = lyft_line_price
		self.lyft_plus_price = lyft_plus_price
		



class CreateDB():
	def __init__(self, hostname=None):
		if hostname != None:	
			HOSTNAME = hostname
		import sqlalchemy
		engine = sqlalchemy.create_engine('mysql://root:bhanu@localhost') # connect to server
		engine.execute("CREATE DATABASE IF NOT EXISTS %s "%(DATABASE)) #create db

if __name__ == '__main__':
	
	manager.run()



    

    

    
