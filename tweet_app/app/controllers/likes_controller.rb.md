- likes_controller.rb
  - ActionController::Baseを継承したApplicationControllerを継承したLikesController class
    - before_action
      - authenticate_user
        - application controller内のauthenticate_userをアクションの前に行う
    - メソッド
      - create
        - 変数@likeに対してApplication recordを継承したLike classのnewメソッドを活用して新しいインスタンスを引数がuser_idカラムが
        - @current_user
          - createアクションが実行される前にapplication controller内のauthenticate_userが実行される
          1. application controller内のauthenticate_userが実行
          2. 1.の前にset_current_userが実行される
          3. 変数@current_userにUserモデルのfind_byメソッドを使い引数がid: session[:user_id]のレコードを取得して代入する
        - params[:post_id]
          - リクエストのpost_id
        - application@current_user.id,post_idカラムがparams[:post_id]として作成し代入する。
        - 変数@likeに対してApplication recordを継承したlike class内のsaveメソッドを活用してデータベースに保存する
        - "/posts/#{params[:post_id]}"にリダイレクトする
      - destroy
        - 変数@likeに対してApplication recordを継承したlike classのfind_byメソッドを活用してuser_idカラムが@current_user.id,post_idカラムがparams[:post_id]のレコードを取得して代入する。
        - 変数@likeに対してApplication recordを継承したlike classのdestroyメソッドを実行する。
        - "/posts/#{params[:post_id]}"にリダイレクトする