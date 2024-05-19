<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %> 
<%-- 데이터베이스 탐색 라이브러리 --%>

<%@ page import="java.sql.Connection" %>
<%-- 데이터베이스 연결 라이브러리 --%>

<%@ page import="java.sql.PreparedStatement" %>
<%-- 데이터베ㅣㅇ스 sql전송 라이브러리 --%>

<%@ page import="java.sql.ResultSet" %>
<%-- 데이터베이스 값 받아오기 라이브러리 --%>

<%
 //jsp 문법 적는 공간
 


//데이터베이스 통신 db 연결
    Class.forName("org.mariadb.jdbc.Driver"); //에러나면 톰캣 안켜져잇거나 마리아디비 없거나 커넥터 설치 안되어있거나
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
    <%
        while(result.next()) {
    %>
    <%-- 여기는 html영역 쉽게 말해 jsp의 반복문의 내용으로 html tag를 넣어줄 수 있음 --%>
        <div>아이디 : <%=result.getString(3) %> / 비밀번호 :<%=result.getString(4) %></div>
    <%
       }
    %>
   

</body>
