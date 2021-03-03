class ApplicationController < ActionController::Base
  before_action :basic_auth
  # User登録許可メソッドデバイスが呼ばれた時に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # 環境変数が指定される
      # vim ~/.zshrc
      # source ~/.zshrc
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  # ユーザー登録の追加分を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name f_name f_name_kana l_name l_name_kana birthday])
  end
end
