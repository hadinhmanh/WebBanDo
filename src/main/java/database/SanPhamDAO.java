
package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.SanPham;
import model.TheLoai;

public class SanPhamDAO implements DAOinterface<SanPham> {

	@Override
	public ArrayList<SanPham> selectAll() {
		ArrayList<SanPham> ketQua = new ArrayList<SanPham>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM sanpham";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String masanpham = rs.getString("masanpham");
				String tensanpham = rs.getString("tensanpham");
				double gianhap = rs.getDouble("gianhap");
				double giagoc = rs.getDouble("giagoc");
				double giaban = rs.getDouble("giaban");
				int soluong = (int) rs.getDouble("soluong");
				String matheloai = rs.getString("matheloai");
				String mota = rs.getString("mota");
				String anh = rs.getString("anh");
				
				TheLoai theLoai = (new TheLoaiDAO().selectById(new TheLoai(matheloai, "")));

				SanPham sp = new SanPham(masanpham, tensanpham, gianhap, giagoc, giaban, soluong,
						theLoai, mota, anh);
				ketQua.add(sp);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public SanPham selectById(SanPham t) {

		SanPham ketQua = null;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM sanpham WHERE masanpham=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaSanPham());

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String masanpham = rs.getString("masanpham");
				String tensanpham = rs.getString("tensanpham");
				double gianhap = rs.getDouble("gianhap");
				double giagoc = rs.getDouble("giagoc");
				double giaban = rs.getDouble("giaban");
				int soluong = (int) rs.getDouble("soluong");
				String matheloai = rs.getString("matheloai");
				String mota = rs.getString("mota");
				String anh = rs.getString("anh");
				TheLoai theLoai = (new TheLoaiDAO().selectById(new TheLoai(matheloai, "")));

				ketQua = new SanPham(masanpham, tensanpham, gianhap, giagoc, giaban, soluong,
						theLoai, mota, anh);
				break;
			}

			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(SanPham t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO sanpham (masanpham,tensanpham,"
					+ " gianhap, giagoc, giaban, soluong, matheloai, mota) "
					+ " VALUES (?,?,?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaSanPham());
			st.setString(2, t.getTenSanPham());
			st.setDouble(3, t.getGiaNhap());
			st.setDouble(4, t.getGiaGoc());
			st.setDouble(5, t.getGiaBan());
			st.setInt(6, t.getSoLuong());
			st.setString(7, t.getTheLoai().getMaTheLoai());
			st.setString(8, t.getMoTa());

			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<SanPham> arr) {
		int dem = 0;
		for (SanPham SanPham : arr) {
			dem += this.insert(SanPham);
		}
		return dem;
	}

	@Override
	public int delete(SanPham t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from sanpham " + " WHERE masanpham=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaSanPham());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<SanPham> arr) {
		int dem = 0;
		for (SanPham SanPham : arr) {
			dem += this.delete(SanPham);
		}
		return dem;
	}

	@Override
	public int update(SanPham t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE sanpham " + " SET " + "tensanpham=?, gianhap=?, giagoc=?,"
					+ " giaban=?, soluong=?, matheloai=?, mota=?" + " WHERE masanpham=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getTenSanPham());
			st.setDouble(2, t.getGiaNhap());
			st.setDouble(3, t.getGiaGoc());
			st.setDouble(4, t.getGiaBan());
			st.setInt(5, t.getSoLuong());
			st.setString(6, t.getTheLoai().getMaTheLoai());
			st.setString(7, t.getMoTa());
			st.setString(8, t.getMaSanPham());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
	
	public ArrayList<SanPham> selectAllByMaTheLoai(String id) {
		ArrayList<SanPham> ketQua = new ArrayList<SanPham>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM sanpham WHERE matheloai=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String masanpham = rs.getString("masanpham");
				String tensanpham = rs.getString("tensanpham");
				double gianhap = rs.getDouble("gianhap");
				double giagoc = rs.getDouble("giagoc");
				double giaban = rs.getDouble("giaban");
				int soluong = (int) rs.getDouble("soluong");
				String matheloai = rs.getString("matheloai");
				String mota = rs.getString("mota");
				String anh	= rs.getString("anh");
				
				TheLoai theLoai = (new TheLoaiDAO().selectById(new TheLoai(matheloai, "")));

				SanPham sp = new SanPham(masanpham, tensanpham, gianhap, giagoc, giaban, soluong,
						theLoai, mota, anh);
				ketQua.add(sp);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
	
	public ArrayList<SanPham> searchByName(String name) {
		
		ArrayList<SanPham> ketQua = new ArrayList<SanPham>();
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM sanpham WHERE tensanpham like ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+name +"%");

			ResultSet rs = st.executeQuery();
			while (rs.next()) { 
				String masanpham = rs.getString("masanpham");
				String tensanpham = rs.getString("tensanpham");
				double gianhap = rs.getDouble("gianhap");
				double giagoc = rs.getDouble("giagoc");
				double giaban = rs.getDouble("giaban");
				int soluong = (int) rs.getDouble("soluong");
				String matheloai = rs.getString("matheloai");
				String mota = rs.getString("mota");
				String anh = rs.getString("anh");
				TheLoai theLoai = (new TheLoaiDAO().selectById(new TheLoai(matheloai, "")));

				SanPham sp = new SanPham(masanpham, tensanpham, gianhap, giagoc, giaban, soluong,
						theLoai, mota, anh);
				ketQua.add(sp);
			}

			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
	
}