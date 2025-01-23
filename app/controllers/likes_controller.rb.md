- likes_controller.rb
  - [ApplicationController](./users_controller.rb) classを継承したLikesController class
    - before_action
      - authenticate_user
        - application controller内のauthenticate_userをLikesコントローラー内のアクションが実行される前に行う
    - メソッド
      - create
        - 変数@likeに対してApplication recordを継承したLike classのnewメソッドを活用して新しいインスタンスを作成する。
        - @current_user
          - createアクションが実行される前にapplication controller内のauthenticate_userが実行される
          1. application controller内のauthenticate_userが実行
          2. 1.の前にset_current_userが実行される
          3. 変数@current_userにUserモデルのfind_byメソッドを使い引数がid: session[:user_id]のレコードを取得して代入する
        - params[:post_id]
          - リクエストのpost_id
        - 変数@likeに対してlike class内のsaveメソッドを使いデータベースに保存する
        - "/posts/#{params[:post_id]}"にリダイレクトする
      - destroy
        - 変数@likeに対してApplication recordを継承したlike classのfind_byメソッドを活用して条件に一致するレコードを代入する。
        - @current_user.id
          1. destroyアクションが実行される前にauthenticate_userが実行される
          2. 1.が実行される前にset_current_userが実行される
          3. set_current_userでApplication recordを継承したUserクラスのfind_byメソッドを使いレコードが代入される
          4. 引数(id: session[:user_id])
       - params[:post_id]
         - リクエストのpost_id
       - user_idカラムが@current_user.id,post_idカラムがparams[:post_id]のレコードを取得して代入する。
       - 変数@likeに対してApplication recordを継承したlike classのdestroyメソッドを実行する。
       - "/posts/#{params[:post_id]}"にリダイレクトする