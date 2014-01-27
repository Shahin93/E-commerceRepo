package ecommerce.database;

import ecommerce.business.User;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductIO {
    private PreparedStatement preparedStatement;
    private Statement stmnt;
    private DataSource dataSource;
    private Connection con;
    ///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    private Connection getConnection() throws Exception{
        Context context = new InitialContext();
	dataSource = (DataSource)context.lookup("java:comp/env/jdbc/e-commerce");
        Connection connection = dataSource.getConnection();
        return connection;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    private Connection getConnection2() throws Exception{
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/e-commerce";
        String username = "root";
        String password = "5444788";
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    private int getRowCount() throws Exception{
        String query = "SELECT ProductID FROM product";
        ResultSet resultSet;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        resultSet.last();
        con.close();
        return resultSet.getRow();
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public void addProduct(User user) throws Exception{
        String insert = "INSERT INTO product VALUES" + "(?,?,?,?,?,?,?,?,?,?,?)";
        
        con = getConnection();
        preparedStatement = con.prepareStatement(insert);
        
        preparedStatement.executeUpdate();
        preparedStatement.close();
        con.close();
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public String getProductData(String columnName, String search_columnName, String search_data) throws Exception{
        
        String query = "SELECT " + columnName + " FROM users WHERE " + search_columnName + "='" + search_data + "'";
        String resultItem;
        ResultSet resultSet;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        if (resultSet.next()){
            resultItem = (String) resultSet.getObject(columnName);
        }
        else{
            resultItem = "Not Found";
        }
        con.close();
        return resultItem;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
}
