<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="loginAction.jsp">
        <input type="text" name="id_value">
        <input type="text" name="pw_value">
        <input type="submit" value="로그인">
    </form>
    <%-- 회원가입 --%>ㄴ
    <form action="signupPage.jsp">
        <input type="submit" value="회원가입">
    </form>
    <%-- 아이디,비번찾기 --%>
    <form action="findIDPW.jsp">
        <input type="submit" value="아이디, 비번 찾기">
    </form>
    <%-- 회원가입이랑 아이디비번찾기는 값을 가지고 갈게 없음 따라서 a 써도 ㅇ --%>
    
  
    
    
    
    
    <%-- <form action="">
        <input type="text" name="head_value">
        <input type="text" name="content_value">
        <input type="submit" value="글 작성하기">
    </form>

    <form action="">
        <input type="text" name="reply_value">
        <input type="submit" value="댓글 달기">
    </form>

    <form action="accountListPage.jsp">
        <input type="submit" value="이동하기">
    </form> --%>

</body>
