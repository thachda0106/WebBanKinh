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

	<div class = "container-fluid" style="height: 1000px; width: 100%; background-color: aqua;"> 
		<h1> Content for the home page! </h1>
	</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>