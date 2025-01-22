- posts_controller.rb
- ApplicationControllerクラスを継承したPostsControllerクラス
  - before_action
    - authenticate_user
      1. authenticate_userが実行される前にApplication controllerのset_current_userが実行される
    - ensure_correct_user
      1. ensure_correct_userが実行される前にauthenticate_userが実行される
      2. 1.の前にApplication controllerのset_current_userが実行される
      3. Posts controller内のensure_correct_userが実行される
      - only
        - edit,update,destroyアクションが実行される前に実行される
  - メソッド
    - index
      1. 変数@postsにapplication recordを継承したPostモデルのallメソッドを使いPostsテーブル全てのレコードを配列にして代入する。
      2. orderメソッドを活用して降順に並び替える
    - show
      1. 変数＠postにPostモデルのfind_byメソッドを使いレコードを代入する
        - 引数がid: params[:id]
          - params[:id]
            - リクエスト（URL）のid
      2. 変数＠userに変数＠postのuserカラムを代入する
      3. 変数@likes_countにLikeモデルのwhereメソッドを活用して条件に一致するレコードを代入する
        - 条件(post_id: @post.id)
          - 投稿のid：1.で定義した@postのid
    - new
      - 変数＠postに対してPost classのnewメソッドを使って新しいインスタンスを作成して代入する。
    - create
      1. 変数＠postに対してPost　classのnewメソッドを活用して新しいインスタンスを作成する。
      2. 引数はcontent: params[:content],
      　　　　　user_id: @current_user.id
         - params[:content]
           - リクエストのcontent
         - @current_user
           1. createアクションが実行される前にauthenticate_userが実行される
           2. 1.が実行される前にset_current_userが実行される
           3. 変数@current_userに対してUser classのfind_byメソッドを使い、引数がid: session[:user_id]になるレコードを代入する
      3. もし、saveメソッドがtrueの場合には
        - flash[:notice]に"投稿を作成しました"を代入する
        - "/posts/index"にリダイレクトする
      4. true以外の場合には
        - "posts/new"にrenderするようにする
    - edit
      - 変数＠postに対してPost classのfind_byメソッドを活用して引数がid: params[:id]の際に取得されるレコードを代入する
        - params[:id]
          - リクエストの:id
    - update
      1. 変数＠postに対してPost　classのfind_byメソッドを活用して引数がid: params[:id]の際に取得されるレコードを代入する
        - params[:id]
          - リクエストの:id
      2. 変数＠postのcontentカラムにparams[:content]を代入する
        - params[:content]
          - リクエストのcontent
      3. もし、@post.saveがtrueの場合には
        - flash[:notice]に"投稿を編集しました"を代入する
        - "/posts/index"にリダイレクトする
      4. true以外の場合には
        - "posts/edit"へrenderする
    - destroy
      1. 変数＠postに対してPost　classのfind_byメソッドを活用して引数がid: params[:id]の際に取得されるレコードを代入する
        - params[:id]
          - リクエストのid
      2. 変数＠postに対してPost classのdestroyメソッドを実行
      3. flash[:notice]に "投稿を削除しました"を代入する
      4. "/posts/index"にリダイレクトする
    - ensure_correct_user
      1. 変数＠postに対してPost classのfind_byメソッドを使って引数がid: params[:id]の際に取得されるレコードを代入する
         - params[:id]
           - リクエストのid 
      2. もし、@post.user_idと@current_user.idが異なる場合には
        - @current_user
          1. @current_userが実行される前にauthenticate_userが実行される
          2. 1.の前にset_current_userが実行される
          3. 2.で@current_userに対してfind_byメソッドを活用して、引数がid: session[:user_id]の場合に取得されるレコードを代入している
       - flash[:notice]に"権限がありません"を代入する
       - "/posts/index"にリダイレクトする