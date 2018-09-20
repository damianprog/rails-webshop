class CheckoutController < ApplicationController
  include OngoingOrdersRemover
  include DeliveryCreator

  def checkout_shipping_type
    @overall_quantity = 0
    @overall_price = 0.00

    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @arrives_date = get_arrives_date

    @overall_quantity = get_overall_quantity(@cart_products)
    @overall_price = get_overall_price(@cart_products)

  end

  def checkout_shipping_address
    remove_ongoing_orders

    @order = Order.new
    @order.user = current_user
    @order.state = "ongoing"

    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @order.overall_price = get_overall_price(@cart_products)
    @overall_quantity = get_overall_quantity(@cart_products)

    @delivery = get_created_delivery(params[:delivery_type])
    @delivery.save

    @order.delivery = @delivery

    @order.save

    @cart_products.each do |cart_product|
      cart_product.order = @order
      cart_product.save
    end

    @custom_address = Address.new
  end

  private

  def get_overall_quantity(cart_products)
    overall_quantity = 0

    cart_products.each do |cart_product|
      overall_quantity += cart_product.quantity
    end

    overall_quantity
  end

  def get_overall_price(cart_products)
    overall_price = 0.00

    cart_products.each do |cart_product|
      overall_price += cart_product.price
    end

    overall_price
  end

  def get_arrives_date
    arrives_date = Date.today + 3.days
    arrives_date = arrives_date.strftime("%d/%m/%Y")
  end

end