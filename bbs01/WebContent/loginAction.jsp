<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="user.UserDAO" %><!-- userDAOのクラス持参 -->
    <%@ page import ="java.io.PrintWriter" %> <!-- ジャワクラス使用 -->
    <% request.setCharacterEncoding("UTF-8"); %>
    <!-- 一人の会員情報を盛り込むuserクラスをジャワビーンズに使用/scope:ページ現在のページでのみ使用-->
    <jsp:useBean id="user" class="user.User" scope="page"/>
	<jsp:setProperty property="userID" name="user"/>
	<jsp:setProperty property="userPassword" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP loginAction</title>
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

			UserDAO userDAO = new UserDAO(); //インスタンス生成
			int result = userDAO.login(user.getUserID(), user.getUserPassword());
			//ログイン成功
			if(result == 1){
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		//ログイン失敗
		else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('暗証番号が違います。.')");
			script.println("history.back()");
			script.println("</script>");
		}

		//IDなし
		else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('存在しないIDです.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//データベースエラー
		else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DBエラーが発生しました。')");
			script.println("history.back()");
			script.println("</script>");
			}
	%>

</body>
</html>