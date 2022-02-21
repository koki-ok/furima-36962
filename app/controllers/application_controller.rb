class ApplicationController < ActionController::Base
  # ユーザー管理機能の時点では不要のためコメントアウト、かつ、この記述は個別のコントローラーへ移動する。
  # before_action :authenticate_user!, except: :index
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
