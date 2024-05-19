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
 
 //값 받아오기
    request.setCharacterEncoding("utf-8"); //이거 안해주면 전 페이지가 준 한글 깨짐

    String idValue = request.getParameter("id_value");  
    // var로 하면 인식 안됨 이건 자바라. 자료형 붙여야함. 근본잇음 여기서 string은 var임
    String pwValue = request.getParameter("pw_value");
    ///위에서 받아온 값으로 데이터베이스 통신
    //insert문이 필요

//데이터베이스 통신 db 연결
    Class.forName("org.mariadb.jdbc.Driver"); //에러나면 톰캣 안켜져잇거나 마리아디비 없거나 커넥터 설치 안되어있거나
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/user","stageus","1234");

    // string
    // string

    String sql = "SELECT * FROM user WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
   

    //데이터베이스로 옮기기
   ResultSet result = query.executeQuery();
//   executeupdate는 int라 int 지원 안되는 Resultset 사용 못함
// 근데 executeQuery는 조회(select, show)를 위한 거라
// create, drop, insert, delete, update 할 때는 executeupdate를 사용해야함
%>
<%
   if(result.next()){
        if(pwValue.equals(result.getString("pw"))){
            session.setAttribute("user_idx", result.getString("user_idx"));
             %>
         <script>alert("로그인에 성공하였습니다")
         location.href="mainPage.jsp"</script>   
         <%--  response.sendRedirect("index.jsp"); --> 이건 jsp 태그
         html문법이랑 겹치는 부분이 있는데 같이 쓰면 jsp가 우선돼서 alert창이 안뜸 그래서 html문법인 location.href를 써주었다  --%>
            
      <%  }
        else {
            // 비밀번호가 일치하지 않는 경우
            %>
            <script>alert("비밀번호가 일치하지 않습니다")
            location.href="index.jsp" </script>
       <% }
   
   }
  else{
        // 아이디가 존재하지 않는 경우
        %>
        <script>alert("아이디가 존재하지 않습니다")
        location.href="index.jsp"</script>
   <% } 

   %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>아이디: <%=idValue%></p>

    <script>
        //console.log("<%=idValue%>") 
        //에러. 위에선 자료형이 스트링인데 내려오면 자료형이 무시된 상태로 옴 그래서 변수로 인식함 따라서 자료형 붙여줘야함""
        // alert("로그인에 성공하였습니다")
        //location.href="index.jsp"
    </script>
   

</body>







