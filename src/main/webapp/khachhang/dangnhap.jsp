<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
<section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="../img/slider/image.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="../khach-hang" method="post">
					<input type = "hidden" name="hanhDong" value="dang-nhap">
                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div data-mdb-input-init class="form-outline mb-4">
                  	<label class="form-label" for="form2Example17">Tên đăng nhập</label>
                    <input type="text" id="tenDangNhap" class="form-control form-control-lg" name="tenDangNhap"/>
                  </div>

                  <div data-mdb-input-init class="form-outline mb-4">
                  	<label class="form-label" for="form2Example27">Mật khẩu</label>
                    <input type="password" id="matKhau" class="form-control form-control-lg" name="matKhau"/>
                  </div>
					
					<%
						String baoLoi = request.getAttribute("baoLoi")+"";
                  		if(baoLoi.equals("null")){
                  			baoLoi="";
                  		}
					%>
					<div class="text-center"><span class="red"><%=baoLoi %></span></div>
                  <div class="pt-1 mb-4">
                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="submit">Đăng nhập</button>
                  </div>
					<div class="checkbox mb-3">
						<lable> <input type="checkbox" value="remember-me"/>Ghi nhớ tài khoản </lable>
						
					</div>
                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register.jsp"
                      style="color: #393f81;">Đăng ký tài khoản</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>