class CheckoutController < ApplicationController
  include OngoingOrdersRemover
  include DeliveryCreator
  include CheckoutCounters

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

    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products

    @order.overall_price = get_overall_price(@cart_products)

    @delivery = get_created_delivery(params[:delivery_type])
    @delivery.save

    @order.delivery = @delivery

    @order.save

    @cart_products.each do |cart_product|
      cart_product.order = @order
      cart_product.save
    end

    @overall_price = get_overall_price(@cart_products)
    @overall_quantity = get_overall_quantity(@cart_products)
    @shipping_price = @delivery.delivery_cost
    @custom_address = Address.new
  end

  def checkout_payment_method
    @order = current_user.orders.last

    if params[:custom_address_form] == "true"
      @address = Address.new(address_params)
      @address.user = current_user

      if !@address.save
        flash[:danger] = "Address inputs are incorrect"
        redirect_to checkout_shipping_type_path
      end
    else
      @address = Address.find(params[:selected_address].to_i)
    end

    @order.address = @address
    @order.save
  end

  private

  def address_params
    params.require(:address).permit(:first_name,:last_name,:country,:city,:street,
                                    :post_code,:phone,:user_id)
  end

end