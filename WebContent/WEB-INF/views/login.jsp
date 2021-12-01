<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/login.css">
<title>Đăng nhập</title>
</head>
<body>
	<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active underlineHover" id="login-btn"> Đăng nhập </h2>
    <h2 class="inactive underlineHover" id="register-btn">Đăng ký</h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="resources/imgs/logo/logo.png" alt="Icon" width="100px"
						height="auto" />
    </div>

    <!-- Login Form -->
    <form action = "loginC.htm" method="post" id="login">
      <p class="text-danger" name="alert" id="txt-alert" >${alert }</p>  
      <input type="text"  class="fadeIn second" name="username" placeholder="username" required="required">
      
      <input type="password" class="fadeIn third" name="password" placeholder="password" required="required">
                  
      
      <input type="submit" class="fadeIn fourth" value="Đăng nhập">
   
   <!-- Register Form -->
    </form>
    <form action = "registerC.htm" method="post" id="register" hidden>
      <p class="text-danger" name="alert" id="txt-alert" >${alert }</p> 
      <input type="text"  class="fadeIn second" name="username" placeholder="username" required="required">
     
      <input type="password"  class="fadeIn second" name="password" placeholder="password" required="required">
    
      <input type="text" class="fadeIn second" name="name" placeholder="Họ tên" required="required">
    
      <input type="text" class="fadeIn second" name="address" placeholder="Địa chi" required="required">
      
      <input type="text" class="fadeIn second" name="phone" placeholder="Số điện thoại" required pattern="(\+84|0)\d{9,10}">
      
      <input type="email" class="fadeIn second" name="email" placeholder="Email" required pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$">
      
      <input type="submit" class="fadeIn third" value="Đăng ký">
      
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="/WebBanKinh/resetPass.htm">Quên mật khẩu?</a>
    </div>

  </div>
</div>
<script type="text/javascript">
	var loginBtn = document.getElementById("login-btn")
	var registerBtn = document.getElementById("register-btn")
	var loginForm = document.getElementById("login")
	var registerForm = document.getElementById("register")
	loginBtn.addEventListener('click', ()=>{
		loginBtn.classList.toggle('active', true)
		loginBtn.classList.toggle('inactive', false)
		registerBtn.classList.toggle('active', false)
		registerBtn.classList.toggle('inactive', true)
		loginForm.hidden = false
		registerForm.hidden = true
	})
	registerBtn.addEventListener('click', ()=>{
		loginBtn.classList.toggle('active', false)
		loginBtn.classList.toggle('inactive', true)
		registerBtn.classList.toggle('active', true)
		registerBtn.classList.toggle('inactive', false)
		loginForm.hidden = true
		registerForm.hidden = false
	})
	
</script>
</body>
</html>