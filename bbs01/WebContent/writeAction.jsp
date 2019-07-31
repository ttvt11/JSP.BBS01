<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!--  userDAOのクラス持参 -->
<%@ page import="java.io.PrintWriter" %> <!-- ジャワクラス使用-->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 一人の会員情報を盛り込むuserクラスをジャワビーンズに使用/scope:ページ現在のページでのみ使用-->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp writeAciton</title>
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
			script.println("alert('ログインしてください。'.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			}

		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('入力されていない事項があります。.')");
				script.println("history.back()");
				script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO(); //インスタンス生成
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('作文に失敗しました。')");
			script.println("history.back()");
			script.println("</script>");
		}
		//ログイン失敗
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>
