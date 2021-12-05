<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<div class="wrapper" style="background-color: #f8f8f8"> 
	<nav class="bread-crumbs mt-2">
			<a href="/WebsiteBanKinh/home.htm"> <i class="fas fa-home mr-1"></i> Trang chủ </a>
			<span class="divider" style="font-weight: bold;"><i class="fas fa-chevron-right ml-2" style="font-size: 12px"></i> Chỉnh sửa trang cá nhân</span>
	</nav>
	<hr style="margin-bottom:0px;margin-left:30px; margin-right:30px;">
</div>
<div class="container" style="padding-top: 10px;padding-bottom: 60px;">

  <div class="row">
    <!-- left column -->
<!--     <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="resources/imgs/icons/user_1.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block well well-sm">
      </div>
    </div> -->
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <div class="alert alert-info alert-dismissable" id="txt-alert" hidden>
               
      </div>
      <form onsubmit = "return submitForm(event)" class="form-horizontal" enctype="multipart/form-data" role="form" action="edit.htm" method="post">
      
      <div class="text-center">
      	<c:choose>
      		<c:when test="${ not empty useravatar}">
      		   <img src="resources/imgs/icons/${useravatar}" class="avatar img-circle img-thumbnail" alt="avatar" width="200px" height="auto">  		
      		</c:when>
      		<c:otherwise>
         	   <img src="resources/imgs/icons/avatar-default.png" class="avatar img-circle img-thumbnail" alt="avatar">  		
      		</c:otherwise>
      	</c:choose>

        <h6>Thay đổi ảnh đại diện</h6>
        <div style="color: red; font-size: 16px;" >${message}</div>
        <input type="file" class="text-center center-block well well-sm" name="avatar" >
      </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Tên người dùng: </label>
          <div class="col-lg-8">
            <input class="form-control" value="${name }" name="name" type="text" required="required">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Địa chỉ:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${address }" name="address" type="text" required="required">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Số điện thoại:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${phone }" name="phone" type="text" required pattern="(\+84|0)\d{9,10}">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${email }" name="email" type="email" required >
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-3 control-label">Username:</label>
          <div class="col-md-8">
            <p class="form-control" name ="username" >${username }</p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Password:</label>
          <div class="col-md-8">
            <input class="form-control" value="${password }" name="password" type="password" required="required" id="pass1">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-md-8">
            <input class="form-control" value="${password }" name="password1" type="password" required="required" id="pass2">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" value="Lưu thay đổi" type="submit" id="btn-save">
    		<input class = "btn btn-default" value="Reset" type="reset"> 
            <a class = "btn btn-default" href="./profile.htm">Quay về</a>
          </div>
        </div>
      </form>
      
    </div>
  </div>
</div>
<script>
	var btnSave = document.querySelector('#btn-save')
	var txtAlert = document.querySelector('#txt-alert')
	var submitForm= (event)=>{
		var pass1 = document.querySelector('#pass1').value
		var pass2 = document.querySelector('#pass2').value
		if(pass1 != pass2){
			txtAlert.hidden = false
			txtAlert.innerHTML = "<h2>Confirm password không trùng khớp</h2>"
			
			return false
		}
		return true
	}
</script>

<%@include file="/WEB-INF/views/include/footer.jsp" %>