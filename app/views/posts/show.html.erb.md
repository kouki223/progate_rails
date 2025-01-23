- show.html
- 投稿詳細ページ
  - <img src="<%= "/user_images/#{@user.image_name}" %>">
    - /user_images/#{@user.image_name}
      1. postコントローラーで@userに対して@post.userを代入した変数
      2. 1.に対応するレコード内のimage_nameカラムに保存されているURLを読み込む呼び出す
      3. publicディレクトリ内のuser_imageディレクトリ内の対応する画像を表示する
  - <%= link_to(@user.name, "/users/#{@user.id}") %>
    - テキストリンク@user.name、対応するリンク先が/users/#{@user.id}とする
  - <%= @post.content %>
    - postsコントローラーで定義した変数@postのcontentカラム内容
  - <%= @post.created_at %>
    - @postsコントローラーで定義した変数@postのcreated_atカラム内容
  - <% if Like.find_by(user_id: @current_user.id, post_id: @post.id) %>
    - post class内のfind_byメソッドを使い、
      - user_idカラムは@current_user.id
        1. showアクションが実行される前にauthenticate_userが実行される
        2. 1.が実行される前にset_current_userが実行される
        3. @current_userに対してapplication_contoroller class内のfind_byメソッドを活用して引数がid: session[:user_id]の時に取得されるレコードを代入する
      - post_idカラムは@post.id
        1. @postはpostコントローラーのshowアクションで定義された変数
        2. post class内のfind_byメソッドを活用して引数がid params[:id]の場合に取得されるレコードを代入したもの
        - ２つの引数に対応するレコードがある場合には
      - <%= link_to( "/likes/#{@post.id}/destroy", {method: "post"}) do %>
        - HTTPメソッドはpostでリンク先が"/likes/#{@post.id}/destroy"とする
  - <else>
    - <%= link_to("/likes/#{@post.id}/create", {method: "post"}) do %>
      - HTTPメソッドがpostでリンク先が"/likes/#{@post.id}/create"とする
  - <%= @likes_count %>
    - postコントローラー内で定義した変数
      - post class内のwhereメソッドを使い条件がpost_id: @post.idに一致するレコード数をcountメソッドで数える
  - <% if @post.user_id == @current_user.id %>
      - @post.user_id
        - postコントローラーのshowアクションが実行される時に定義された変数@postのuser_idカラム
      - @current_user.id
        1. showアクションが実行される前にauthenticate_userが実行される
        2. 1.の前にapplocation_controller内のset_current_userが実行される
        3. 2.で定義された変数@current_userのidカラム
   - もし、@post.user_idと@current_user.idが同じならば 
      - <%= link_to("編集", "/posts/#{@post.id}/edit") %>
        - テキストリンク編集、リンク先が("/posts/#{@post.id}/edit"となるようにする
      - <%= link_to("削除", "/posts/#{@post.id}/destroy", {method: "post"}) %>
        - テキストリンク削除、リンク先が"/posts/#{@post.id}/destroy"、HTTPメソッドはpostを指定する