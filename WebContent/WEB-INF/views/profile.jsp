<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="wrapper" style="background-color: #f8f8f8"> 
	<nav class="bread-crumbs mt-2">
			<a href="/WebsiteBanKinh/home.htm"> <i class="fas fa-home mr-1"></i> Trang chủ </a>
			<span class="divider" style="font-weight: bold;"><i class="fas fa-chevron-right ml-2" style="font-size: 12px"></i> Trang cá nhân</span>
	</nav>
	<hr style="margin-bottom:0px;margin-left:30px; margin-right:30px;">
</div>
<div class="container" style="padding: 60px 20px;">
	<div class="row wrapper-inforus">
		<!-- left column -->
		<div class="col-md-4 col-sm-6 col-xs-12">
			<div class="text-center">
		      	<c:choose>
		      		<c:when test="${not empty useravatar}">
		      		   <img src="resources/imgs/icons/${useravatar}" class="avatar img-circle img-thumbnail" alt="avatar" width="200px" height="auto">  		
		      		</c:when>
		      		<c:otherwise>
		         	   <img src="resources/imgs/icons/avatar-default.png" class="avatar img-circle img-thumbnail" alt="avatar">  		
		      		</c:otherwise>
		      	
		      	</c:choose>
		      
			</div>
		</div>
		<!-- edit form column -->
		<div class="col-md-8 col-sm-6 col-xs-12 personal-info">

			<form class="form-horizontal" role="form" style="padding: 15px 0;">
				<div class="form-group">
					<label class="col-lg-3 control-label"> <i class="fas fa-user"></i> Tên người dùng: </label>
					<div class="col-lg">
						<span style="margin-left:30px; width: 200px; font-size: 16px;">${name}</span>
					</div>
				</div>
				<div class="form-group" style="display: flex; align-items: center; ">
					<label class="col-lg-3 control-label"><i class="fas fa-map-marker-alt mr-2"></i>Địa chỉ: </label>
					<div class="col-lg">
						<p style="font-size:16px; padding-left: 15px">${address}</p>
					</div> 
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label"><i class="fas fa-phone mr-2"></i>Số điện thoại: </label>
					<div class="col-lg-8">
						<p class="col-lg-3 control-label">${phone}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label"><i class="fas fa-envelope-square mr-2"></i>Email: </label>
					<div class="col-lg-8">
						<p class="col-lg-3 control-label">${mail}</p>
					</div>
				</div>
			</form>
			<form action="profile-edit.htm" method="post" id="profile">
				<div class="form-group">
					<label class="col-md-3 control-label"></label>
					<div class="col-md-8">
						<input class="btn btn-primary" value="Chỉnh sửa" type="submit">
						<span></span>

					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
