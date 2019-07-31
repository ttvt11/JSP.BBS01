<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %> <!-- userDAOのクラス持参 -->
<%@ page import="bbs.Bbs" %> <!-- Bbsのクラス持参 -->
<%@ page import="java.io.PrintWriter" %> <!-- ジャワクラス使用 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp updateAction</title>
</head>
<body>
	<%

			String userID = null;
			if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은
				userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
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
		if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals(""))  {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('入力されていない事項があります。.')");
				script.println("history.back()");
				script.println("</script>");

		} else {
			BbsDAO bbsDAO = new BbsDAO(); //インスタンス生成
			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));

			if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('文の修正に失敗しました.')");
			script.println("history.back()");
			script.println("</script>");

		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
			}
		}
	}
	%>
</body>
</html>
