- home_controller.rb
- ActionController::Baseを継承した[applicationController](./application_controller.rb.md)を継承したHomeController class

  - before_action
    - forbid_login_user
      1. forbid_login_userが実行される前にapplication controllerのset_current_userが実行される
      2. 変数@current_userに対してUser classのfind_byメソッドを使い、引数がid: session[:user_id]の時に取得されるレコードを代入する
         - session[:user_id]
           - セッション情報として保存されているuser_id
      3. もし、@current_userがtrueの場合には
        - flash[:notice]に"すでにログインしています"を代入する
        - "/posts/index"へリダイレクトする
      4. onlyでtopアクションのみを指定する
  - メソッド
    - top
      - top.html.erbをViewへ渡す
    - about
      - about.html.erbをViewへ渡す