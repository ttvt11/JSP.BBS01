<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">


<title>JSP 文作成ページ</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">掲示板書き方</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td><input type="text" class="form-control" placeholder="文 タイトル" name="bbsTitle" maxlength="50"> </td>
					</tr>
					<tr>
					<td><textarea class="form-control" placeholder="文の内容" name="bbsContent" maxlength="2048" style=" height: 350px;"></textarea> </td>
					</tr>
				</tbody>
			</table>
					<input type="submit" class="btn btn-primary pull-right" value="文作成">
		</form>
		</div>
 	</div>


</body>
</html>