package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.KhachHangDAO;
import model.KhachHang;
import util.MaHoa;

/**
 * Servlet implementation class KhachHang
 */
@WebServlet("/khach-hang")
public class KhachHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/HTML; charset=UTF-8");
		String hanhDong = request.getParameter("hanhDong");
		if(hanhDong.equals("dang-nhap")){
			dangNhap(request, response);
		}else if(hanhDong.equals("dang-xuat")) {
			dangXuat(request, response);
		}else if(hanhDong.equals("dang-ky")) {
			dangKy(request, response);
		}else if(hanhDong.equals("doi-mat-khau")) {
			doiMatKhau(request, response);
		}else if(hanhDong.equals("thay-doi-thong-tin")) {
			thayDoiThongTin(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/HTML; charset=UTF-8");
			
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			matKhau = MaHoa.toSHA1(matKhau);
			
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			KhachHang kh = new KhachHang();
			kh.setTenDangNhap(tenDangNhap);
			kh.setMatKhau(matKhau);
			
			String url="";
			
			KhachHang khachhang = khachHangDAO.selectTenDangNhapAndPassWord(kh);
			if(khachhang!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("khachhang", khachhang);
				url="/index.jsp";
			}else {
				request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng");
				url ="/khachhang/dangnhap.jsp";
			}
			HomeController homeController = new HomeController();
			homeController.processRequest(request, response);
			//RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			//rd.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			
			//Hủy bỏ Session
			session.invalidate();
			
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dangKy(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/HTML; charset=UTF-8");
			
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			String matKhauNhapLai = request.getParameter("matKhauNhapLai");
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String diaChi = request.getParameter("diaChi");
			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String dongYNhanMail = request.getParameter("dongYNhanMail");
			
			request.setAttribute("tenDangNhap", tenDangNhap);
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("dienThoai", dienThoai);
			request.setAttribute("email", email);
			request.setAttribute("dongYNhanMail", dongYNhanMail);
			
			String url="";
			//Xử lý tên đăng nhập đã tồn tại
			String baoLoi = "";
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			if(khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
				baoLoi +="Tên đăng nhập đã tồn tại.<br/>";
			}
			
			if(!matKhau.equals(matKhauNhapLai)) {
				baoLoi +="Mật khẩu không khớp.<br/>";
			}else {
				matKhau = MaHoa.toSHA1(matKhau);
			}
			
			request.setAttribute("baoLoi", baoLoi);
			int count = 0;
			
			if(baoLoi.length()>0) {
				url= "/khachhang/register.jsp";
			}else {
				Random rd = new Random();
				String maKhachHang = System.currentTimeMillis()+rd.nextInt()+"";
				KhachHang khachHang = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen,
						gioiTinh, diaChi, diaChi, diaChi, Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail!=null);
				khachHangDAO.insert(khachHang);
				url = "/khachhang/thanhcong.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		try {
			String matKhauHienTai = request.getParameter("matKhauHienTai");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai");
			
			String matKhauHienTai_Sha1 = MaHoa.toSHA1(matKhauHienTai);
			
			String baoLoi = "";
			String url = "/khachhang/doimatkhau.jsp";
			
			// Kiem tra mat khau cu co giong hay khong
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("khachhang");
			KhachHang khachHang = null;
			if (obj!=null)
				khachHang = (KhachHang)obj;		
			if(khachHang==null) {
				baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
			}else {
				// Neu khach hang da dang nhap
				if(!matKhauHienTai_Sha1.equals(khachHang.getMatKhau())){
					baoLoi = "Mật khẩu hiện tại không chính xác!";
				}else {
					if(!matKhauMoi.equals(matKhauMoiNhapLai)) {
						baoLoi = "Mật khẩu nhập lại không khớp!";
					}else {
						String matKhauMoi_Sha1 = MaHoa.toSHA1(matKhauMoi);
						khachHang.setMatKhau(matKhauMoi_Sha1);
						KhachHangDAO khd = new KhachHangDAO();
						if(khd.changePassWord(khachHang)) {
							baoLoi = "Mật khẩu đã thay đổi thành công!";
						}else {
							baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
						}
					}
				}
			}
			
			request.setAttribute("baoLoi", baoLoi);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/HTML; charset=UTF-8");
			
			
			String hoVaTen = request.getParameter("hoVaTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String ngaySinh = request.getParameter("ngaySinh");
			String diaChi = request.getParameter("diaChi");
			String diaChiNhanHang = request.getParameter("diaChiNhanHang");
			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String dongYNhanMail = request.getParameter("dongYNhanMail");
			
			
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("gioiTinh", gioiTinh);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("dienThoai", dienThoai);
			request.setAttribute("email", email);
			request.setAttribute("dongYNhanMail", dongYNhanMail);
			
			String url="";
			
			//Xử lý tên đăng nhập đã tồn tại
			String baoLoi = "";
			KhachHangDAO khachHangDAO = new KhachHangDAO();
			
			request.setAttribute("baoLoi", baoLoi);
			
			if(baoLoi.length()>0) {
				url= "/khachhang/register.jsp";
			}else {
				Object obj = request.getSession().getAttribute("khachhang");
				KhachHang kh = null;
				if(obj!=null) {
					kh = (KhachHang)obj;
					String maKhachHang = kh.getMaKhachHang();
					KhachHang khachHang = new KhachHang(maKhachHang,"", "", hoVaTen,
							gioiTinh, diaChi, diaChiNhanHang, diaChi, Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail!=null);
					khachHangDAO.UpdateInfo(khachHang);
					KhachHang kh2 = khachHangDAO.selectById(kh);
					request.getSession().setAttribute("khachhang", kh2);
					url = "/index.jsp";
				}
				
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
