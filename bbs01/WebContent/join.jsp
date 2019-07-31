<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JSP 会員登録ページ</title>
</head>
<body>
 <!-- アニメーション担当 JQUERY -->
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
    <a class="navbar-brand" href="main.jsp">ソソ掲示板</a>
  </div>
  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   <ul class="nav navbar-nav">
    <li><a href="main.jsp">メーン</a></li>
    <li><a href="bbs.jsp">掲示板</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
     <a href="#" class="dropdown-toggle"
      data-toggle="dropdown" role="button" aria-haspopup="true"
      aria-expanded="false">接続する<span class="caret"></span></a>
     <ul class="dropdown-menu">
      <li><a href="login.jsp">ログイン</a></li>
      <li class="active"><a href="join.jsp">会員登録</a></li>
     </ul>
    </li>
   </ul>
  </div>
 </nav>
 <!-- ログインフォーム -->
 <div class="container">
  <div class="col-lg-4"></div>
  <div class="col-lg-4">
  <!-- ジャンボトロン -->
   <div class="jumbotron" style="padding-top: 20px;">
   <!-- ログイン情報を隠しながら伝送post -->
   <form method="post" action="joinAction.jsp">
    <h3 style="text-align: center;"> 会員加入画面 </h3>
    <div class="form-group">
     <input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
    </div>
    <div class="form-group">
     <input type="password" class="form-control" placeholder="PASSWORD" name="userPassword" maxlength="20">
    </div>
    <div class="form-group">
     <input type="text" class="form-control" placeholder="名前" name="userName" maxlength="20">
    </div>
    <div class="form-group" style="text-align: center;">
		<div class="btn-group" data-toggle="buttons">
			<label class= "btn btn-primory active">
				<input type="radio" name="userGender" autocomplete="off" value="男" checked>男子
			</label>
			<label class= "btn btn-primory">
				<input type="radio" name="userGender" autocomplete="off" value="女" checked>女子
			</label>
		</div>
    </div>
    <div class="form-group">
     <input type="email" class="form-control" placeholder="イーメール" name="userEmail" maxlength="20">
    </div>
    <input type="submit" class="btn btn-primary form-control" value="会員登録">
   </form>
  </div>
 </div>
</div>

</body>
</html>