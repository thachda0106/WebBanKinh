<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container" style="padding-top: 60px;">
	<h1 class="page-header">Profile</h1>
	<div class="row">
		<!-- left column -->
		<div class="col-md-4 col-sm-6 col-xs-12">
			<div class="text-center">
				<img src="resources/imgs/icons/user_1.png"
					class="avatar img-circle img-thumbnail" alt="avatar" width="250px"
						height="auto">
				<h6>Upload a different photo...</h6>
				<input type="file" class="text-center center-block well well-sm">
			</div>
		</div>
		<!-- edit form column -->
		<div class="col-md-8 col-sm-6 col-xs-12 personal-info">

			<h3>Personal info</h3>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-lg-3 control-label">Tên người dùng: </label>
					<div class="col-lg-8">
						<p class="col-lg-3 control-label">${name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Địa chỉ: </label>
					<div class="col-lg-8">
						<p class="col-lg-3 control-label">${address}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Số điện thoại: </label>
					<div class="col-lg-8">
						<p class="col-lg-3 control-label">${phone}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Email: </label>
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