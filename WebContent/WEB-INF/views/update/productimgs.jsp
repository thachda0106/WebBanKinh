<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, materialpro admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, materialpro admin lite design, materialpro admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Material Pro Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Admin page</title>
    <base href="${pageContext.servletContext.contextPath}/" >
        <!--START: BOOSTRAP -->
			<!-- Bootstrap CSS -->
    		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    		<!-- Optional JavaScript -->
    		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
   			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!--END: BOOSTRAP -->

        <!--START: MY CSS -->
         	<!--link rel="stylesheet"href="Reset.css"-->
        	<!--link rel="stylesheet" href="./assets/css/base.css"-->
      		<!--link rel="stylesheet" href="./assets/css/main.css"-->
        	<!--link rel="stylesheet" href="./assets/css/reponsive.css"-->
		    <link rel="canonical" href="https://www.wrappixel.com/templates/materialpro-lite/" />
		    <!-- Favicon icon -->
		    <link rel="icon" type="image/png" sizes="16x16" href="resources/assets/images/favicon.png">
		    <!-- chartist CSS -->
		    <link href="resources/assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
		    <link href="resources/assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
		    <link href="resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
		    <!--This page css - Morris CSS -->
		    <link href="resources/assets/plugins/c3-master/c3.min.css" rel="stylesheet">
		    <!-- Custom CSS -->
		    <link href="resources/assets/css/style.min.css" rel="stylesheet">
		    
        <!--END: MY CSS -->

        <!--START: FONT -->
        <!--END: FONT -->
         <style type="text/css">
*[id*=".errors"] {
	color: red;
	font-style: italic;
}

.form-control {
	border: 2px solid #3339548f;
}

.form-control, .form-select {
	height: calc(2em + 0.75rem + 2px);
}
input {
	font-size: 16px;
}

label {
	font-size: 16px;
	font-weight:500;
	color: #28a745;
}

</style>
</head>
<body>

    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand ms-4" href="index.html">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="resources/imgs/logo/logospecial.png" width="200px" height="auto" alt="homepage" class="dark-logo" style="filter: invert(1);" />

                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text" style="margin-left: 70px; color: #f1f1f1">
                            <!-- dark Logo text -->
                        </span>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-white d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-lg-none d-md-block ">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white "
                                href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="resources/assets/images/users/1.jpg" alt="user" class="profile-pic me-2">Thach STONE
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown"></ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>


        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            
            <!-- Container fluid  -->
            <!-- ============================================================== -->
			<div class="container-fluid row" style="margin: 15px 30%">
				<div class ="col-md-5">
					<h3 class="" >Thêm ảnh sản phẩm: ${pInfo}</h3>
					<div class="" style="font-size: 16px; font-weight:500;color:#28a745"> ${message}</div> 
					<form:form action="admin/products/upload-pimg.htm" method="Post" enctype="multipart/form-data" modelAttribute="pImg" >
						<form:input type="hidden"
								class="form-control" path="product.id" />
						
						<div class="form-group">
							<label for="image">Upload ảnh sản phẩm</label> 
							<input name="image" type="file" class="form-control-file" id="image"/>
							
						</div>
						 <button type="submit" class="btn btn-success ">Upload ảnh sản phẩm</button>							
						 <a href="admin/products/index.htm" class="btn btn-dark ml-3">Back</a> 
					</form:form>				
				</div>

			

		</div>
	
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer" style="position: fixed;bottom: 0;right: 0;left: 0;"> 
            		Content for footer...
            	
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="resources/assets/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="resources/assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/assets/js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="resources/assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="resources/assets/js/sidebarmenu.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!-- chartist chart -->
    <script src="resources/assets/plugins/chartist-js/dist/chartist.min.js"></script>
    <script src="resources/assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 JavaScript -->
    <script src="resources/assets/plugins/d3/d3.min.js"></script>
    <script src="resources/assets/plugins/c3-master/c3.min.js"></script>
    <!--Custom JavaScript -->
    <script src="resources/assets/js/pages/dashboards/dashboard1.js"></script>
    <script src="resources/assets/js/custom.js"></script>
    
</body>
</html>