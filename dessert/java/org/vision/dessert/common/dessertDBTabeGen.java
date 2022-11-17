package org.vision.dessert.common;

import org.vision.dessert.model.dessertReserve;

import com.sung.jdbc.dbtools.DBTableGenerator;


public class dessertDBTabeGen {

	public static void main(String[] args) {
		//DBTableGenerator.generateDBTable(dessert.class, "oracle");
		//System.out.println("테이블생성완료");
		DBTableGenerator.dbGenerate("oracle", new Class[]{dessertReserve.class}, true); 
	}

}
