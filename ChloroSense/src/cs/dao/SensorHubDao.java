package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs.beans.SensorHub;
import cs.beans.State;

public class SensorHubDao {

	public ArrayList<SensorHub> selectAllHubs() {
		System.out.println("Selecting all hubs");
		ArrayList<SensorHub> hubs = new ArrayList<SensorHub>();
		try {
			SensorHub sh = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from sensorhubs");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				sh = new SensorHub();
			sh.setHubId(rs.getInt(1));
				sh.setHubName(rs.getString(2));
				sh.setHubDesc(rs.getString(3));
				sh.setLocation(rs.getString(4));
				hubs.add(sh);

			}
			ConnectionDao.destroy(con);
			System.out.println(hubs);
			return hubs;
		} catch (Exception e) {
			return null;
		}

	}

	public int addSensorHub(SensorHub sh) {
		try {
		
			Connection con = ConnectionDao.connect();	
			PreparedStatement pstmt = con.prepareStatement("insert into sensorhubs values(sensorhub_seq.nextval,?,?,?)");
			pstmt.setString(1,sh.getHubName());
			pstmt.setString(2,sh.getHubDesc()	);
			pstmt.setString(3,sh.getLocation());
			
			pstmt.executeUpdate();
			ConnectionDao.destroy(con);
			return 1;
		} catch (SQLException e) {
			return 0;
		}
	}
	
	public int deleteSensorHub(int sensorHubId) {
		try {
			Connection con = ConnectionDao.connect();	
			
			
			PreparedStatement pstmt = con.prepareStatement("delete from sensorhubs where sensorhubid=?");
			pstmt.setInt(1,sensorHubId);
			int i = pstmt.executeUpdate();
			System.out.println(i);
			PreparedStatement pstmt2 = con.prepareStatement("delete registered_sensors where sensorid in(select sensorid from sensors where sensorhubid=?)");
			pstmt2.setInt(1,sensorHubId);
			int i2 = pstmt2.executeUpdate();
			System.out.println(i2);
			PreparedStatement pstmt3 = con.prepareStatement("delete sensors where sensorhubid=?");
			pstmt3.setInt(1,sensorHubId);
	
			int i3 = pstmt3.executeUpdate();
			System.out.println(i3);
			ConnectionDao.destroy(con);
			return i;
		} catch (SQLException e) {
			return 0;
		}
	}	
	
	
}
