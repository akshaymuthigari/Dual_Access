<%-- 
    Document   : index
    Created on : 20 Apr, 2021, 3:38:11 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <title>Dual Access Control for Data Storage</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-host-cloud.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>
    <body>
        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->
        <!-- Header -->
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand"><h2>Dual Access Control</h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="DU_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Access_file.jsp">Access File</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="req_files.jsp">Requested File</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="downloaded_files.jsp">Downloaded Files</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Dual Access Control for Cloud-Based Data Storage</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-section">
            <div class="container">
                <center><h2>Download File</h2></center><br><br>
                <div class="row">
                    <div class="col-md-6">
                        <img src="img/download.jpg" width="500" height="350" />
                    </div>
                    <div class="col-md-6">
                        <%
                            String uid = (String) session.getAttribute("duid");
                            String fid = request.getParameter("fid");
                            String time = request.getParameter("time");
                            String dkey = request.getParameter("dkey");
                            String dkey1 = request.getParameter("dkey1");
                            System.out.println("File ID : " + fid);
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            Statement st1 = con.createStatement();
                            Statement st2 = con.createStatement();
                            Statement st3 = con.createStatement();
                            Statement st4 = con.createStatement();
                            String file = null;
                            try {

                                ResultSet rs1 = st1.executeQuery("Select * from request where uid = '" + uid + "' AND fid = '" + fid + "' AND time ='" + time + "' AND access_policy = 'Read' AND dkey = '" + dkey + "' AND dkey1 = '" + dkey1 + "' AND authority_status = 'Approved' AND enclave_status = 'Approved'");
                                if (rs1.next() == true) {
                                    ResultSet rs = st.executeQuery("Select * from data_files where id = '" + fid + "'");
                                    if (rs.next()) {
                                        file = rs.getString("data");
                        %>
                        <form action="download" method="post">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="hidden" value="<%=fid%>" name="fid">
                                    <input type="hidden" value="<%=dkey%>" name="dkey">
                                    <input type="hidden" value="<%=dkey1%>" name="dkey1">
                                    <label><b>File Name:</b></label><br>
                                    <input type="text" class="form-control" name="filename" readonly="" value="<%=rs.getString("filename")%>" />   <br>        	
                                </div>
                                <div class="form-group">
                                    <label><b>File Content:</b></label><br>
                                    <textarea class="form-control" style=" height: 170px;resize: none" readonly="" name="data"><%=rs.getString("data")%></textarea>  <br>         
                                </div>
                            </div>
                        </form>
                        <%                          }
                        } else {
                            ResultSet rt = st2.executeQuery("Select * from request where uid = '" + uid + "' AND fid = '" + fid + "' AND time ='" + time + "' AND dkey = '" + dkey + "' AND dkey1 = '" + dkey1 + "'");
                            if (rt.next()) {
                                ResultSet rt1 = st3.executeQuery("Select * from data_files where id = '" + fid + "'");

                                if (rt1.next()) {

                        %>

                        <form action="download" method="post">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="hidden" value="<%=fid%>" name="fid">
                                    <input type="hidden" value="<%=dkey%>" name="dkey">
                                    <input type="hidden" value="<%=dkey1%>" name="dkey1">
                                    <label><b>File Name:</b></label><br>
                                    <input type="text" class="form-control" name="filename" readonly="" value="<%=rt.getString("filename")%>" />   <br>        	
                                </div>
                                <div class="form-group">
                                    <label><b>File Content:</b></label><br>
                                    <textarea class="form-control" style=" height: 160px;resize: none" readonly="" name="data"><%=rt1.getString("data")%></textarea>  <br>         
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-lg">Download</button>
                                </div>
                            </div>
                        </form>
                        <%           }
                                    } else {
                                        response.sendRedirect("req_files.jsp?Incorrect_key_values");
                                    }
                                }

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        <br><br><br><br><br>
                    </div>
                </div>
            </div>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="sub-footer">
                                <p>&copy; 2021</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer Ends Here -->
            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Additional Scripts -->
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/owl.js"></script>
            <script src="assets/js/accordions.js"></script>
            <script language = "text/Javascript">
                cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
                function clearField(t) {                   //declaring the array outside of the
                    if (!cleared[t.id]) {                      // function makes it static and global
                        cleared[t.id] = 1;  // you could use true and false, but that's more typing
                        t.value = '';         // with more chance of typos
                        t.style.color = '#fff';
                    }
                }
            </script>
    </body>
</html>
