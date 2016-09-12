package cs.beans;

public class Sensor {
private int sensorId;
private String manufacturer;
private String description;
private String sensorName;
private int hubId;
private int sensorTypeId;
public int getSensorId() {
	return sensorId;
}
public void setSensorId(int sensorId) {
	this.sensorId = sensorId;
}
public String getManufacturer() {
	return manufacturer;
}
public void setManufacturer(String manufacturer) {
	this.manufacturer = manufacturer;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getSensorName() {
	return sensorName;
}
public void setSensorName(String sensorName) {
	this.sensorName = sensorName;
}
public int getHubId() {
	return hubId;
}
public void setHubId(int hubId) {
	this.hubId = hubId;
}
public int getSensorTypeId() {
	return sensorTypeId;
}
public void setSensorTypeId(int sensorTypeId) {
	this.sensorTypeId = sensorTypeId;
}

	
}
