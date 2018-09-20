class CartsController < ApplicationController
  include CartProductsAdder

  def show_cart
    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @overall_quantity = 0
    @overall_price = 0.00

    @cart_products.each do |cart_product|
      @overall_quantity += cart_product.quantity
      @overall_price += cart_product.price
    end
  end

  def add_product_to_cart
    add_product(params[:product_id].to_i,params[:quantity].to_i)

    flash[:success] = "Product has been added to cart"
    redirect_to product_path(@product)
  end

  def remove_cart_product
    @cart_product = CartProduct.find(params[:id])

    @cart_product.destroy

    flash[:success] = "Product has been removed from cart"
    redirect_to show_cart_path
  end

end