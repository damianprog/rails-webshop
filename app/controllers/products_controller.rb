class ProductsController < ApplicationController
  def show_by_category
    render plain: params[:category].inspect
  end
end