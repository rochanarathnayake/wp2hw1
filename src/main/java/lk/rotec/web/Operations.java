package lk.rotec.web;

import lk.rotec.web.db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "operations", urlPatterns = "/operations")
public class Operations extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int act = Integer.parseInt(req.getParameter("btn"));

        if (act == 1) {
//            add employee
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            int tp = Integer.parseInt(req.getParameter("tp"));

            String query = "insert into employee(`id`,`name`,`tp`) values(" +
                    "'" + id + "','" + name + "','" + tp + "');";
            DBConnection.iud(query);
            resp.sendRedirect("index.jsp");

        } else if (act == 2) {
//            search employee
            int id = Integer.parseInt(req.getParameter("id"));
            resp.sendRedirect("index.jsp?eid="+id);

        } else if (act == 3) {
//            update employee
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            int tp = Integer.parseInt(req.getParameter("tp"));

            String query = "update employee set name='"+name+"',tp='"+tp+"' where id='"+id+"' ;";
            DBConnection.iud(query);
            resp.sendRedirect("index.jsp");

        } else if (act == 4) {
//            delete employee
            int id = Integer.parseInt(req.getParameter("id"));
            String query = "delete from employee where id='"+id+"';";
            DBConnection.iud(query);
            resp.sendRedirect("index.jsp");
        }

    }
}

