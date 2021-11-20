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
<title>Cửa hàng bán kính HTT</title>
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
<!--END: BOOSTRAP -->

<!--START: MY CSS -->
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/base.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/products.css">
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
					<a href="/WebBanKinh/home.htm"" class="nav-logo" ><img
						style="filter: invert(1);"
						src="resources/imgs/logo/logospecial.png" alt="XXSTORE" width="200px"
						height="auto"></a>
				</div>

				<ul class="header__nav-list-page">
					<li class="header__nav-item"><a href="/WebBanKinh/home.htm">TRANG CHỦ</a></li>
					<li class="header__nav-item"><a href="/WebBanKinh/products.htm"> SẢN PHẨM
							<i class="fas fa-angle-down item-icon"></i>
					</a>

<!-- 						<ul
							class="header__nav-subnav
                        header__nav-item--subnav-SP">
							<li><a href="/categorys/hang-moi">HÀNG MỚI <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
							<li><a href="/categorys/ao-thun">ÁO THUN <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
							<li><a href="/categorys/quan">QUẦN <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
							<li><a href="/categorys/ao-khoac">ÁO KHOÁC <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
							<li><a href="/categorys/giay">GIÀY <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
							<li><a href="/categorys/non">NÓN <i
									class="fas
                                    fa-angle-right sub-icon"></i></a>
							</li>
						</ul> -->
						</li>


					<li class="header__nav-item"><a href="/news">TIN TỨC</a></li>
					<li class="header__nav-item"><a href="/shop-system">HỆ
							THỐNG CỬA HÀNG </a></li>
				</ul>

				<ul class="header__nav-list-key">
					<li class="nav-list-key__item"><a href="/search"
						class="header__nav-search"> <i
							class="fas fa-search header__nav--icon"></i>
					</a>
						<form method="GET" action="/search/products" class="search-wrap">
							<input type="search" name="name" id="name"
								placeholder="Nhập từ khóa..." class="header__search-input">
							<button type="submit" class="btn input-search-icon">
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
					 
					 <a href="./login.htm" class="header__nav-user"> <i
							class="fas fa-user header__nav--icon"></i>
					</a> 

						<ul class="header-subnav-user">
<!-- 							{{# neu login }}
							<li class="subnav-user-item"><a href="/user/profile" class>Thông
									tin cá nhân</a></li>
							<li class="subnav-user-item"><a href="/user/logout" class>Đăng
									xuất</a></li> {{else}} -->

							<li class="subnav-user-item"><a href="./profile.htm" class>Profile</a></li>
							<li class="subnav-user-item"><a href="./logout.htm" class>Đăng xuất</a></li> 
						</ul>
					</li>
					<li class="nav-list-key__item" style="display: flex;"><a
						href="/cart" class="header__nav-shopping"
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