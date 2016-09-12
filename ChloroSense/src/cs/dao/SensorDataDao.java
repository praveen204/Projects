package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import cs.beans.Sensor;

public class SensorDataDao {

	
	public HashMap<String,String> viewCurrWeekReadings(String hubName,String sensorType)
	{
		System.out.println("Inside viewCurrWeekReadings");
		HashMap<String,String>  listByWeek = new HashMap<String,String>();
		try {
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con.prepareStatement("SELECT sensordate,sensorvalue FROM sensordata WHERE sensorid=(SELECT s.sensorid FROM sensors s,sensorhubs sh,sensortypes st WHERE s.SENSORHUBID=sh.SENSORHUBID AND st.sensortypeid=s.SENSORtypeID AND sh.hubname=? AND st.SENSORTYPE  =?)");
			System.out.println("Hub:"+hubName);
			pstmt.setString(1, hubName);
			pstmt.setString(2,sensorType);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				
		listByWeek.put(rs.getString(1),rs.getString(2));

			}
			ConnectionDao.destroy(con);
			System.out.println(listByWeek);
			return listByWeek;
		} catch (Exception e) {
			return null;
		}
		
		
	}

	
	public ArrayList<String> selectAllRegHubs(int userId) {
		System.out.println("Selecting all reg sensor hubs");
		ArrayList<String> hubs = new ArrayList<String>();
		try {
			String s = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select  distinct sh.hubname from sensors s,sensorhubs sh,registered_sensors rs,sensortypes st where s.sensorhubid=sh.sensorhubid and rs.SENSORID=s.SENSORID and rs.userid=? and st.sensortypeid=s.sensortypeid order by 1");
			pstmt.setInt(1,userId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				s = new String();
		s=rs.getString(1);
				hubs.add(s);

			}
			ConnectionDao.destroy(con);
			System.out.println(hubs);
			return hubs;
		} catch (Exception e) {
			return null;
		}

	}
	
}
