<%-- 
    Document   : owner_approve
    Created on : Sep 29, 2020, 6:37:38 PM
    Author     : Lenovo
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Networks.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String rid = request.getParameter("rid");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update request set status='Approved' where id='" + rid + "' ");
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("Requested_files.jsp?Request_passed");
        } else {
            System.out.println("failed");
            response.sendRedirect("Requested_files.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

