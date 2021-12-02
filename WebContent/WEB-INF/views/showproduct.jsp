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

<div class="wrapper-show row">
	<div class="col-5 card-items ">
		<div class="slider-imgs">
			<c:forEach var="i" items="${imgs}">
				<img class = "product-img" onclick="ChangedImg(this)" alt="${product.name }"
					src="/WebBanKinh/resources/imgs/product-imgs/${i.img}" width="50px" height="auto">
			</c:forEach>
		</div>
		<div class="col imgs-show ml-4">
			<img id="show-productimg" alt="Sản phẩm" src="/WebBanKinh/resources/imgs/product-imgs/${imgs['0'].img}" width="600px" height="auto" >
		</div>
	</div>
	<div class="card-items col-4" style="flex-direction: column;">
		<div class="slider-imgs mb-3">
			<h5 class="card-title mb-4" style="color: #271111;font-size:30px;font-weight: 600;">${product.name}</h5>
			<p>
			<c:if test="${product.discount > 0 }">
				<span style="text-decoration: line-through; font-size: 14px;"><fmt:formatNumber pattern="###,###,### đ" value="${product.price}" type="currency" groupingUsed="true" maxFractionDigits="0" /></span>
			</c:if>
			<span style="color: var(--primary-color); font-size: 20px; font-weight: 600;"><fmt:formatNumber pattern="###,###,### đ" value="${product.price - product.price*product.discount}" type="currency" groupingUsed="true" maxFractionDigits="0" /></span>				 
			 </p>
			
			<p style="font-size: 16px; margin-top: 5px;" >Mô tả: ${product.description}</p>
		</div>
		<div class="btn-orders">	
			<div class="btn-quantity" style="display: flex;"> 
				<input type="button" onclick="CheckQuantity(this)" name="sub" value="-" style="width: 25px;height: 30px;font-size: 16px; font-weight: 600; align-self: center" > 
				<input type="text" id="QuantityProduct"  value="1" min="1" inputmode="text" style="max-width: 48px; text-align: center; height: 30px; font-size: 16px; border: 1px solid rgb(0 0 0/ 90%);align-self: center">
				<input type="button" onclick="CheckQuantity(this)" name="plus" value="+" style="width: 25px;height: 30px;font-size: 16px; font-weight: 600;align-self: center" >  			
				<a href="/order?id=${product.id}&quantity=1" id="LinkOrder"><button class="btn bt-info ml-4" style="font-size: 16px; font-weight: 600; background-color: var(--primary-color); color: #fff;"> <i class="fab fa-shopify"></i> Thêm vào giỏ hàng</button></a>
			</div>		
		</div>
		
	</div>
	

	
</div>


<div style="background-color: #f6f6f6">
		<div class="section-title" style="margin-top: unset;">
				<h1 class="ml-3 mr-3">SẢN PHẨM LIÊN QUAN</h1>
		</div>
	<div class="list-products container-fluid" style="margin-bottom: unset">
		<div class="wrapper-items container">
		
			<c:forEach var="pd" items="${list}" >
				<div class="card">
					<div class="card-item">
						<a href="${pd.id}.htm"> <img class="card-img-top"
							src="/WebBanKinh/resources/imgs/product-imgs/${pd.productImgs['0'].img}" width="100%"
							height="auto" alt="Card image cap">
						</a>
						<div class="card-btn">
							<a href="${pd.id}.htm">Xem sản phẩm</a>
						</div>
					</div>
					<div class="card-body mt-4">
						<h5 class="card-title text-truncate ">${pd.name}</h5>
						<p class="card-price">
						<span style="text-decoration: line-through;"><fmt:formatNumber pattern="###,###,### đ"  value="${pd.price}"  type="currency" groupingUsed = "true" maxFractionDigits = "0"/></span>
						<span style="color: red;"><fmt:formatNumber pattern="###,###,### đ"  value="${pd.price - pd.price*pd.discount}"  type="currency" groupingUsed = "true" maxFractionDigits = "0"/></span>
						
						</p>
					</div>
				</div>

			</c:forEach>		
		</div>
	</div>

</div>



<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
	var $ = document.getElementById("show-productimg");
	var $$ = document.getElementById("QuantityProduct");
	var $$$ = document.getElementById("LinkOrder");
	function ChangedImg(obj){
		$.setAttribute("src", obj.src);
	}
	
	function CheckQuantity (obj){
		if(obj.name === "plus"){
			$$.value = parseInt($$.value) + 1;
			$$$.href = "cart/order?id=${product.id}&quantity=" + $$.value.toString();
		}
		if(obj.name === "sub" ){
			if(parseInt($$.value) > 1) {
				$$.value = parseInt($$.value) - 1;
				$$$.href = "cart/order?id=${product.id}&quantity=" + $$.value.toString();
			}
		}
	}
</script>
