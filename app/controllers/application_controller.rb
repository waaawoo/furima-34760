class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # 環境変数が指定される
      # vim ~/.zshrc
      # source ~/.zshrc
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
