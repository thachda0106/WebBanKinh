<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
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
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav me-auto mt-md-0 ">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->

                        <li class="nav-item search-box">
                            <a class="nav-link text-muted" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search" style="display: none;">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a
                                    class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>

                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="resources/assets/images/users/1.jpg" alt="user" class="profile-pic me-2">${AdminName }
                            </a>
                            	<a href="/WebBanKinh/admin/logout.htm"><button class="btn btn-info" style="font-size: 16px; font-weight: 600; background-color: var(--primary-color);"> Đăng xuất</button></a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown"></ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link "
                                href="admin/home.htm" aria-expanded="false">
                                <i class="mdi me-2 mdi-home-variant"></i><span class="hide-menu">Trang chủ</span></a>
                        </li>                      
                        <li class="sidebar-item "> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="admin/products/index.htm" aria-expanded="false"><i class="mdi me-2 mdi-sunglasses"></i><span
                                    class="hide-menu">Sản phẩm</span></a></li>                       
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="admin/category/index.htm" aria-expanded="false"><i class="mdi me-2 mdi-sunglasses"></i><span
                                    class="hide-menu">Danh mục</span></a></li>
                        <li class="sidebar-item selected"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="admin/orders/index.htm" aria-expanded="false"><i class="fas me-2 fa-tasks"></i><span
                                    class="hide-menu">Orders</span></a></li>

                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
            <div class="sidebar-footer">
                <div class="row">
                    <div class="col-4 link-wrap">	
                        <!-- item-->
                        <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i
                                class="ti-settings"></i></a>
                    </div>
                    <div class="col-4 link-wrap">
                        <!-- item-->
                        <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i
                                class="mdi mdi-gmail"></i></a>
                    </div>
                    <div class="col-4 link-wrap">
                        <!-- item-->
                        <a href="" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i
                                class="mdi mdi-power"></i></a>
                    </div>
                </div>
            </div>
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="page-title mb-0 p-0">Admin Orders</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item" style="display: flex; align-items: center;"><a href="#">Home</a>
                                    <span style= "color: #99abb4; font-size: 16px;" ><i class ="mdi mdi-chevron-right"></i> Orders </span>
                                    
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
             <jsp:useBean id="pagedListHolder" scope="request"
				type="org.springframework.beans.support.PagedListHolder" />
			<c:url value="admin/orders/index.htm" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>
                <div class="row">
                    <!-- column -->
                    <div class="col-sm-12">	
                    	<span style="color: red; font-style: italic; font-size: 16px;"> ${message}</span>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="color: #1e88e5;">Danh sách sản phẩm</h4> 
                                <h6 class="card-subtitle">  </h6>
                                <div class="table-responsive">
                                <form action="admin/orders/index.htm" >
                                	<input type="date" id="dt" style="text-indent: -500px;height:25px; width:200px" onchange="mydateStart1();" hidden/>
									<input name="strDateStart" type="text" id="ndt" value="${dateStartMonth }"  onclick="mydateStart();" />
									<input type="button" Value="Chọn ngày" onclick="mydateStart();" />
									<span>Đến ngày</span>
									<input  type="date" id="dt1" style="text-indent: -500px;height:25px; width:200px" onchange="mydateEnd1();" hidden/>
									<input name="strDateEnd" type="text" id="ndt1" value="${dateNow }"  onclick="mydateEnd();" />
									<input type="button" Value="Chọn ngày" onclick="mydateEnd();" />
									<button name="search"><i class="fas fa-search"></i></button>
								</form>
								<div class="col-xs-12">
								<input id="total1" hidden value="0" name="total"/>
								<h4 class="text-right">
									Tổng: <strong class="total" >0</strong>
								</h4>
						</div>
									<table class="table user-table" style="text-align: center" >
                                        <thead>
                                            <tr>
                                            	<th class="border-top-0">#</th>
                                                <th class="border-top-0">Tên Khách hàng</th>
                                                <th class="border-top-0">Ngày giờ</th>
                                                <th class="border-top-0">Thành tiền</th>                                                                                   
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="od" items="${pagedListHolder.pageList}">
                                            <tr>   
                                            	<td>${od.id}</td>
                                                <td>${od.customer.name}</td>
                                                <td> <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${od.datetime}" /></p></td>
                                                <td> 
                                                <input class="price" hidden value="${od.total}" />
                                                 <fmt:formatNumber pattern="###,###,### VND"  value="${od.total}"  type="currency" groupingUsed = "true" maxFractionDigits = "0"/> 
                                                 </td>       
     
                                            
                                            </tr>
                                        	</c:forEach>

                                        </tbody>
                                    </table>
                                    <tag:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                                </div>
							</div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer" style="position: fixed;bottom: 0;right: 0;left: 240px;"> 
            		Content for footer...
            	
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
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
    <script type="text/javascript">
	
    function mydateStart()
    {
      //alert("");
    document.getElementById("dt").hidden=false;
    document.getElementById("ndt").hidden=true;
    }
    function mydateStart1()
    {
     d=new Date(document.getElementById("dt").value);
    dt=d.getDate();
    mn=d.getMonth();
    mn++;
    yy=d.getFullYear();
    document.getElementById("ndt").value=yy+"-"+mn+"-"+dt
    document.getElementById("ndt").hidden=false;
    document.getElementById("dt").hidden=true;
    }
    function mydateEnd()
    {
      //alert("");
    document.getElementById("dt1").hidden=false;
    document.getElementById("ndt1").hidden=true;
    }
    function mydateEnd1()
    {
     d=new Date(document.getElementById("dt1").value);
    dt=d.getDate();
    mn=d.getMonth();
    mn++;
    yy=d.getFullYear();
    document.getElementById("ndt1").value=yy+"-"+mn+"-"+dt
    document.getElementById("ndt1").hidden=false;
    document.getElementById("dt1").hidden=true;
    }
    function tinhTong() {
		var prices = document.querySelectorAll('.price');
		total = 0
		for (i = 0; i < prices.length; i++) {
			total += Math.ceil(prices[i].value)
		}
		var formatter = new Intl.NumberFormat('vi-VN', {
			style : 'currency',
			currency : 'VND'
		});

		document.querySelector('.total').innerHTML = formatter.format(total);
	}
	
	tinhTong()
    </script>   
</body>
</html>