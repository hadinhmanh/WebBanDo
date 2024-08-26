package model;

import java.text.NumberFormat;
import java.util.Locale;

public class SanPham {
	private String 	maSanPham;
	private String 	tenSanPham;
	private double 	giaNhap;
	private double 	giaGoc;
	private double 	giaBan;
	private int 	soLuong;
	private TheLoai theLoai;
	private String 	moTa;
	private String anh;
	public SanPham() {

	}

	public SanPham(String maSanPham, String tenSanPham, double giaNhap, double giaGoc,
			double giaBan, int soLuong, TheLoai theLoai, String moTa, String anh) {
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.giaNhap = giaNhap;
		this.giaGoc = giaGoc;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.theLoai = theLoai;
		this.moTa = moTa;
		this.anh = anh;
	}

	public String getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public double getGiaNhap() {
		return giaNhap;
	}

	public void setGiaNhap(double giaNhap) {
		this.giaNhap = giaNhap;
	}

	public double getGiaGoc() {
		return giaGoc;
	}

	public void setGiaGoc(double giaGoc) {
		this.giaGoc = giaGoc;
	}

	public String getGiaBanHienThi() {
		NumberFormat germanFormat = NumberFormat.getNumberInstance(Locale.GERMANY);
        String formattedNumberGermany = germanFormat.format(giaBan);
		return formattedNumberGermany;
	}
	
	
	public double getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(double giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public TheLoai getTheLoai() {
		return theLoai;
	}

	public void setTheLoai(TheLoai theLoai) {
		this.theLoai = theLoai;
	}


	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	@Override
	public String toString() {
		return "SanPham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", giaNhap=" + giaNhap + ", giaGoc="
				+ giaGoc + ", giaBan=" + giaBan + ", soLuong=" + soLuong + ", theLoai=" + theLoai + ", moTa=" + moTa
				+ "]";
	}

	
	
}
