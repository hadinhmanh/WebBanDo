<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="database.TheLoaiDAO" %>
<%@page import="model.TheLoai"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		TheLoaiDAO theLoaiDAO = new TheLoaiDAO();
		List<TheLoai> listTL = new ArrayList<>();
		listTL = theLoaiDAO.selectAll();
		String id = request.getAttribute("cid")+"";
	%>
	<div class="col-lg-3">
		<div class="list-group ">
		<%for(TheLoai item : listTL){ %>
			<a href="danhmuc?cid=<%=item.getMaTheLoai()%>" class="list-group-item list-group-item-action <%=item.getMaTheLoai().equals(id) ? "active" : ""%>"><%=item.getTenTheLoai() %></a> 
		<%} %>
		</div>
	</div>
</body>
</html>