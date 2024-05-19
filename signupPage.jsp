<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="signupAction.jsp">
        <input type="text" value="이름" name="name_value">
        <input type="text" value="아이디" name="id_value">
        <input type="text" value="비밀번호" name="pw_value">
        <%-- <input type="text" value="비밀번호 확인" name="pw_value"> --%>
        <input type="text" value="성별" name="gender_value">
        <input type="text" value="생년월일" name="birth_value">
        <input type="text" value="전화번호" name="tel_value">
        
        <input type="submit" value="회원가입">
    </form>

  

</body>
