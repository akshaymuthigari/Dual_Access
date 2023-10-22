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
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
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
                                <a class="nav-link" href="Cloud_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Cloud_files.jsp">Cloud Files</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Requested_files.jsp">Requested Files</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="graph.jsp">Graph</a>
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
                            <center><h2>Analysis</h2></center><br>
                        </div>
                        <%
                            String val1 = "", val2 = "", val3 = "";
                            String val11 = "", val22 = "", val33 = "";
                            int i = 0;

                            try {
                                Connection con = SQLconnection.getconnection();

                                Statement st1 = con.createStatement();
                                ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  data_files ");
                                rs2.next();
                                {
                                    val2 = rs2.getString("AVG(enc_time)");
                                }
                                rs2.close();
                                Statement st2 = con.createStatement();
                                ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                rs3.next();
                                {
                                    val3 = rs3.getString("AVG(decrypt_time)");
                                }
                                System.out.println("count------------------> " + val2);
                                System.out.println("count------------------> " + val3);

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
                        <script type="text/javascript">
                            window.onload = function () {

                                var chart = new CanvasJS.Chart("chartContainer", {
                                    animationEnabled: true,
                                    exportEnabled: true,
                                    theme: "light2", // "light1", "light2", "dark1", "dark2"
                                    title: {
                                        text: ""
                                    },
                                    axisY: {
                                        title: "Time in MS"
                                    },
                                    data: [{
                                            type: "column",
                                            showInLegend: true,
                                            legendMarkerColor: "grey",
                                            legendText: "Entities",
                                            dataPoints: [
                                                {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                            ]
                                        }]
                                });
                                chart.render();
                            }
                        </script>
                        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
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
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                    // First circle
                    new Circlebar({
                        element: "#circle-1",
                        type: "progress",
                        maxValue: "90"
                    });

                    // Second circle
                    new Circlebar({
                        element: "#circle-2",
                        type: "progress",
                        maxValue: "84"
                    });

                    // Third circle
                    new Circlebar({
                        element: "#circle-3",
                        type: "progress",
                        maxValue: "60"
                    });

                    // Fourth circle
                    new Circlebar({
                        element: "#circle-4",
                        type: "progress",
                        maxValue: "74"
                    });

        </script>
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
