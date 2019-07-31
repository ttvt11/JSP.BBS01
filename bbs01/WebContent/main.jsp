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

<title>JSPソソ掲示板 </title>
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
    <li class="active"><a href="main.jsp" >メーン</a></li>
    <li><a href="bbs.jsp">掲示板</a></li>
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
		<div class="jumbotron">
			<div class="container">
				<h1>JSP Web Site</h1>
				<p>このウェブサイトは,ブートストラップで作ったJSP Web サイトです。 最小限の簡単なロジックだけを利用して開発しました。 デザインテンプレートではブートストラップを利用しました。</p>
				<p><a class="btn btn-pramary btn-pull" href="#" role="button">詳しく調べる</a></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/6.jpg">
				</div>
				<div class="item">
					<img src="images/7.jpg">
				</div>
				<div class="item">
					<img src="images/10.jpg">
				</div>
				<div class="item">
					<img src="images/4.jpg">
				</div>
				<div class="item">
					<img src="images/5.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

<br><br><br>

<p>감사합니다</p>
</body>
</html>