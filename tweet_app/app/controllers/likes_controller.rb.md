- likes_controller.rb
- ActionController::Baseを継承したApplicationControllerを継承したLikesController class
  
  - before_action
    - authenticate_user

- メソッド
  - create
    - 変数@likeに対してApplication recordを継承したlike classのnewメソッドを活用して新しいインスランスを引数がuser_idカラムが@current_user.id,post_idカラムがparams[:post_id]として作成し代入する。
    - 変数@likeに対してApplication recordを継承したlike class内のsaveメソッドを活用してデータベースに保存する
    - "/posts/#{params[:post_id]}"にリダイレクトする
  - destroy
    - 変数@likeに対してApplication recordを継承したlike classのfind_byメソッドを活用してuser_idカラムが@current_user.id,post_idカラムがparams[:post_id]のレコードを取得して代入する。
    - 変数@likeに対してApplication recordを継承したlike classのdestroyメソッドを実行する。
    - "/posts/#{params[:post_id]}"にリダイレクトする