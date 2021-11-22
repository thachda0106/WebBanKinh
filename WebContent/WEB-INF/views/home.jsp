<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- START: SLIDER -->
    <!-- Slider -->
    <section class="slider-section" style="margin-top:2px">
        <div id="carousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carousel" data-slide-to="1"></li>
            </ol> <!-- End of Indicators -->

            <!-- Carousel Content -->
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active"
                    style="background-image:
                    url('resources/imgs/slider-imgs/slider1.jpg');background-size: auto;">
                    <div class="carousel-caption d-none d-md-block">
                        <p> Clasical & Modern </p>
                        <p>Glasses style for everyone...</p>
                    </div>
                </div> <!-- End of Carousel Item -->

                <div class="carousel-item" style="background-image:
                    url('resources/imgs/slider-imgs/slider3.jpg');background-size: auto;">
                    <div class="carousel-caption d-none d-md-block">
                        <p> Clasical & Modern</p>
                        <p>Style for everyone...</p>
                    </div>
                </div> <!-- End of Carousel Item -->

            <!-- Previous & Next -->
            <a href="#carousel" class="carousel-control-prev"
                role="button" data-slide="prev">
                <span class="carousel-control-prev-icon"
                    aria-hidden="true"></span>
                <span class="sr-only"></span>
            </a>
            <a href="#carousel" class="carousel-control-next"
                role="button" data-slide="next">
                <span class="carousel-control-next-icon"
                    aria-hidden="true"></span>
                <span class="sr-only"></span>
            </a>
        </div> <!-- End of Carousel -->
        <a href="/products" class="read-now button-wallpr">
        </a>
    </section> <!-- End of Slider -->

    <!-- END: SLIDER -->


		<div class="section-title">
				<h1 class="ml-3 mr-3">mắt kính hàng hiệu - gọng kính cận - tròng kính chính hãng</h1>
		</div>
	<div class="list-products container-fluid">
		<div class="wrapper-items container">
		
			<c:forEach var="pd" items="${products}" >
				<div class="card">
					<div class="card-item">
						<a href="${pd.id}.htm"> <img class="card-img-top"
							src="resources/imgs/product-imgs/${pd.productImgs['0'].img}" width="100%"
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
		
		<div class="btn-home"> 
		<a href="products.htm"><button class="btn btn-info" style="font-size: 16px; font-weight: 600; background-color: var(--primary-color);"> Xem tất cả</button></a>
		</div>
	</div>


<%@include file="/WEB-INF/views/include/footer.jsp" %>