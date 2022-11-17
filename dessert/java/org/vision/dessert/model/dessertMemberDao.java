package org.vision.dessert.model;

import java.sql.SQLException;
import java.util.List;

public interface dessertMemberDao {
	public int insert(dessertMember dto) throws SQLException;
	public int delete(String key) throws SQLException;
	public int update(dessertMember dto) throws SQLException;
	public dessertMember select(String key) throws SQLException;
	public List<dessertMember> selectAll() throws SQLException;
	public String getPassword(final String id) throws SQLException;
	public int getAllCount() throws SQLException;
	//public List<dessertMember> selectPart(int start,int end) throws SQLException;
	public int batch(List<dessertMember> list) throws SQLException;
}
