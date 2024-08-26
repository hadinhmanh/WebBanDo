<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<style type="text/css">
		.red {
			color: red;
		}
	</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<%
		Object obj = session.getAttribute("khachhang");
		KhachHang kh = null;
		if(obj!=null){
			kh = (KhachHang)obj;
		}
		if(kh==null){%>
			<h1>Bạn chưa đăng nhập tài khoản vào hệ thống</h1>
		<%}else{
			
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String tenDangNhap = kh.getTenDangNhap();
		
		String hoVaTen = kh.getHoVaTen();
		
		String gioiTinh = kh.getGioiTinh();
		
		String ngaySinh = kh.getNgaySinh().toString();
		
		String diaChi = kh.getDiaChi();
		
		String diaChiNhanhang = kh.getDiaChiNhanHang();
		
		String dienThoai = kh.getSoDienThoai();
		
		String email = kh.getEmail();
		
		boolean dongYNhanMail = kh.isDangKyNhanBangTin();
	%>
	<div class="container">
		<div class="text-center mt-3"><h1>ĐỔI THÔNG TIN TÀI KHOẢN</h1></div>
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form action="../khach-hang" method="post">
		<input type="hidden" name="hanhDong" value="thay-doi-thong-tin">
			<div class="row">
				<div class="col">
					<h3>Tài Khoản</h3>
					<div class="mb-3">
						<label for="tenDangNhap" class="form-label">Tên đăng nhập<span class="red">*</span></label>
						<input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" required="required" value=<%= tenDangNhap %> disabled="disabled">
					</div>
					
					<h3>Thông tin khách hàng</h3>
					<div class="mb-3">
						 <label for="hoVaTen" class="form-label">Họ và tên<span class="red">*</span></label>
						 <input type="text" class="form-control" id="hoVaTen" placeholder="Nhập họ tên" name="hoVaTen" required="required" value="<%=hoVaTen%>">
					</div>
					<div class="mb-3">
						 <label for="gioiTinh" class="form-label">Giới tính</label>
						 <select class="form-control" id="gioiTinh" name="gioiTinh">
						  	<option></option>
						  	<option value="Nam" <%=(gioiTinh.equals("Nam"))?"selected='selected'":"" %>>Nam</option>
						  	<option value="Nữ"  <%=(gioiTinh.equals("Nữ"))?"selected='selected'":"" %>>Nữ</option>
						 </select>
					</div>
					<div class="mb-3">
					  	<label for="ngaySinh" class="form-label">Ngày sinh</label>
					  	<input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value=<%= ngaySinh %>>
					</div>
				</div>
				<div class="col">
					<h3>Địa chỉ</h3>
					<div class="mb-3">
						  <label for="diaChi" class="form-label">Địa chỉ</label>
						  <input type="text" class="form-control" id="diaChi" name="diaChi" value="<%=diaChi%>">
					</div>
					<div class="mb-3">
						  <label for="diaChiNhanHang" class="form-label">Địa chỉ nhận hàng</label>
						  <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanhang%>">
					</div>
					<div class="mb-3">
						  <label for="dienThoai" class="form-label">Điện thoại</label>
						  <input type="tel" class="form-control" id="dienThoai" name="dienThoai" value=<%= dienThoai %>>
					</div>
					<div class="mb-3">
						  <label for="email" class="form-label">Email</label>
						  <input type="text" class="form-control" id="email" name="email" value=<%=email%>>
					</div>
					<div class="mb-3">
						  <label for="dongYNhanMail" class="form-label">Đồng ý nhận Email</label>
						  <input type="checkbox" class="form-check-input" id="dongYNhanMail" name="dongYNhanMail" <%=dongYNhanMail?"checked":""%>>
					</div>
				</div>
				<input class="btn btn-primary form-control" type="submit" value="Lưu thông tin">
			</div>
		</form>
	</div>
	<%} %>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>