package org.zerock.controller.p04controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

@Component
public class CustomerDao {
	
	public String getNameById(Connection con, Integer id) {
		String sql = "SELECT CustomerName FROM Customers WHERE CustomerID = ?";
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, id);
			
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return rs.getString(1);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
