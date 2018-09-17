class ProductImagesController < ApplicationController
  before_action :only_admin,only: [:new,:create]

  def show
    @product = Product.find(1)
    @product_images = @product.product_images
  end

  def new
    @product_image = ProductImage.new
    @product_image.product = Product.find(params[:product_id])
  end

  def create
    @product_image = ProductImage.new(product_image_params)

    if @product_image.save
      flash[:success] = "Product has been added successfully"
      redirect_to product_path(@product_image.product_id)
    else
      render 'new'
    end
  end

  private
  def only_admin
    if !current_user.admin?
      flash[:danger] = "You don't have an access to this page"
      redirect_to root_path
    end
  end

  def product_image_params
    params.require(:product_image).permit(:name, :picture,:product_id)
  end

end