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
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 17px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 13px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #1DA1F2;
            color: white;
        }
    </style>
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
                                <a class="nav-link" href="Authority_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Data_owners.jsp">Data Owners</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Data_users.jsp">Data Users</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="Authority_request.jsp">Authority Request</a>
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
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <center><h2>Authority Request</h2></center><br>
                        </div>
                        <table id="customers">
                            <tr>
                                <th>File ID</th>
                                <th>File Name</th>
                                <th>Data User Name</th>
                                <th>Access Policy</th>
                                <th>Access Members</th>
                                <th>User Role</th>
                                <th>Authority Status</th>
                                <th>Action</th>
                            </tr>
                            <%
                                Connection con = SQLconnection.getconnection();
                                Statement st = con.createStatement();
                                String temp = null;
                                try {
                                    ResultSet rs = st.executeQuery("SELECT * FROM request WHERE status = 'Approved' ");
                                    while (rs.next()) {
                                        String urole = rs.getString("urole");
                                        String str = rs.getString("access_members");
                                        str = str.replaceAll("\\[", "").replaceAll("\\]", "");
                                        if (str.contains(urole)) {
                                            temp = "Approved";
                                        } else {
                                            temp = "Rejected";
                                        }
                                        if (temp == "Approved") {
                            %>
                            <tr>
                                <td><%=rs.getString("fid")%></td>
                                <td><%=rs.getString("filename")%></td>
                                <td><%=rs.getString("uname")%></td>
                                <td><%=rs.getString("access_policy")%></td>
                                <td><%=str%></td>
                                <td><%=rs.getString("urole")%></td>
                                <td><%=temp%></td>
                                <td><i><a href="authority_approve.jsp?fid=<%=rs.getString("fid")%>&rid=<%=rs.getString("id")%>" class="btn btn-success btn-circle fa fa-check" style="color: white ; width: 40px; height: 40px"></a></i></td>
                            </tr>
                            <%} else {%>
                            <tr>
                                <td><%=rs.getString("fid")%></td>
                                <td><%=rs.getString("filename")%></td>
                                <td><%=rs.getString("uname")%></td>
                                <td><%=rs.getString("access_policy")%></td>
                                <td><%=str%></td>
                                <td><%=rs.getString("urole")%></td>
                                <td><%=temp%></td>
                                <td><i><a href="authority_reject.jsp?fid=<%=rs.getString("fid")%>&rid=<%=rs.getString("id")%>" class="btn btn-danger btn-circle fa fa-trash" style="color: white ; width: 40px; height: 40px"></a></i></td>
                            </tr>
                            <%                           }
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }


                            %>
                        </table>
                        <br><br><br><br><br>
                    </div>
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
