<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- userDAOのクラス持参 -->
<%@ page import="java.io.PrintWriter" %> <!--  ジャワクラス使用 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 一人の会員情報を盛り込むuserクラスをジャワビーンズに使用/scope:ページ現在のページでのみ使用-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp joinAction</title>
</head>
<body>
	<%
			String userID = null;
			if(session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('すでにログインされています.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			}

		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null
		|| user.getUserEmail() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('入力されていない事項があります。.')");
				script.println("history.back()");
				script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO(); //インスタンス生成
			int result = userDAO.join(user);
			//データベースエラー
			if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('既に存在するIDです.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//ログイン失敗
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>
