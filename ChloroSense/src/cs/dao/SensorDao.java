package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs.beans.Sensor;
import cs.beans.SensorHub;

public class SensorDao {

	public int addSensor(Sensor s) {
		try {
		
			Connection con = ConnectionDao.connect();	
			PreparedStatement pstmt = con.prepareStatement("insert into sensors values(sensor_seq.nextval,?,?,?,?,?)");
			pstmt.setString(1,s.getManufacturer());
			pstmt.setString(2,s.getDescription()	);
			pstmt.setString(3,s.getSensorName());
			pstmt.setInt(4,s.getHubId());
			pstmt.setInt(5,s.getSensorTypeId());
			pstmt.executeUpdate();
			ConnectionDao.destroy(con);
			return 1;
		} catch (SQLException e) {
			return 0;
		}
	}
	
	public int deleteSensor(int sensorHubId,int sensorTypeId,int userId) {
		try {Integer sid=null;
			Connection con = ConnectionDao.connect();	
			PreparedStatement pstmts = con.prepareStatement("select sensorid from sensors where sensorhubid=? and sensortypeid=?");
			System.out.println(sensorTypeId+" "+sensorHubId);
			pstmts.setInt(1,sensorHubId);
			pstmts.setInt(2,sensorTypeId);
			ResultSet rs =pstmts.executeQuery();
		
			if(rs.next())
			sid=rs.getInt(1);
			PreparedStatement pstmt = con.prepareStatement("delete from sensors where sensorhubid=? and sensortypeid=?");
			pstmt.setInt(1,sensorHubId);
			pstmt.setInt(2,sensorTypeId);
			int i = pstmt.executeUpdate();
			PreparedStatement pstmt2 = con.prepareStatement("delete from registered_sensors where sensorid=? and userid=?");
			pstmt.setInt(1,sid);
			pstmt.setInt(2,userId);
			ConnectionDao.destroy(con);
			return i;
		} catch (Exception e) {
			return 0;
		}
	}	
	
	
	
	public ArrayList<Sensor> selectAllSensors() {
		System.out.println("Selecting all sensors");
		ArrayList<Sensor> sensors = new ArrayList<Sensor>();
		try {
			Sensor s = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from sensors");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				s = new Sensor();
			s.setSensorId(rs.getInt(1));
			s.setManufacturer(rs.getString(2));
			s.setDescription(rs.getString(3));
			s.setSensorName(rs.getString(4));
			s.setHubId(rs.getInt(5));
			s.setSensorTypeId(rs.getInt(6));
				sensors.add(s);

			}
			ConnectionDao.destroy(con);
			System.out.println(sensors);
			return sensors;
		} catch (Exception e) {
			return null;
		}

	}
		
	public ArrayList<Sensor> selectAllSensors(int hubId) {
		System.out.println("Selecting all sensors");
		ArrayList<Sensor> sensors = new ArrayList<Sensor>();
		try {
			Sensor s = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from sensors where sensorhubid=?");
			pstmt.setInt(1, hubId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				s = new Sensor();
			s.setSensorId(rs.getInt(1));
			s.setManufacturer(rs.getString(2));
			s.setDescription(rs.getString(3));
			s.setSensorName(rs.getString(4));
			s.setHubId(rs.getInt(5));
			s.setSensorTypeId(rs.getInt(6));
				sensors.add(s);

			}
			ConnectionDao.destroy(con);
			System.out.println(sensors);
			return sensors;
		} catch (Exception e) {
			return null;
		}

	}

}
