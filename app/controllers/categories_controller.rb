class CategoriesController < ApplicationController
  def products_by_category
    @category = Category.find_by_name(params[:category_name])
    @products = @category.products.paginate(page: params[:page],per_page: 20)
    render 'products_by_category'
  end
end