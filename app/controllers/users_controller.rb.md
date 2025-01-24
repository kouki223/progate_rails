- users_controller.rb
  - ApplicationControllerを継承したUsersController　class
  - before_action
    - authenticate_user
      - only(index,show,edit,update)
        1. onlyで指定したアクションが呼び出される時にapplication controller内のauthenticate_userを実行する
        2. 1.の前にset_current_userを実行する
        - ログインしているユーザーのみがindex,show,edit,updateアクションを実行できるようにするメソッド
    - forbid_login_user
      - only(new,create,login_from,login)
        1. onlyで指定したアクションが呼び出される時にまずforbid_login_userを実行する
        2. 1.の前にset_current_userを実行する
        - 新たなアカウント作成やログイン処理などを実行しようとした際に、すでにログイン済みの場合にはログイン済みというメッセージを表示してindexページへリダイレクトするメソッド
    - ensure_correct_user
      - only(edit,update)
        1. onlyで指定したアクションが呼び出される時にensure_correct_userメソッドを実行する
        2. ログイン中のユーザーとURLのパラメーターから受け取るユーザー情報に相違がある場合にはログイン権限がありませんとフラッシュメッセージを表示する
        - ユーザー情報を編集する際にログインしている本人のみが設定できるようにした。 
  - メソッド
    - index
      - 変数@userに対してapplication recordを継承したuser classのallメソッドを使いuserモデルを介してusersテーブルのレコードを全て取得し、配列にして代入している
    - show
      - 変数@userに対してapplication recordを継承したUser classのfind_byメソッドを活用して引数がid： params[:id]の場合にUserモデルを介して取得されるレコードを代入している
        - params[:id]
          - リクエストのid
    - new
      - 変数＠userに対してapplication recordを継承したUser classのnewメソッドを使って新しいインスタンスを作成して代入している
    - create
      - 変数＠userに対してapplication recordを継承したUser classのnewメソッドを使って新しいインスタンスを作成する。
      - 引数
        - nameカラム　params[:name]
        - emailカラム params[:email]
        - image_nameカラム default_user.jpg
        - passwordカラム　params[:password]
          - paramsはリクエストからのデータ
      - もし、変数＠userに対してapplication recordを継承したuser classのsaveメソッドを使った結果、真偽値がtrueの場合には
        1. 変数sessionのキーが[:user_id]である場合の値が@user.idとなるようにする。
        2. 特殊な変数flash[:notice]に"ユーザー情報を編集しました"を代入する
        3. /users/#{@user.id}へリダイレクトするようにする。
      - true以外の場合には
        - "users/new"にrenderする
    - edit
      - 変数＠userに対してapplication recordを継承したUser classの find_byメソッドを使って引数がid：params[:id]の場合にUserモデルを介して取得されるレコードを代入している。
        - params[:id]
          - リクエストのid
    - update
      1. 変数＠userに対してapplication recordを継承したUser classの find_byメソッドを使って引数がid：params[:id]の場合にUserモデルを介して取得されるレコードを代入する
      2. 変数＠userのnameカラムにparams[:name]を代入する
      3. 変数＠userのemailカラムに特殊な変数params[:name]を代入する
         - params[:カラム名]
           - リクエストから送られてきたデータ 
      4. もし、params[:image]がtrueの場合
        1. 変数＠userのimage_nameカラムに"#{@user.id}.jpg"を代入する
        2. imageにparams[:image]を代入する
        3. Fileクラス内のbinwriteメソッドを活用してimageに対してreadメソッドを活用したものを"public/user_images/#{@user.image_name}"に保存する
      5. もし、＠user.saveがtrueの場合、
        1. 特殊な変数flash[:notice]にに対して"ユーザー情報を編集しました"を代入する
        2. "/users/#{params[:id]}"にリダイレクトする
      6. true以外であれば
        - "users/edit"へrenderされるようにする
    - login_form
      - login_form.html.erbをViewへ渡す
    - login
      1. 変数@userに対してapplication recordを継承したUser classの find_byメソッドを活用して引数がemail： params[:email]の場合にUserモデルを介して取得されるレコードを代入する。
      2. 1.で定義した@userと、@userとauthenticateメソッドを活用してparams[:password]がハッシュ化されたパスワードと一致するか確認する。trueであれば
        - 変数sessionを活用して、キーが[:user_id]で代入される値が@user.idとしてsessionへ保存されるようにする。
        - 特殊な変数flash[:notice]に対して"ログインしました"を代入する
        - "/posts/index"にリダイレクトする
      3. true以外の場合
        - @error_messageに"メールアドレスまたはパスワードが間違っています"を代入する
        - ＠emailにparams[:email]を代入する
        - @passwordにparams[:password]を代入する
        - "users/login_form"にrenderする
    - logout
      1. session[:user_id]にnillを代入する
      2. flash[:notice]に"ログアウトしました"を代入する
      3. "/login"にリダイレクトする
    - likes
      1. 変数＠userに対してUser classのfind_byメソッドを活用して引数がid：params[:id]の場合に取得されるレコードを代入する
         - paramsはリクエストのid 
      2. 変数＠likesに対してapplication recordを継承したLike classのwhereメソッドを使って条件ががuser_idカラムが@user.idに一致するレコードを代入する
    - ensure_correct_user
      - もし、@current_user.idとparams[:id].to_iが異なる場合に処理を実行する
        - @current_user.id
          1. edit.updateアクションが実行される前にauthenticate_userが実行される
          2. authenticate_userが実行される前にset_current_userが実行されている。
          3. set_current_userで@current_user.idに対してUser classのfind_byメソッドを使い引数がid: session[:user_id]の場合に取得されるレコードが代入されている
        - flash[:notice]に"権限がありません"を代入する
        - "/posts/index"にリダイレクトする