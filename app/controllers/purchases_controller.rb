class PurchasesController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
  end

  def new
  end

  def create
  end
end
