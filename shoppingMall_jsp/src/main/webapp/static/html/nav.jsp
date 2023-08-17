<!-------------------------------
  annotation Name : nav.jsp
  User: SMH
  Date: 2023-08-16
  Time: 오후 9:04
 -------------------------------->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="category.Category"%>
<%@ page import="category.CategoryDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
//category 리스트 불러오기 
List<Category> categoryList = new ArrayList<>();
CategoryDAO categoryDAO = new CategoryDAO();
categoryList = categoryDAO.selectCategory();

/* 	//카테고리 리스트 출력테스트
	for(Category e : categoryList){
		System.out.println(e.getCtgID() + " " + e.getCtgName());
	} */
%>

<!DOCTYPE html>
<meta charset="UTF-8">
<nav>
	<ul class="navbar">
		<%
		for (int i = 0; i < categoryList.size(); i++) {
		%>
		<li><a
			href="../productList/productList.jsp?cthID=<%=categoryList.get(i).getCtgID()%>&ctgName=<%=categoryList.get(i).getCtgName()%>">
				<%=categoryList.get(i).getCtgName()%></a></li>
		<%
		}
		%>
	</ul>
	<hr>
</nav>
