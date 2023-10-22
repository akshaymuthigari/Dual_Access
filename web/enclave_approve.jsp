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
    String fid = request.getParameter("fid");
    String rid = request.getParameter("rid");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update request set enclave_status='Approved' where id='" + rid + "' ");
        System.out.println("test print==" + rid);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from request where id = '" + rid + "' ");
            if (rs.next()) {
                String mail = rs.getString("umail");
                String dkey = rs.getString("dkey1");
                String fname = rs.getString("filename");
                String msggg = "Enclave Approved Your File Request\nFilename : "+fname+"\nDecryption Key2 : " + dkey;
                Mail ma = new Mail();
                ma.secretMail(msggg, "File_Approved", mail);
                String msg = "File_Approved" + msggg;
                System.out.println("success");
                response.sendRedirect("Enclave_request.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("Enclave_request.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

