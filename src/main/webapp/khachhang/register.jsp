<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String tenDangNhap = request.getAttribute("tenDangNhap")+"";
		tenDangNhap = (tenDangNhap.equals("null"))?"":tenDangNhap;
		
		String hoVaTen = request.getAttribute("hoVaTen")+"";
		hoVaTen = (hoVaTen.equals("null"))?"":hoVaTen;
		
		String gioiTinh = request.getAttribute("gioiTinh")+"";
		gioiTinh = (gioiTinh.equals("null"))?"":gioiTinh;
		
		String ngaySinh = request.getAttribute("ngaySinh")+"";
		ngaySinh = (ngaySinh.equals("null"))?"":ngaySinh;
		
		
		String diaChi = request.getAttribute("diaChi")+"";
		diaChi = (diaChi.equals("null"))?"":diaChi;
		
		
		String dienThoai = request.getAttribute("dienThoai")+"";
		dienThoai = (dienThoai.equals("null"))?"":dienThoai;
		
		String email = request.getAttribute("email")+"";
		email = (email.equals("null"))?"":email;
		
		String dongYNhanMail = request.getAttribute("dongYNhanMail")+"";
		dongYNhanMail = (dongYNhanMail.equals("null"))?"":dongYNhanMail;
	%>
	<div class="container">
		<div class="text-center"><h1>ĐĂNG KÝ TÀI KHOẢN</h1></div>
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form action="../khach-hang" method="post">
		<input type="hidden" name="hanhDong" value="dang-ky">
			<div class="row">
				<div class="col">
					<h3>Tài Khoản</h3>
					<div class="mb-3">
						<label for="tenDangNhap" class="form-label">Tên đăng nhập<span class="red">*</span></label>
						<input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap" required="required" value=<%= tenDangNhap %>>
					</div>
					<div class="mb-3">
						<label for="matKhau" class="form-label">Mật khẩu <span class="red">*</span></label>
						<input type="password" class="form-control" id="matKhau" name="matKhau" required="required" onkeyup="kiemTraMatKhau()">
					</div>
					<div class="mb-3">
						 <label for="matKhauNhapLai" class="form-label">Nhập lại mật khẩu<span class="red" id="msg">*</span></label>
						 <input type="password" class="form-control" id="matKhauNhapLai" name="matKhauNhapLai" required="required" onkeyup="kiemTraMatKhau()">
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
						  <input type="text" class="form-control" id="diaChi" name="diaChi" value=<%= diaChi %>>
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
						  <input type="checkbox" class="form-check-input" id="dongYNhanMail" name="dongYNhanMail">
					</div>
				</div>
				<input class="btn btn-primary form-control" type="submit" value="Đăng ký">
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	function kiemTraMatKhau() {
		matKhau = document.getElementById("matKhau").value;
		matKhauNhapLai = document.getElementById("matKhauNhapLai").value;
		if(matKhau!=matKhauNhapLai){
			document.getElementById("msg").innerHTML = " Mật khẩu không khớp"
			return false;
		}else{
			document.getElementById("msg").innerHTML = ""
		}
	}
</script>
</html>