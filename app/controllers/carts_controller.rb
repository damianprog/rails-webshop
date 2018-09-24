class CartsController < ApplicationController
  include CartProductsAdder
  include CheckoutCounters

  def show_cart
    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @overall_quantity = get_overall_quantity(@cart_products)
    @overall_price = get_overall_price(@cart_products)
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