class StoreController < ApplicationController
  include SessionCounter
  include CurrentCart

  skip_before_action :authorize
  before_action :increase_session_counter
  before_action :set_cart

  def index
    @products = Product.order(:title)
    @counter = session[:counter] if session[:counter]
  end
end
