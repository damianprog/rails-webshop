class ProductsController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def show
    @product = Product.find(params[:id])
    @product_image = ProductImage.find_by_product_id(params[:id])
    @sponsored_image = ProductImage.find_by_product_id(params[:id])
    @highlights = @product.highlights.split("/")
    @sponsored = @product

    @arrives_date = Date.today + 3.days
    @arrives_date = @arrives_date.strftime("%d/%m/%Y")

    @cart_product = Cart.find_by_user_id(current_user).cart_products.last

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @category = Category.find_by_name(params[:category_name])
    @product.category_id = @category.id

    if @product.save
      redirect_to new_product_image_path(:product_id => @product.id)
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :price, :highlights, :description, :category_name)
  end

end