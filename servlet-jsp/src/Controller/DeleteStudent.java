package Controller;

import utils.Constants;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/deleteStudent")
public class DeleteStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String sid = request.getParameter("sid");
        boolean b = deleteStudent(sid);
        if (!b) {
            response.getWriter().write(Constants.FAILURE);
        }
        response.getWriter().write(Constants.SUCCESS);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean deleteStudent(String sid) {
        boolean res = false;
        try {
            String sql = "delete from Student  where sid=?";
            int i = JDBCUtils.executeUpdateQuery(sql, sid);
            res = i > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return res;
        }
    }
}
