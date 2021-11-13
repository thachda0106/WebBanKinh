<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>


<div class="wrapper" style="background-color: #f8f8f8"> 
	<nav class="bread-crumbs mt-2">
			<a href="/WebsiteBanKinh/home.htm"> <i class="fas fa-home mr-1"></i> Trang chủ </a>
			<span class="divider" style="font-weight: bold;"><i class="fas fa-chevron-right ml-2" style="font-size: 12px"></i> Sản phẩm</span>
	</nav>
	<hr style="margin-bottom:0px;margin-left:30px; margin-right:30px;">
</div>
<div id = "main" class="row">
	<div class="sidebar col-md-2">
		<h2>Danh mục sản phẩm</h2>
		<ul>
		<li>Kính mát </li>
		<li>Kính cận </li>
		<li>Kính thời trang </li>
		</ul>
	</div>
	<div class="list-products col-md-10">
		<div class="content mt-3"> 
			<h1> CÁC SẢN PHẨM BÁN CHẠY</h1>
			<hr style="margin-bottom:0px;margin-left:30px; margin-right:30px;">
		</div>
		
		<div class="wrapper-items row">
		
			<div class="card col-2 m-3">
				<div class="card-item">
					<a href="#">
						<img class="card-img-top" src="resources/imgs/product-imgs/1.jpg"
						width="100%" height="auto" alt="Card image cap">	
					</a>
					<div class="card-btn"> <a href="#">Xem sản phẩm</a> </div>			
				</div>
				<div class="card-body mt-4">
					<h5 class="card-title">Kính mắt áp trọng siêu nhân</h5>
					<p class="card-price">100000đ</p>
				</div>
			</div>
						<div class="card col-2 m-3">
				<div class="card-item">
					<a href="#">
						<img class="card-img-top" src="https://kinhmateyeplus.com/wp-content/uploads/2019/11/5114-700x700.jpg"
						width="100%" height="auto" alt="Card image cap">	
					</a>
					<div class="card-btn"> <a href="#">Xem sản phẩm</a> </div>			
				</div>
				<div class="card-body mt-4">
					<h5 class="card-title">Kính mắt áp trọng siêu nhân</h5>
					<p class="card-price">100000đ</p>
				</div>
			</div>
			
			
			
		</div>
		
	
	</div>
</div>
<!-- <div style="height: 1000px; width: 100%; background-color: aqua"> contentest</div> -->

<%@include file="/WEB-INF/views/include/footer.jsp" %>