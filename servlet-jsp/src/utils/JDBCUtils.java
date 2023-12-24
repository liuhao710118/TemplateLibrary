package utils;

import java.sql.*;

public class JDBCUtils {

    static {
        loadJDBCDriver();
    }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(Constants.DB_URL, Constants.USER, Constants.PASS);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return conn;
        }
    }

    private static void loadJDBCDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static int executeUpdateQuery(String sql, Object... args) {
        int res = 0;
        try {
            Connection connection = getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            int index = 1;
            for (Object arg : args) {
                stmt.setObject(index, arg);
                index++;
            }
            res = stmt.executeUpdate();
        } catch (SQLException e) {
            res = -1;
            e.printStackTrace();
        } finally {
            return res;
        }
    }

    public static ResultSet executeQuery(String sql, Object... args) {
        ResultSet resultset = null;
        try {
            Connection connection = getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            int index = 1;
            for (Object arg : args) {
                stmt.setObject(index, arg);
                index++;
            }
            resultset = stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return resultset;
        }
    }
}
