<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tag"%><%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<div class = "shop-tittle"> 
	<img alt="" src="https://theme.hstatic.net/1000392226/1000521831/14/slideshow_5.jpg?v=4329" width="100%" height="auto">
</div>
<div class="wrapper" style="background-color: #f8f8f8"> 
	<nav class="bread-crumbs mt-2">
			<a href="/WebsiteBanKinh/home.htm"> <i class="fas fa-home mr-1"></i> Trang chủ </a>
			<span class="divider" style="font-weight: bold;"><i class="fas fa-chevron-right ml-2" style="font-size: 12px"></i> Sản phẩm</span>
	</nav>
	<hr style="margin-bottom:0px;margin-left:30px; margin-right:30px;">
</div>
<div id="main">
		<div class="container orderby-container pt-4 pl-4 pr-4">
				<div style="margin-left: 30px;">
						<div class="form-check form-check-inline">
					  <input class="form-check-input" onclick="FilterChecked(this)" type="checkbox" id="CheckboxDiscount" value="discount" ${stt == 'discount'? 'checked':''} >
					  <label class="form-check-label" for="CheckboxDiscount">Khuyến mãi</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" onclick="FilterChecked(this)" type="checkbox" id="CheckboxSpecial" value="special" ${stt == 'special'? 'checked':''}>
					  <label class="form-check-label" for="inlineCheckbox2">Sản phẩm nổi bật</label>
					</div>		
				</div>
				<div style="margin-right: 35px;">
				<span> Hiển thị 1–12 của ${count} kết quả </span>
					<select class="form-select" onchange="FilterChanged(this)">
					  <option value="default" ${stt == 'default'? 'selected':''}>Thứ tự mặc định</option>
					  <option value="new" ${stt == 'new'? 'selected':''}>Mới nhất</option>
					  <option value="asc" ${stt == 'asc'? 'selected':''}>Giá từ thấp đến cao</option>
					  <option value="desc" ${stt == 'desc'? 'selected':''}>Giá từ cao đến thấp</option>
					</select>			
				</div>
	
		</div>	


	<div class="list-products container-fluid">
		    <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder" />
			<c:url value="products.htm?${filter}" var="pagedLink">
				<c:param name="p" value="~" />
			</c:url>
		<div class="wrapper-items container">
		
			<c:forEach var="pd" items="${pagedListHolder.pageList}">
				<div class="card">
					<div class="card-item">
						<a href="${pd.id}.htm"> <img class="card-img-top" src="resources/imgs/product-imgs/${pd.productImgs['0'].img}" width="100%" height="auto" alt="Card image cap">
						</a>
						<div class="card-btn">
							<a href="${pd.id}.htm">Xem sản phẩm</a>
						</div>
					</div>
					<div class="card-body mt-4">
						<h5 class="card-title text-truncate">${pd.name}</h5>
						<p class="card-price">
						<c:if test="${pd.discount > 0 }">
						<span style="text-decoration: line-through;"><fmt:formatNumber pattern="###,###,### đ" value="${pd.price}" type="currency" groupingUsed="true" maxFractionDigits="0" /></span>
						</c:if>
						<span style="color: var(--primary-color);"><fmt:formatNumber pattern="###,###,### đ" value="${pd.price - pd.price*pd.discount}" type="currency" groupingUsed="true" maxFractionDigits="0" /></span>				
						</p>
					</div>
				</div>

			</c:forEach>
			
			
		</div>
		
		<div class="pagination">
					<tag:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
					
		</div>
	</div>
</div>




<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
	
	function FilterChanged(obj){
		var $ = obj.value;
		if($ === 'default') {
			window.location = "products.htm";
		}
		else if($ === 'new') {
			window.location = "products.htm?new";
		}
		else if($ === 'asc') {
			window.location = "products.htm?asc";
		}
		else if($ === 'desc') {
			window.location = "products.htm?desc";
		}
	}
	
	 function FilterChecked(obj){
		 if(obj.value === 'discount'){
			 window.location = "products.htm?discount";
		 }
		 else if(obj.value === 'special'){
			 window.location = "products.htm?special";
		 }
		 
	 }
</script>