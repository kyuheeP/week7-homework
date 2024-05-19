<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/user","stageus","1234");

    String sql = "SELECT * FROM user;";
    PreparedStatement query = connect.prepareStatement(sql);

    //데이터베이스로 옮기기
    ResultSet result = query.executeQuery();

    result.next(); //가져온 테이블에서 로우 1개를 읽어 (jsp문법이라는게 문제)
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action=".jsp">
        <input type="submit" value="내 정보수정">
    </form>
   
    <form action=".jsp">
        <input type="submit" value="회원탈퇴">
    </form>
   

    <%-- <%
        while(result.next()) {
    %> --%>
        <div>이름 :<%=result.getString(2) %> </div>
        <div>작성자id :<%=result.getString(3)%> </div>
        <div>날짜 :<%=result.getString(4)%> </div>
        <div>성별 :<%=result.getString(5)%> </div>
        <div>생년월일 :<%=result.getString(6)%> </div>
        <div>전화번호 :<%=result.getString(7)%> </div>

    <%-- <%
       }
    %> --%>
</body>
