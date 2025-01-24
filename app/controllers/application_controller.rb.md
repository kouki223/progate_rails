- application_controller.rb
- ActionController::Baseを継承したApplicationController　class
  - before_action 
    - set_current_user
      - application_controller内のアクションのアクションを実行する前にset_current_userを実行する
  - メソッド
    - set_current_user
      - 変数@current_userに対してapplication recordを継承したuser classのfind_byメソッドを使って引数がid: session[:user_id]で取得されるレコードをuserモデルを介して代入する。
        - session[:user_id]
          - セッション情報として保存されているuser_id
    - authenticate_user
      1. authenticate_userが実行される前にset_current_userを実行する。
      2. 1.で定義した@current_userがnilと等しい場合には
        - flash[:notice]に"ログインが必要です"を代入する
        - "/login"へリダイレクトする
    - forbid_login_user
      1. forbid_login_userが実行される前にset_current_userを実行する
      2. もし、@current_userがtrueの場合には
        - flash[:notice]に"すでにログインしています"を代入する
        - "/posts/index"へリダイレクトする