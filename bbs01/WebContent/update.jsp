<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 文修正ページ</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null){
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
		if (bbsID == 0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('有効でない文です。')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('権限がありません。')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
 		}
	%>
 <!-- アニメーション担当 JQUERY -->
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <!-- ブートストラップ JS  -->
 <script src="js/bootstrap.js"></script>


 <!-- 네비게이션  -->
 <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed"
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expaned="false">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="main.jsp">ソソ掲示板</a>
  </div>
  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   <ul class="nav navbar-nav">
    <li class="active"><a href="bbs.jsp" >掲示板</a></li>
   </ul>

   <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
      data-toggle="dropdown" role="button" aria-haspopup="true"
      aria-expanded="false">会員管理<span class="caret"></span></a>
     <ul class="dropdown-menu">
      <li><a href="logoutAction.jsp">ログアウト</a></li>
     </ul>
    </li>
   </ul>
  </div>
 </nav>
 	<div class="container">
		<div class="row">
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">掲示板修正様式</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td><input type="text" class="form-control" placeholder="文 タイトル" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"> </td>
					</tr>
					<tr>
					<td><textarea class="form-control" placeholder="文の内容" name="bbsContent" maxlength="2048" style=" height: 350px;"><%= bbs.getBbsContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
					<input type="submit" class="btn btn-primary pull-right" value="文修正">
		</form>
		</div>
 	</div>


</body>
</html>