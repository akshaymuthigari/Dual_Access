<%-- 
    Document   : index
    Created on : 20 Apr, 2021, 3:38:11 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DO_login.jsp">Data Owner</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DU_login.jsp">Data User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Authority_login.jsp">Authority Center</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Cloud_login.jsp">Cloud</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Enclave_login.jsp">Enclave</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="header-text caption">
                            <h2>Dual Access Control for Cloud-Based Data Storage</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="services-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <center><h2>ABSTRACT</h2></center><br>
                            <p align="justify" style="font-size: 22px;">Cloud-based data storage service has drawn increasing interests from both academic and industry in the recent years due
                                to its efficient and low cost management. Since it provides services in an open network, it is urgent for service providers to make use of
                                secure data storage and sharing mechanism to ensure data confidentiality and service user privacy. To protect sensitive data from
                                being compromised, the most widely used method is encryption. However, simply encrypting data (e.g., via AES) cannot fully address
                                the practical need of data management. Besides, an effective access control over download request also needs to be considered so
                                that Economic Denial of Sustainability (EDoS) attacks cannot be launched to hinder users from enjoying service. In this paper, we
                                consider the dual access control, in the context of cloud-based storage, in the sense that we design a control mechanism over both
                                data access and download request without loss of security and efficiency. Two dual access control systems are designed in this paper,
                                where each of them is for a distinct designed setting. The security and experimental analysis for the systems are also presented.</p>
                        </div>
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
