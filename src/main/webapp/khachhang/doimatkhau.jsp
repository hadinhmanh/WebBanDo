<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<%
		Object obj = session.getAttribute("khachhang");
		KhachHang khachHang= null;
		if(obj!=null){
			khachHang = (KhachHang)obj;
		}
			if(khachHang==null){			
	%>
				<h1>Bạn chưa đăng nhập vào hệ thống, Vui lòng quay lại trang chủ</h1>
	<%
			}else{
				String baoLoi = request.getAttribute("baoLoi")+"";
				if(baoLoi.equals("null")){
					baoLoi = "";
				}
			
	%>
	<div class="container">
	<h1 class="text-center mt-4">ĐỔI MẬT KHẨU</h1>
		<form action="../khach-hang" method="post">
		<input type="hidden" name="hanhDong" value="doi-mat-khau">
		  <div class="mb-3">
		    <label for="matKhauHienTai" class="form-label">Mật khẩu hiện tại</label>
		    <input type="password" class="form-control" id="matKhauHienTai" name="matKhauHienTai">
		    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
		  </div>
		  <div class="mb-3">
		    <label for="matKhauMoi" class="form-label">Mật khẩu mới</label>
		    <input type="password" class="form-control" id="matKhauMoi" name="matKhauMoi">
		  </div>
		  <div class="mb-3">
		    <label for="matKhauMoiNhapLai" class="form-label">Nhập lại mật khẩu mới</label>
		    <input type="password" class="form-control" id="matKhauMoiNhapLai" name="matKhauMoiNhapLai">
		    <label style="color:red"><%=baoLoi %></label>
		  </div>
	  	  <button type="submit" class="btn btn-primary">Lưu mật khẩu</button>
	  	  <a class="btn btn-primary" href="index.jsp">Quay lại trang chủ</a>
		</form>
	</div>
	
	<%} %>
	<jsp:include page="../footer.jsp" />
</body>
</html>