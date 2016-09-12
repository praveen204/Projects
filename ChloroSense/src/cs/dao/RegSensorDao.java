package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cs.beans.RegisteredSensor;
import cs.beans.Sensor;

public class RegSensorDao {

	
public ArrayList<RegisteredSensor> selectAllSensors(int userId) {
	System.out.println("Selecting all sensors of a given user");
	ArrayList<RegisteredSensor> sensors = new ArrayList<RegisteredSensor>();
	try {
		RegisteredSensor s = null;
		Connection con = ConnectionDao.connect();
		PreparedStatement pstmt = con
				.prepareStatement("select rs.userid,s.sensorname,s.sensorid,st.sensortype,sh.hubname,sh.LOCATION,rs.status from sensors s,sensorhubs sh,registered_sensors rs,sensortypes st where s.sensorhubid=sh.sensorhubid and rs.SENSORID=s.SENSORID and rs.userid=? and st.sensortypeid=s.sensortypeid");
		pstmt.setInt(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			System.out.println("exists");
			s = new RegisteredSensor();
		s.setUserId(rs.getInt(1));
		s.setSensorName(rs.getString(2));
		s.setSensorId(rs.getInt(3));	
		s.setSensorType(rs.getString(4));
		s.setHubName(rs.getString(5));
		s.setLocation(rs.getString(6));
		s.setStatus(rs.getString(7));
		sensors.add(s);

		}
		ConnectionDao.destroy(con);
		System.out.println(sensors);
		return sensors;
	} catch (Exception e) {
		return null;
	}

}

public int addRegSensor(int userId,int sensorTypeId,int hubId) {
	try {
		Integer sid=null;
	
		Connection con = ConnectionDao.connect();	
		int i=searchRegSensor(userId,sensorTypeId,hubId);
		if(i==0){
		PreparedStatement pstmts = con.prepareStatement("select sensorid from sensors where sensorhubid=? and sensortypeid=?");
		pstmts.setInt(1,hubId);
		pstmts.setInt(2,sensorTypeId);
		ResultSet rs =pstmts.executeQuery();
	
		if(rs.next())
		sid=rs.getInt(1);
		PreparedStatement pstmt = con.prepareStatement("insert into registered_sensors values(?,?,'yes')");
		pstmt.setInt(1,userId);
		pstmt.setInt(2,sid);
		pstmt.executeUpdate();
		ConnectionDao.destroy(con);
		return 1;
		}
		else if(i==1)
		return -1;
		return 0;
	} catch (Exception e) {
		return 0;
	}
}

public int updateStatus(int sensorId,int userId)
{
	try{
	Connection con = ConnectionDao.connect();	
	PreparedStatement pstmt = con.prepareStatement("update registered_sensors set status=Decode(status,'yes','No','No','yes',status) where sensorid=? and userid=?");
	pstmt.setInt(1,sensorId);
	pstmt.setInt(2,userId);
	int i=pstmt.executeUpdate();
	ConnectionDao.destroy(con);
	return i;
	}catch(Exception e){
		return 0;
	}



}
	public int searchRegSensor(int userId,int sensorTypeId,int hubId)
	{
		try {
			Integer sid=null;
		
			Connection con = ConnectionDao.connect();	
			PreparedStatement pstmts = con.prepareStatement("select *  from registered_sensors where  userid=?  and sensorid in(select sensorid from sensors where SENSORHUBID=? and SENSORTYPEID=?)");
			pstmts.setInt(1,userId);
			pstmts.setInt(2,hubId);
			pstmts.setInt(3,sensorTypeId);
			
			ResultSet rs =pstmts.executeQuery();
		
			if(rs.next())
				return 1;
			return 0;
		}catch(Exception e)
		{
			return 0;
		}
	}
}
