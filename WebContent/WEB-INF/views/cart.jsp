<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tag"%><%@taglib prefix="spring"
	uri="http://www.springframework.org/tags"%>

<div class="wrapper" style="background-color: #f8f8f8">
	<nav class="bread-crumbs mt-2">
		<a href="/WebBanKinh/home.htm"> <i class="fas fa-home mr-1"></i> Trang chủ
		</a> <a href="/WebBanKinh/products.htm"><i class="fas fa-chevron-right ml-2"
			style="font-size: 12px"></i> Sản phẩm </a> <span class="divider"
			style="font-weight: bold;"><i
			class="fas fa-chevron-right ml-2" style="font-size: 12px"></i> Giỏ
			hàng</span>
	</nav>
	<hr style="margin-bottom: 0px; margin-left: 30px; margin-right: 30px;">
</div>
<div class="container" style="font-size: 14px">
	<div class="row col-md-12" style="margin-top: 30px">
		<div class="col-md-4 panel panel-danger" >
			<h2 class="text-center my-5" style="font-size: 24px; color:#28a745; font-weight:600">Thông tin Thanh Toán</h2>
			<div id="control-display1" style="display: block">
			<form class="form-horizontal" role="form">
				<div class="form-group py-3">
					<label class="col-lg-3 ">Họ Tên </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.name}</p>
					</div>
				</div>
				
				<div class="form-group py-3">
					<label class="col-lg-3 ">SĐT </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.phone}</p>
					</div>
				</div>
				<div class="form-group py-3">
					<label class="col-lg-3 ">Email </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.email}</p>
					</div>
				</div>
				<div class="form-group py-3">
					<label class="col-lg-3 ">Địa chỉ </label>
					<div class="col-lg-9">
						<p class="col-lg-12">:&nbsp;${user.address}</p>	
					</div>
				</div>
				<div class="form-group py-3 d-flex justify-content-center">
				<input class="btn-danger p-3 rounded" type="button" id="btn1" value="Sửa Địa chỉ"/>
				</div>
			</form>
			</div>
			
			
			
			
			<div id="control-display2" style="display: none">
			<form class="form-horizontal" action="/WebBanKinh/cart.htm?editInfo">
				<div class="form-group py-3">
					<label class="col-lg-3 ">Họ Tên </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.name}</p>
					</div>
				</div>
				
				<div class="form-group py-3">
					<label class="col-lg-3 ">SĐT </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.phone}</p>
					</div>
				</div>
				<div class="form-group py-3">
					<label class="col-lg-3 ">Email </label>
					<div class="col-lg-9">
						<p class="col-lg-12 ">:&nbsp;${user.email}</p>
					</div>
				</div>
				<div class="form-group py-3">
					<label class="col-lg-3 ">Địa chỉ </label>
					<div class="col-lg-9">
						<textarea class="form-control" name="address" rows="auto" cols="auto">${user.address }
						</textarea>	
					</div>
				</div>
				<div class="form-group py-3 d-flex justify-content-center">
				<button class="btn-danger p-3 rounded" id="btn2" name="editAddress">Xác Nhận</button>
				</div>
			</form>
			</div>

			</div>
		<div class="col-md-8">
		<p style="color: blue; font-size:16px; font-weight: 700">${MessComfirm}</p>
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-12">
								<h5>
									<span class="glyphicon glyphicon-shopping-cart"></span>
									Shopping Cart
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body ">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col" style="width:40%"">SẢN PHẨM</th>
								<th scope="col" class="text-center">SỐ LƯỢNG</th>
								<th scope="col" class="text-right">ĐƠN GIÁ</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="litem" items="${list_lineItems }">
								<tr>
									<td><img class="img-responsive"
										src="/WebBanKinh/resources/imgs/product-imgs/${litem.product.productImgs['0'].img} "
										width="50px" height="auto"></td>
									<td style='vertical-align: middle'><h4
											class="product-name">${litem.product.name }</h4></td>
									<td style='width: 20%; text-align: center; vertical-align: middle'>
										<a href="/WebBanKinh/cart.htm"" class="editLineItem">
											<input type="button"
											onclick="CheckQuantity('sub','${litem.product.id }', 'QuantityProduct${litem.product.id }',${litem.product.quantity })"
											name="sub" value="-"
											style="width: 25px; height: 30px; font-size: 16px; font-weight: 600; align-self: center">
										</a>
										<input type="text" class="quantity"
										id="QuantityProduct${litem.product.id }"
										value="${litem.quantity }" min="1" inputmode="text"
										style="max-width: 48px; text-align: center; height: 30px; font-size: 16px; border: 1px solid rgb(0 0 0/ 90%); align-self: center">
										<a href="/WebBanKinh/cart.htm" class="editLineItem">
											<input type="button"
											onclick="CheckQuantity('plus','${litem.product.id }','QuantityProduct${litem.product.id }',${litem.product.quantity })"
											name="plus" value="+"
											style="width: 25px; height: 30px; font-size: 16px; font-weight: 600; align-self: center">
										</a>
									</td>
									<td class="text-right" style='vertical-align: middle'>
									<input
										class="price" hidden
										value="${litem.product.price - litem.product.price*litem.product.discount}" />
										<h6>
											<fmt:formatNumber pattern="###,###,###  ₫"
												value="${litem.product.price - litem.product.price*litem.product.discount}"
												type="currency" groupingUsed="true" maxFractionDigits="0" />
										</h6></td>
									<td style='text-align: right; vertical-align: middle'>
										<a href="/WebBanKinh/cart/${litem.product.id}.htm?linkDetele" role="button">
											<button class="btn btn-sm btn-danger">
												<i class="fa fa-trash"></i>
											</button>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="panel-footer">
					<div class="row justify-content-center align-items-center">
						<div class="col-md-9">
							<h4 class="text-right">
								Thành Tiền: <strong class="total">$50.00</strong>
							</h4>
						</div>
						<form class="col-md-3" action="/WebBanKinh/cart.htm">
							<button type="submit" class="btn btn-success btn-block" name="comfirm">
								Đặt Hàng</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

<script type="text/javascript">
	

	function CheckQuantity(obj1, obj2, obj3, obj4) {
		var $$ = document.getElementById(obj3);
		var $$$ = document.querySelectorAll('.editLineItem');
		if (obj1 === "plus") {
			if (parseInt($$.value) < obj4) {
				$$.value = parseInt($$.value) + 1;
				for(i=0; i<$$$.length; i++){
					$$$[i].href = "/WebBanKinh/cart/"+obj2+"/"+$$.value.toString()+".htm?edit";
				}
			}
		}
		if (obj1 === "sub") {
			if (parseInt($$.value) > 1) {
				$$.value = parseInt($$.value) - 1;
				for(i=0; i<$$$.length; i++){
					$$$[i].href = "/WebBanKinh/cart/"+obj2+"/"+$$.value.toString()+".htm?edit";
				}
			}
		}
	}
	
	
</script>
<script>
		document.getElementById("btn1").onclick = function () {
		    document.getElementById("control-display1").style.display = 'none';
		    document.getElementById("control-display2").style.display = 'block';
		};
		
	function tinhTong() {
		var prices = document.querySelectorAll('.price');
		var quantities = document.querySelectorAll('.quantity');
		total = 0
		for (i = 0; i < quantities.length; i++) {
			total += Math.ceil(prices[i].value) * quantities[i].value
		}
		var formatter = new Intl.NumberFormat('vi-VN', {
			style : 'currency',
			currency : 'VND'
		});
	
		document.querySelector('.total').innerHTML = formatter.format(total);
	}
	
	tinhTong()
</script>



