package cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cs.beans.State;

public class StateDao {

	public ArrayList<State> selectAllStates() {
		System.out.println("Selecting all states");
		ArrayList<State> states = new ArrayList<State>();
		try {
			State state = null;
			Connection con = ConnectionDao.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from states");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("exists");
				state = new State();
				state.setStateId(rs.getInt(1));
				state.setStateName(rs.getString(2));
				states.add(state);

			}
			ConnectionDao.destroy(con);
			System.out.println(states);
			return states;
		} catch (Exception e) {
			return null;
		}

	}


}
