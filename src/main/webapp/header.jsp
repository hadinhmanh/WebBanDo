<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
	 %>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img style="width: 20%, height: auto"
				src="img/slider/Slider1.png"
				alt="Ảnh của tôi" height="24">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<%=url%>/home">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Combo
							giảm giá</a></li>
				</ul>
				<form action="search" method="get" class="d-flex" role="search">
					<input class="form-control me-2" type="search" name = "txtSearch"
						placeholder="Nội dung tìm kiếm" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Tìm</button>
					<%
						Object obj = session.getAttribute("khachhang");
						KhachHang khachHang= null;
						if(obj!=null){
							khachHang = (KhachHang)obj;
						}
						
						if(khachHang==null){%>
							<a class="btn btn-primary" style="white-space: nowrap;" href="khachhang/dangnhap.jsp">
								Đăng Nhập
							</a>
						<%}else{%>
						<!-- Example single danger button -->
						<div class="btn-group">
						  <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						    Xin chào <b><%=khachHang.getTenDangNhap()%></b>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
						    <li><a class="dropdown-item"  href="<%=url %>/khachhang/thaydoithongtin.jsp">Thay đổi thông tin</a></li>
						    <li><a class="dropdown-item" href="<%=url %>/khachhang/doimatkhau.jsp">Đổi mật khẩu</a></li>
						    <li><hr class="dropdown-divider"></li>
						    <li><a class="dropdown-item" href="<%=url %>/khach-hang?hanhDong=dang-xuat">Đăng xuất</a></li>
						  </ul>
						</div>
						<%}%>
					
				</form>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	
</body>
</html>