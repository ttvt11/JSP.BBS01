package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	// dao : データベースへのアクセス客体の弱者として
	// 実質的にdbで会員情報を読み込んだり,dbに会員情報を入れたりするとき
	private Connection conn; //DBに近づける客体
	private PreparedStatement pstmt;
	private ResultSet rs;

	//mysqlに接続してくれる部分
	public UserDAO() { // 生成者 実行されるたびに自動でdb接続ができるようにする。

		try {
			String dbURL ="jdbc:mysql://35.244.58.76/test";
			String dbID ="root";
			String dbPassword = "kimschool1";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//ログインを試みる関数
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER  where userID = ?";
		try {
			// pstmt : prepared statement 決められたsql文章をdb に挿入する形式でインスタンスになってくる
			pstmt = conn.prepareStatement(SQL);
			// sqlインジェクションのようなハッキング技法を防御すること... pstmtを使って一つの文章をあらかじめ準備して
			// ?に該当する内容をユーザーIDで,媒介変数で利用。 1)存在するか2)の秘密番号何か
			pstmt.setString(1, userID);
			// rs:result set に結果保管
			rs = pstmt.executeQuery();
			// 結果が存在すれば実行
			if(rs.next()) {
				// パスワードが一致すれば実行
				if(rs.getString(1).equals(userPassword)) {
					return 1; //ログイン成功
				} else
					return 0; //暗証番号不一致

			}
			return -1; //IDなし
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //データベースエラー
	}


	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // データベースエラー
	}

}
