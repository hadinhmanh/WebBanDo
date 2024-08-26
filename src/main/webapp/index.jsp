<%@page import="database.TheLoaiDAO"%>
<%@page import="java.awt.Desktop.Action"%>
<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@page import="model.KhachHang"%>
<%@page import="model.SanPham"%>
<%@page import="database.SanPhamDAO" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Website bán hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Navbar -->
		<jsp:include page="header.jsp"></jsp:include> <!-- Dùng này với những trang động -->
	<!-- End Navbar -->
	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
			<!-- Menu left -->
				<jsp:include page="menuleft.jsp"></jsp:include>
			<!-- End Menu left -->

			<!-- Slider and Products -->
			<div class="col-lg-9">
				<!-- Slider -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/slider/Slider1.png" class="d-block" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/Slider1.png" class="d-block" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/slider/Slider1.png" class="d-block" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->
				<!-- Products -->
			
				<div class="row">
				<d:forEach items="${listSP}" var="o">
				<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/slider/${o.getAnh()}"
								alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">${o.getTenSanPham()}</a>
								</h4>
								<h5>${o.getGiaBanHienThi()}đ</h5>
								<p class="card-text">${o.getMoTa()}</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
				</d:forEach>
				</div>
				<!-- End Products -->
			</div>
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->
	<!-- Footer -->
		<%@include file = "footer.jsp" %> <!-- Dùng này với những trang tĩnh -->
	<!-- End Footer -->
	
	
</body>
</html>