<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<div class="container" style="padding-top: 60px;">
  <h1 class="page-header">Edit Profile</h1>
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="resources/imgs/icons/user_1.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block well well-sm">
      </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <div class="alert alert-info alert-dismissable" id="txt-alert" hidden>
               
      </div>
      <h3>Personal info</h3>
      <form onsubmit = "return submitForm(event)" class="form-horizontal" role="form" action="edit.htm" method="post">
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
            <input class="form-control" value="${mail }" name="mail" type="text" required pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-3 control-label">Username:</label>
          <div class="col-md-8">
            <p class="form-control" name="username">${username }</p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Password:</label>
          <div class="col-md-8">
            <input class="form-control" name="pasword" type="password" required="required" id="pass1">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-md-8">
            <input class="form-control" name="password1" type="password" required="required" id="pass2">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" value="Save Changes" type="submit" id="btn-save">
    
            <input class="btn btn-default" value="Cancel" action="profile.htm" type="reset">
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
			txtAlert.innerHTML = "Confirm password không trùng khớp"
			
			return false
		}
		return true
	}
</script>