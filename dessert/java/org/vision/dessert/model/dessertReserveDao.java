package org.vision.dessert.model;

import java.sql.SQLException;
import java.util.List;
//return boolean인경우 수정해야 함 : 메퍼에선 boolean을 리턴시킬 수 없다.
public interface dessertReserveDao {
	public int insert(dessertReserve vo) throws SQLException;
	public int getCurrval() throws SQLException ;
	public List<dessertReserve> selectAll() throws SQLException;
	public List<dessertReserve> queryForList(String memid) throws SQLException;
	public List<R_VIEW> getReserveViewData(String memid) throws SQLException;
	public List<R_VIEW> getAllReserveViewData() throws SQLException;
	// 예약취소 
	public int reserveCancel(int regno) throws SQLException;
	public dessertReserve queryForObject(int regno) throws SQLException;
	public int update(dessertReserve bean) throws SQLException;
}
