// 
// JDX (version: 05.03) reverse engineered class
// JDX is a product of Software Tree, LLC.
// 
// DBURL=jdbc:mysql://localhost:3306/db1, Database=MySQL, Version: 8.0.37
// Date: Tue Jul 02 15:59:31 IST 2024
// 
package com.mycompany.jdxmysqlsakilaexample.reversed.json.model;

import org.json.JSONException;
import org.json.JSONObject;

import com.softwaretree.jdx.JDX_JSONObject;

public class Book extends JDX_JSONObject {
    public  Loan[]  listLoan;

    public Book() {
        super();
    }

    public Book(JSONObject jsonObject) throws JSONException {
        super(jsonObject);
    }
}
