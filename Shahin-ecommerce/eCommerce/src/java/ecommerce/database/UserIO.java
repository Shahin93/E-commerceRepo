package ecommerce.database;

import ecommerce.business.User;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class UserIO{
    private PreparedStatement preparedStatement;
    private Statement stmnt;
    private Connection con;
    private DataSource dataSource;
    private ResultSet resultSet;
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
        String username = "elmar";
        String password = "aliyev";
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    
    private int getRowCount() throws Exception{
        String query = "SELECT UserID FROM users";
        ResultSet resultSet;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        resultSet.last();
        int i =resultSet.getRow();
        con.close();
        return i;
    }

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    private int getMaxUserID() throws Exception{
        String query = "SELECT MAX(UserID) FROM users";
        ResultSet resultSet;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        resultSet.next();
        int i = resultSet.getInt("Max(UserID)");
        con.close();
        return i; 
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public void addUser(User user) throws Exception{
        String query = "INSERT INTO users VALUES" + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        con = getConnection();
        preparedStatement = con.prepareStatement(query);
        preparedStatement.setInt(1, (getMaxUserID()+1));
        preparedStatement.setString(2, user.getFirstName());
        preparedStatement.setString(3, user.getLastName());
        preparedStatement.setString(4, user.getEmail());
        preparedStatement.setString(5, user.getPassword());
        preparedStatement.setString(6, user.getBirthDate());
        preparedStatement.setString(7,  user.getPhone());
        preparedStatement.setString(8,  user.getAddress());
        preparedStatement.setString(9,  user.getAddress2());
        preparedStatement.setString(10, user.getCity());
        preparedStatement.setString(11, user.getZip());
        preparedStatement.setString(12, user.getCountry());
        preparedStatement.setString(13, user.getGender());
        preparedStatement.setInt(14, user.getEmailVerified());
        preparedStatement.setString(15, user.getRegistrationDate());
        preparedStatement.setString(16, user.getVerificationCode());
        preparedStatement.executeUpdate();
        preparedStatement.close();
        con.close();
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public String getUserStringData(String columnName, String search_columnName, String search_data) throws Exception{
        
        String query = "SELECT " + columnName + " FROM users WHERE " + search_columnName + "='" + search_data + "'";
        String resultItem = null;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        if (resultSet.next()){
            resultItem = (String) resultSet.getObject(columnName);
        }
        con.close();
        return resultItem;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public int getUserIntData(String columnName, String search_columnName, String search_data) throws Exception{
        
        String query = "SELECT " + columnName + " FROM users WHERE " + search_columnName + "='" + search_data + "'";
        int resultItem;
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        resultSet.next();
        resultItem = (Integer) resultSet.getObject(columnName);
        
        con.close();
        return resultItem;
    }
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
    public User getUser(String userEmail) throws Exception{
        String query = "SELECT * FROM users WHERE UserEmail='" + 
                        userEmail + "'";
        User user = new User();
        con = getConnection();
        stmnt = con.createStatement();
        resultSet = stmnt.executeQuery(query);
        resultSet.next();
        user.setUserID((Integer) resultSet.getObject("UserID"));
        user.setFirstName((String) resultSet.getObject("UserFirstName"));
        user.setLastName((String) resultSet.getObject("UserLastName"));
        user.setEmail((String) resultSet.getObject("UserEmail"));
        user.setPassword((String) resultSet.getObject("UserPassword"));
        user.setBirthDate((String) resultSet.getObject("UserBirthDate"));
        user.setPhone((String) resultSet.getObject("UserPhone"));
        user.setAddress((String) resultSet.getObject("UserAddress"));
        user.setAddress2((String) resultSet.getObject("UserAddress2"));
        user.setCity((String) resultSet.getObject("UserCity"));
        user.setZip((String) resultSet.getObject("UserZip"));
        user.setCountry((String) resultSet.getObject("UserCountry"));
        user.setGender((String) resultSet.getObject("UserGender"));
        user.setEmailVerified((Integer) resultSet.getObject("UserEmailVerified"));
        user.setRegistrationDate((String) resultSet.getObject("UserRegistrationDate"));
        user.setVerificationCode((String) resultSet.getObject("UserVerificationCode"));
        resultSet.close();
        con.close();
        return user;
    }
    ///////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////
    public void updateUserData(String columnName, String search_columnName, String search_data, String dataString, Integer dataInteger) throws Exception{
        
        String query = "UPDATE users SET " + columnName + "=? WHERE " + search_columnName + "='" + search_data + "'";
        con = getConnection();
        preparedStatement = con.prepareStatement(query);
        if (dataString != null){
            preparedStatement.setString(1, dataString);
        }
        else if (dataInteger != null){
            preparedStatement.setInt(1, dataInteger);
        }
        preparedStatement.executeUpdate();
        preparedStatement.close();
        con.close();
    }
}