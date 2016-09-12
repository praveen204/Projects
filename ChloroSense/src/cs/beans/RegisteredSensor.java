package cs.beans;

public class RegisteredSensor {
private String sensorName;
private String sensorType;
private String location;
private String status;
private int userId;
private int sensorId;
private String hubName;
public String getHubName() {
	return hubName;
}
public void setHubName(String hubName) {
	this.hubName = hubName;
}
public String getSensorName() {
	return sensorName;
}
public void setSensorName(String sensorName) {
	this.sensorName = sensorName;
}
public String getSensorType() {
	return sensorType;
}
public void setSensorType(String sensorType) {
	this.sensorType = sensorType;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public int getSensorId() {
	return sensorId;
}
public void setSensorId(int sensorId) {
	this.sensorId = sensorId;
}


}
