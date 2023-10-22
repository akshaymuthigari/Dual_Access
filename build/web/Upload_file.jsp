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
    <%
        if (request.getParameter("File_uploaded") != null) {
    %>
    <script>alert('File Uploaded Successfully');</script>
    <%            }
    %>
    <script type="text/javascript">
        function loadFile(o)
        {
            var fr = new FileReader();
            fr.onload = function (e)
            {
                showDataFile(e, o);
            };
            fr.readAsText(o.files[0]);
        }

        function showDataFile(e, o)
        {
            document.getElementById("data").innerText = e.target.result;
        }
    </script>
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
                                <a class="nav-link" href="DO_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="Upload_file.jsp">Upload File</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="My_files.jsp">My Files</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="downloaded_files1.jsp">Downloaded Files</a>
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
                <center><h2>Upload File</h2></center><br><br>
                <div class="row">
                    <div class="col-md-6">
                        <br><br><br>
                        <img src="img/upload.png" width="400" height="400" />
                    </div>
                    <div class="col-md-6">
                        <form id="contact" action="upload" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <label>File Keyword :</label>
                                        <input type="text" name="keyword" class="form-control" placeholder="Enter File Keyword" required="required"><br>
                                    </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <label>Select File :</label>
                                        <input type="file" onchange="loadFile(this)" name="fileToUpload" accept=".xls,.xlsx,.slsm,.doc,.docx,.txt,.csv" class="form-control" required="required" /><br>
                                    </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <label>Access Policy :</label>
                                        <select name="policy" required="required" class="form-control">
                                            <option value="">Select Access Policy</option>
                                            <option>Download</option>
                                            <option>Read</option>
                                        </select><br><br>
                                    </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <label>Select Access Members :</label><br>
                                        <input type="checkbox" name="roles" value="Student">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student<br>
                                        <input type="checkbox" name="roles" value="Professor">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Professor<br>
                                        <input type="checkbox" name="roles" value="Principal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Principal<br><br><br>
                                    </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <label>Preview File :</label>
                                        <textarea readonly="" id="data" class="form-control" style="height:120px; resize: none; color: black;"></textarea><br><br>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="btn btn-success btn-lg"><i class="fa fa-upload"></i>&nbsp;&nbsp; Upload</button><br><br><br><br><br>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
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
