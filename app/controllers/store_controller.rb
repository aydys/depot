class StoreController < ApplicationController
  include SessionCounter
  
  before_action :increase_session_counter

  def index
    @products = Product.order(:title)
    @counter = session[:counter] if session[:counter]
  end
end
