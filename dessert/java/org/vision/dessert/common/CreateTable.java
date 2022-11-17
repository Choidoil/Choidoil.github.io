package org.vision.dessert.common;

import org.vision.dessert.model.dessert;

import com.sung.jdbc.dbtools.DBTableGenerator;


public class CreateTable {

	public static void main(String[] args) {
		DBTableGenerator.dbGenerate("oracle",new Class[]{ dessert.class}, true);

	}

}
