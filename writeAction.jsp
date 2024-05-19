<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.sql.Date" %>
<%@ page import= "java.time.LocalDate" %>

<%
    request.setCharacterEncoding("utf-8"); 
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/user","stageus","1234");
    String headValue = request.getParameter("head_value");  
    String contentValue = request.getParameter("content_value");
    // 현재 날짜를 가져오기
    LocalDate currentDate = LocalDate.now();

    // 현재 날짜를 'YYYY-MM-DD' 형식으로 포맷팅
    String formattedDate = currentDate.toString();


// // 사용자 ID를 세션에서 가져와서 해당 ID에 대한 'user_idx' 값을 데이터베이스에서 조회하여 사용
//     String idValue = request.getParameter("id_value"); 
//     String sql = "SELECT * FROM user WHERE id = ?;";
//     PreparedStatement query = connect.prepareStatement(sql);
//     query.setString(1, idValue);
    
//     ResultSet result = query.executeQuery();
//     if (result.next()) {
//     session.setAttribute("user_idx", result.getString("user_idx"));
//     } else {
//     // 결과 집합에 행이 없는 경우 예외 처리 또는 로직 처리
//     }
//     // session.setAttribute("user_idx", result.getString("user_idx"));
    
//     // Class.forName("org.mariadb.jdbc.Driver");
//     // Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/user","stageus","1234");
    String user_idx = (String) session.getAttribute("user_idx");
    //원인찾아서

    String sql = "INSERT INTO posting(post_head, post_content, post_date, user_idx) VALUES(?, ?, ?, ?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, headValue);
    query.setString(2, contentValue);
    query.setString(3, formattedDate);
    query.setString(4, user_idx);

    query.executeUpdate();

%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

    <script>
        
        alert("게시글 작성에 성공하였습니다")
        location.href="postingPage.jsp"
    </script>
   

</body>