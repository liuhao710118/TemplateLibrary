package Controller;

import entity.User;
import utils.Constants;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/loginService")
public class LoginService extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        User user = getUserByAuth(account, password);
        if (user == null) {
            response.getWriter().write(Constants.FAILURE);
        }
        request.getSession().setAttribute("currentLoginUser", user);
        response.getWriter().write(Constants.SUCCESS);
    }

    private User getUserByAuth(String name, String pwd) {
        User u = null;
        try {
            String sql = "select * from Login where username=? and userpassword=?";
            ResultSet resultSet = JDBCUtils.executeQuery(sql, name, pwd);
            int count = 0;
            while (resultSet.next()) {
                User t = new User();
                t.setUserId(resultSet.getInt(1));
                t.setUserName(resultSet.getString(2));
                t.setUserPassword(resultSet.getString(3));
                u = t;
                count++;
            }
            if (count != 1) {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return u;
        }
    }
}
