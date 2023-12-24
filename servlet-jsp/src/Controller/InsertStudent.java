package Controller;

import utils.Constants;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/InsertStudent")
public class InsertStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sname = request.getParameter("sname");
        String saddress = request.getParameter("saddress");
        String ssex = request.getParameter("ssex");
        String stel = request.getParameter("stel");
        boolean b = insertStudent(sname, saddress, ssex, stel);
        if (!b) {
            response.getWriter().write(Constants.FAILURE);
        }
        response.getWriter().write(Constants.SUCCESS);
    }

    private boolean insertStudent(String sname, String saddress, String ssex, String stel) {
        boolean res = false;
        try {
            String sql = "insert into Student (sid,sname,ssex,saddress,stel) values (default,?,?,?,?)";
            int i = JDBCUtils.executeUpdateQuery(sql, sname, ssex, saddress, stel);
            res = i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return res;
        }
    }
}
