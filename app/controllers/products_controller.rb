class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @product_image = ProductImage.find_by_product_id(params[:id])
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

  def show_by_category
    render plain: params[:category].inspect
  end

  private
    def product_params
      params.require(:product).permit(:name,:brand,:price,:highlights,:description,:category_name)
    end
end