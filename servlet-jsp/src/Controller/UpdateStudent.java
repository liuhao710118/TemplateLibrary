package Controller;

import utils.Constants;
import utils.JDBCUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/updateStudent")
public class UpdateStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean updateStudent(String sname, String ssex, String saddress, String stel, String sid) {
        boolean res = false;
        try {
            String sql = "update Student set sname=?,ssex=?,saddress=?,stel=? where sid=?";
            int i = JDBCUtils.executeUpdateQuery(sql, sname, ssex, saddress, stel, sid);
            res = i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return res;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sname = request.getParameter("sname");
        String saddress = request.getParameter("saddress");
        String ssex = request.getParameter("ssex");
        String stel = request.getParameter("stel");
        String sid = request.getParameter("sid");
        boolean b = updateStudent(sname, ssex, saddress, stel, sid);
        if (!b) {
            response.getWriter().write(Constants.FAILURE);
        }
        response.getWriter().write(Constants.SUCCESS);
    }
}
