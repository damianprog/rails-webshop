class CheckoutController < ApplicationController
  def checkout_shipping_type
    @overall_quantity = 0
    @overall_price = 0.00

    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @arrives_date = Date.today + 3.days
    @arrives_date = @arrives_date.strftime("%d/%m/%Y")

    @cart_products.each do |cart_product|
      @overall_quantity += cart_product.quantity
      @overall_price += cart_product.price
    end

  end
end