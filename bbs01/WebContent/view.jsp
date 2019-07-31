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


<title>JSP 掲示板ページ</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('有効でない文です.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);

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

   <%
		if(userID == null){
   %>
   <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
      data-toggle="dropdown" role="button" aria-haspopup="true"
      aria-expanded="false">接続する<span class="caret"></span></a>
     <ul class="dropdown-menu">
      <li><a href="login.jsp">ログイン</a></li>
      <li><a href="join.jsp">会員登録</a></li>
     </ul>
    </li>
   </ul>
	<%
		} else {
	%>
   <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
      data-toggle="dropdown" role="button" aria-haspopup="true"
      aria-expanded="false">会員登録<span class="caret"></span></a>
     <ul class="dropdown-menu">
      <li><a href="logoutAction.jsp">ログアウト</a></li>
     </ul>
    </li>
   </ul>
	<%
		}
	%>
  </div>
 </nav>
 	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">掲示板の文書表示</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">文 タイトル</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td> <!-- 특수문자 보안중요 특수문자 지정안할지 스크립트 바이러스침투가능 -->
					</tr>
					<tr>
						<td>作成者</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>作成日付</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "時"
						+ bbs.getBbsDate().substring(14, 16) + "分" %> </td>
					</tr>
					<tr>
						<td>内容</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>
					</tr>
				</tbody>
			</table>
				<a href ="bbs.jsp" class= btn btn-primary">目録</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<a href= "update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">修整</a>
					<a onclick="return confirm('本当に削除しますか?')" href= "deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">削除</a>
					<a onclick="return confirm('本当に削除しますか?')" href= "realdeleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">real削除</a>
				<%
					}
				%>

		</div>
 	</div>


</body>
</html>