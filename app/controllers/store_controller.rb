class StoreController < ApplicationController
  include SessionCounter
  include CurrentCart

  skip_before_action :authorize
  before_action :increase_session_counter
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @counter = session[:counter] if session[:counter]
    end
  end
end
