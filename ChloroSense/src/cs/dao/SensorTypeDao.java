package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cs.beans.SensorType;
import cs.beans.State;

public class SensorTypeDao {

	public ArrayList<SensorType> viewAllSensorTypes() {
		System.out.println("Selecting all sensor Types");
		ArrayList<SensorType> types = new ArrayList<SensorType>();
		try {
			SensorType st = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from sensortypes");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				st = new SensorType();
				st.setSensorTypeId(rs.getInt(1));
				st.setSensorType(rs.getString(2));
				types.add(st);

			}
			ConnectionDao.destroy(con);
			System.out.println(types);
			return types;
		} catch (Exception e) {
			return null;
		}

	}

}
