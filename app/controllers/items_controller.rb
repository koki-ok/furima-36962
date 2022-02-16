class ItemsController < ApplicationController
  # ユーザー管理機能の時点では不要なためコメントアウト
  # before_action :move_to_index, except: [:index, :show]

  def index
    # ユーザー管理機能の時点では不要なためコメントアウト
    # @items = Item.all
  end

  # ユーザー管理機能の時点では不要なためコメントアウト
  # private

  # def move_to_index
    # redirect_to action: :index unless user_signed_in?
  # end
end
