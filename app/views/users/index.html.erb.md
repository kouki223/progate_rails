- index.html.erb
- ユーザ一覧ページ
  - <% @user.each do |user| %>
    - userコントローラーのindexアクションで定義した変数@userに配列で代入されているレコードを変数userに対して代入する繰り返し処理
    - <img src="<%= "/user_images/#{user.image_name}" %>">
      - /user_images/#{user.image_name}
        - 変数userに対応するimage_nameカラムのURLに応じた画像表示
    - <%= link_to(user.name, "/users/#{user.id}") %>
      - テキストリンクuser.name、リンク先は"/users/#{user.id}"