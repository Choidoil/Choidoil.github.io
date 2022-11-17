package org.vision.dessert.model;

import java.sql.SQLException;
import java.util.List;
public interface dessertBoardDao {
	public int insert(dessertBoard bean) throws SQLException;
	public List<dessertBoard> selectAll() throws SQLException;
	public List<dessertBoard> selectAll2() throws SQLException;
	public dessertBoard select(int num) throws SQLException;
	public int upHit(int num) throws SQLException;
	public int insert2(dessertBoard bean) throws SQLException;
	public int update(dessertBoard bean) throws SQLException;
	public int delete(int key) throws SQLException;
	public int getAllCount() throws SQLException;
}
