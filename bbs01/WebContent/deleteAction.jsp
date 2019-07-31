<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- userDAOのクラス持参 -->
<%@ page import="bbs.Bbs" %> <!-- 掲示板クラス使用 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자ジャワクラス使用 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp deleteAction</title>
</head>
<body>
	<%

			String userID = null;
			if (session.getAttribute("userID") != null) {  //ユーザーIDでセッションが存在する会員たちは
				userID = (String) session.getAttribute("userID");  //ユーザーIDに当該セッション値を入れておく。.
			}
			if (userID == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('ログインしてください。.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}

			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if (bbsID == 0 ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('有効でない文です.')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}

			Bbs bbs = new BbsDAO().getBbs(bbsID);
			if (!userID.equals(bbs.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('権限がありません。.')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
	 	} else {
				BbsDAO bbsDAO = new BbsDAO(); //インスタンス生成
				int result = bbsDAO.delete(bbsID);
				if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('文の削除に失敗しました.')");
				script.println("history.back()");
				script.println("</script>");
				} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
				}
	}
	%>
</body>
</html>
