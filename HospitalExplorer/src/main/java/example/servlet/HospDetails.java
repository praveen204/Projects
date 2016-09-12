package example.servlet;
public class HospDetails {
	/*nkln*/

	private int hospitalId;
	private double avgAmount;
	private String zip;
	private String hospName;
	private String street;
	private String city;
	private String state;
	private String regDesc;
	private String  disease;
	private int  noOfPat;
	public int getHospitalId() {
		return hospitalId;
	}
	public String getHospName() {
		return hospName;
	}
	public void setHospName(String hospName) {
		this.hospName = hospName;
	}
	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}
	public double getAvgAmount() {
		return avgAmount;
	}
	public void setAvgAmount(double avgAmount) {
		this.avgAmount = avgAmount;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRegDesc() {
		return regDesc;
	}
	public void setRegDesc(String regDesc) {
		this.regDesc = regDesc;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getNoOfPat() {
		return noOfPat;
	}
	public void setNoOfPat(int noOfPat) {
		this.noOfPat = noOfPat;
	}
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	
	
}