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
    String id = request.getParameter("id");
    String mail = request.getParameter("email");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update du_reg set status='Approved' where id='" + id + "' ");
        System.out.println("test print==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from du_reg where id = '" + id + "' ");
            if (rs.next()) {
                String msggg = "Data User Account has been Activated";
                Mail ma = new Mail();
                ma.secretMail(msggg, "Account_Activated", mail);
                String msg = "Account Activated:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("Data_users.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("Data_users.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

