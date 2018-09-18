class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:id])
    @review = Review.new
    @review.product = @product
  end

  def create

    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review has been added"
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end

  private
    def review_params
      params.require(:review).permit(:title,:content,:user_id,:product_id)
    end

end