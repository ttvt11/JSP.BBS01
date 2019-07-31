<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ビューポート -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- スタイルシート参照  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 掲示板·ウェブサイト</title>
<style type="text/css">
		a, a:hover {
			color: #000000; /* 掲示物 黒 */
			text-decoration: none; /* 文の下線除去 */
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}

	%>
 <!-- アニメーション担当JQUERY -->
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <!-- ブートストラップ JS  -->
 <script src="js/bootstrap.js"></script>

 <!-- ネビゲーション  -->
 <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed"
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expaned="false">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="main.jsp">JSP ㅅㅌ掲示板</a>
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
      aria-expanded="false">会員管理<span class="caret"></span></a>
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
					<th style="background-color: #eeeeee; text-align: center;">番号</th>
					<th style="background-color: #eeeeee; text-align: center;">タイトル</th>
					<th style="background-color: #eeeeee; text-align: center;">作成者</th>
					<th style="background-color: #eeeeee; text-align: center;">作成日</th>
					</tr>
				</thead>
				<tbody>
<!-- 				<tr>
						<td>1</td>
						<td><a href="view.jsp">안녕하세요</a></td>
						<td>홍길동</td>
						<td>2017-05-04</td>
					</tr> -->
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getBbsID()%></td>
							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "時"
							+ list.get(i).getBbsDate().substring(14, 16) + "分"%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- ページ越え -->
				<%
					if (pageNumber != 1) {
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">以前</a>
				<%
					}
					if (bbsDAO.nextPage(pageNumber)) {
				%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">次へ</a>
				<%
					}
				%>

				<!-- 会員だけ越えて行くように -->
				<%
					//if logined userIDという変数に当該IDが詰めて if not null
					if (session.getAttribute("userID") != null) {
				%>
				<a href="write.jsp" class="btn btn-primary pull-right">文を書く</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('ログインしてください'))location.href='login.jsp';"
					type="button">文を書く</button>
				<%
					}
				%>
			</div>
		</div>

</body>
</html>