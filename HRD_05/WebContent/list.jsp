<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
a {
	text-decoration:none;
}
</style>
<body>
	<h2 align="center">회원목록조회/수정</h2>
	<table align="center" border="1">
		<tr>
			<th width="70">회원번호</th>
			<th width="70">회원성명</th>
			<th>전화번호</th>
			<th width="300">주소</th>
			<th width="100">가입일자</th>
			<th width="100">고객등급</th>
			<th width="100">거주지역</th>
		</tr>																
	<%
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
		"jdbc:oracle:thin:@192.168.0.100:1521/xe",
		"user04", "user04");
	
	//전체 Data를 가져오는 SQL 생성
	PreparedStatement pstmt = con.prepareStatement("select * from member_tbl_02 order by custno");
	
	//select 구문 실행
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<td align='center'>"+
		"<a href='detail.jsp?custno=" + rs.getInt("custno") + " '>" +
			rs.getInt("custno") + "</a></td>");
		out.println("<td align='center'>" +
			rs.getString("custname") + "</td>");
		out.println("<td align='center'>" +
			rs.getString("phone") + "</td>");
		out.println("<td align='center'>" +
			rs.getString("address") + "</td>");
		out.println("<td align='center'>" +
			rs.getDate("joindate") + "</td>");
		
		//고객등급
		String grade = "";
		if(rs.getString("grade").equals("A"))
			grade = "VIP";
		else if(rs.getString("grade").equals("B"))
			grade = "일반";
		else if(rs.getString("grade").equals("C"))
			grade = "직원";
		out.println("<td align='center'>" + grade + "</td>");
		out.println("<td align='center'>" +
				rs.getString("city") + "</td>");
		out.println("</tr>");
		
	}
	rs.close();
	pstmt.close();
	con.close();
	%>
	</table>
</body>
</html>