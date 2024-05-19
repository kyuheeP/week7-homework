<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/user","stageus","1234");

    String sql = "SELECT * FROM posting INNER JOIN user  ON posting.user_idx = user.user_idx;";
    PreparedStatement query = connect.prepareStatement(sql);

    //데이터베이스로 옮기기
    ResultSet result = query.executeQuery();

    // result.next();--->안해도됨 누란된 이유
     //가져온 테이블에서 로우 1개를 읽어 (jsp문법이라는게 문제)
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="myPage.jsp">
        <input type="submit" value="내 정보">
    </form>
   
    <form action=".jsp">
        <input type="submit" value="로그아웃">
    </form>
   
    <form action="writePage.jsp">
        <input type="submit" value="게시글 쓰기">
    </form>
    
    <%-- <form action="accountListPage.jsp">
        <input type="submit" value="이동하기">
    </form> --%>

    <%
        while(result.next()) {
    %>
        <a href="postingPage.jsp">게시글 제목 :<%=result.getString(3) %> / 작성자id :<%=result.getString(8)%> / 날짜 :<%=result.getString(5)  %></a>
    <%
       }
    %>
</body>
