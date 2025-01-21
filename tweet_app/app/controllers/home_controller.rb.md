- home_controller.rb
- ActionController::Baseを継承したApplicationControllerを継承したHomeController class

  - before_action
    - forbid_login_user
      - onlyメソッドでtopアクションを指定する

  - メソッド
    - top
    - about