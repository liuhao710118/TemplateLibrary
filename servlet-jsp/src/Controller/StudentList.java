package Controller;

import com.google.gson.Gson;
import entity.Student;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/studentList")
public class StudentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> allStudents = getAllStudents();
        String json = new Gson().toJson(allStudents);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(json);
    }

    private List<Student> getAllStudents() {
        List<Student> u = null;
        try {
            u = new ArrayList<>();
            String sql = "select * from Student";
            ResultSet resultSet = JDBCUtils.executeQuery(sql);
            int count = 0;
            while (resultSet.next()) {
                Student t = new Student();
                t.setSid(resultSet.getInt(1));
                t.setSname(resultSet.getString(2));
                t.setSsex(resultSet.getString(3));
                t.setSaddress(resultSet.getString(4));
                t.setStel(resultSet.getString(5));
                u.add(t);
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return u;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
