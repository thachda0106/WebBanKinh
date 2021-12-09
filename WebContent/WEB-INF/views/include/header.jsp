<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cửa hàng bán kính XXSTORE</title>
<%-- 	<base href="${pagecontext.servletcontext.contextpath}/"> --%>
<!--START: BOOSTRAP -->
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!------ Include the above in your HEAD tag ---------->

 
 
<!------ Include the above in your HEAD tag ---------->
<!--END: BOOSTRAP -->

<!--START: MY CSS -->
<link rel="stylesheet" href="/WebBanKinh/resources/css/reset.css">
<link rel="stylesheet" href="/WebBanKinh/resources/css/base.css">
<link rel="stylesheet" href="/WebBanKinh/resources/css/main.css">
<link rel="stylesheet" href="/WebBanKinh/resources/css/products.css">
<link rel="stylesheet" href="/WebBanKinh/resources/css/news.css">
<!--END: MY CSS -->

<!--START: FONT -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--END: FONT -->
</head>
<body>
	<header class="header">
		<div class="header__wrap">
			<div class="header__hotline">
				<a href="tel:+028 9999 0090">Hotline: +888 182 717</a>
			</div>
			<div class="header__nav">
				<div class="header__nav-logo">
					<a href="/WebBanKinh/home.htm" class="nav-logo" ><img
						style="filter: invert(1);"
						src="/WebBanKinh/resources/imgs/logo/logospecial.png" alt="XXSTORE" width="200px"
						height="auto"></a>
				</div>

				<ul class="header__nav-list-page">
					<li class="header__nav-item"><a href="/WebBanKinh/home.htm">TRANG CHỦ</a></li>
					<li class="header__nav-item"><a href="/WebBanKinh/products.htm"> SẢN PHẨM
							<i class="fas fa-angle-down item-icon"></i>
					</a>
						<ul
							class="header__nav-subnav
                        header__nav-item--subnav-SP">
							<c:forEach var="c" items="${applicationScope.categories}">
							<li><a href="/WebBanKinh/products-${c.name}.htm">${c.name}<i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>    
							
							</c:forEach>                   	
						</ul>
						</li>


					<li class="header__nav-item"><a href="/WebBanKinh/news.htm">TIN TỨC</a></li>
					<li class="header__nav-item"><a href="/WebBanKinh/store-system.htm">HỆ
							THỐNG CỬA HÀNG </a></li>
				</ul>

				<ul class="header__nav-list-key">
					<li class="nav-list-key__item"><a href="/WebBanKinh/products.htm"
						class="header__nav-search"> <i
							class="fas fa-search header__nav--icon"></i>
					</a>
						<form method="POST" action="/WebBanKinh/products-search.htm" class="search-wrap">
							<input type="search" name="key" id="key"
								placeholder="Nhập từ khóa..." class="header__search-input">
							<button type="submit" name="search" class="btn input-search-icon">
								<i class="fas fa-search header__nav--icon"></i>

							</button>
						</form></li>
					<li class="nav-list-key__item">
					
<!-- 					nếu login icon user -->
<!-- 					<a
						href="/user/profile" class="header__nav-user"> 
						<i
							class="fas fa-user header__nav--icon"></i>
					</a> -->
					 	<c:choose>
							<c:when test="${not empty curUser}">
								<a href="/WebBanKinh/profile.htm" class="header__nav-user"> <i
									class="fas fa-user header__nav--icon"></i>
								</a>

							</c:when>
								<c:otherwise>
									<a href="/WebBanKinh/login.htm" class="header__nav-user"> <i
									class="fas fa-user header__nav--icon"></i>
								</a>
								</c:otherwise>
				        	</c:choose>
						<ul class="header-subnav-user">
							<c:choose>
								<c:when test="${not empty curUser}">
									<li class="subnav-user-item"><a href="/WebBanKinh/profile.htm">Thông tin cá nhân</a></li>
									<li class="subnav-user-item"><a href="/WebBanKinh/logout.htm">Đăng xuất</a></li> 
								</c:when>
								<c:otherwise>
									<li class="subnav-user-item"><a href="/WebBanKinh/login.htm">Đăng nhập / Đăng ký</a></li> 
								</c:otherwise>
							</c:choose>
						</ul>
					</li>
					<li class="nav-list-key__item" style="display: flex;"><a
						href="/WebBanKinh/cart.htm" class="header__nav-shopping"
						style="display: flex; flex-direction: row;"> <i
							class="fas fa-shopping-cart
                            header__nav--icon"
							style="line-height: 50px;"></i>
							<div>
								<p class="ml-3"
									style="margin-bottom: unset; display: flex; flex-direction: column; font-size: 18px;">
									<strong class="pl-1"> Giỏ Hàng</strong> 
<!-- 									<span
										class="font-weight-normal" style="font-size: 16px;"> (
										{{session.cart.totalQty}} sản phẩm )</span>  -->
										<span
										class="font-weight-normal" style="font-size: 16px;"> (
										sản phẩm )</span>
								</p>

							</div>
					</a></li>
				</ul>

			</div>

		</div>

	</header>