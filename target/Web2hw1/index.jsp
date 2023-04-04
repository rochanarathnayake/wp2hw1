<%@ page import="java.sql.ResultSet" %>
<%@ page import="lk.rotec.web.db.DBConnection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.omg.CORBA.INTERNAL" %>

<%--
  Created by IntelliJ IDEA.
  User: Rochana Rathnayake - RoTec Systems
  Date: 3/31/2023
  Time: 4:38 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>
<body class="bg-dark text-white" >
<h1 style="text-align: center;font-family: 'Roboto Mono';font-weight: bold;margin-top: 20px">S CRUD Operation</h1>
<h4 style="text-align: center;font-family: 'Roboto Mono';font-weight: bold;margin-bottom: 50px">WP2_HW01</h4>
<form action="operations" method="get" >
    <table style="margin-left: auto;margin-right: auto">
        <%
            int id=0;
            String name = "";
            int tp=0;

                if (request.getParameter("eid") != null) {
                    try {
                        ResultSet rsres = DBConnection.search("select * from employee where id='" + request.getParameter("eid") + "'");
                        rsres.next();
                        id = Integer.parseInt(rsres.getString("id"));
                        name = rsres.getString("name");
                        tp = Integer.parseInt(rsres.getString("tp"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                %>

        <tr>
            <td style="width: 150px; font-family: 'Roboto Mono';font-weight: bold;text-align: right">Employee ID :</td>
            <td><input type="number" class="form form-control mb-2" name="id" value="<%out.print((id == 0)?"":id);%>" required></td>
        </tr>
        <tr>
            <td style="width: 150px; font-family: 'Roboto Mono';font-weight: bold;text-align: right">Name :</td>
            <td><input type="text" class="form form-control mb-2" name="name" value="<%out.print((name == "")?"":name);%>"></td>
        </tr>
        <tr>
            <td style="width: 150px;font-family: 'Roboto Mono';font-weight: bold;text-align: right">Telephone :</td>
            <td><input type="number" class="form form-control" name="tp" value="<%out.print((tp == 0)?"":tp);%>"></td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <button class="btn btn-md btn-outline-success fw-bold mt-5 mb-2" style="width: 100px;" name="btn"
                        value="1"
                >Add
                </button>
            </td>
        </tr>

        <tr class="text-center">
            <td colspan="2">
                <button class="btn btn-md btn-outline-primary fw-bold mb-2" style="width: 100px;" name="btn"
                        value="2">Search
                </button>
            </td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <button class="btn btn-md btn-outline-warning fw-bold mb-2" style="width: 100px;" name="btn" value="3">
                    Update
                </button>
            </td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <button class="btn btn-md btn-outline-danger fw-bold mb-2" style="width: 100px;" name="btn" value="4">
                    Delete
                </button>
            </td>
        </tr>
    </table>

</form>
<table class="table table-light mt-5 w-50 text-center" style="font-family: 'Roboto Mono';margin-left: auto;margin-right: auto">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Telephone</th>
    </tr>
    </thead>

    <tbody>
    <%
        try {
            ResultSet rs = DBConnection.search("select * from employee");
            while (rs.next()) {
    %>
    <tr>
        <td><%out.print(rs.getString("id"));%></td>
        <td><%out.print(rs.getString("name"));%></td>
        <td><%out.print(rs.getString("tp"));%></td>
    </tr>
    <%
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </tbody>


</table>

</body>
</html>
