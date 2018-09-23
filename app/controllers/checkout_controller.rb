class CheckoutController < ApplicationController
  before_action :initialize_receipt_fields
  before_action :initialize_shipping_price, except: [:checkout_shipping_type,:checkout_shipping_address]

  include OngoingOrdersRemover
  include DeliveryCreator
  include CheckoutCounters

  def checkout_shipping_type
    @arrives_date = get_arrives_date
  end

  def checkout_shipping_address
    remove_ongoing_orders

    @order = Order.new
    @order.user = current_user

    @order.overall_price = get_overall_price(@cart_products)

    @delivery = get_created_delivery(params[:delivery_type])
    @delivery.save

    @order.delivery = @delivery

    @order.save

    @cart_products.each do |cart_product|
      cart_product.order = @order
      cart_product.save
    end

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
    @custom_credit_card = CreditCard.new
  end

  def checkout_billing_address
    @order = current_user.orders.last

    if params[:custom_credit_card_form] == "true"
      @credit_card = CreditCard.new(credit_card_params)
      @credit_card.user = current_user

      if !@credit_card.save
        flash.now[:danger] = "Credit card inputs are incorrect.Check credit card information validity"
        @custom_credit_card = CreditCard.new
        render 'checkout_payment_method'
      end
    else
      @credit_card = CreditCard.find(params[:selected_credit_card].to_i)
    end

    @order.credit_card = @credit_card
    @order.save
    @custom_address = Address.new
  end

  def checkout_finish
    @order = current_user.orders.last

    if params[:custom_address_form] == "true"
      @address = Address.new(address_params)
      @address.user = current_user

      if !@address.save
        flash[:danger] = "Address inputs are incorrect.Make sure the given address is correct"
        render 'checkout_billing_address'
      end
    else
      @address = Address.find(params[:selected_address].to_i)
    end

    @order.billing_address = @address
    @order.state = "finished"
    @order.save
    flash[:success] = "You've placed order successfully"
    redirect_to user_path(current_user)
  end

  private

  def initialize_receipt_fields
    @cart = Cart.find_by_user_id(current_user)
    @cart_products = @cart.cart_products
    @overall_price = get_overall_price(@cart_products)
    @overall_quantity = get_overall_quantity(@cart_products)
  end

  def initialize_shipping_price
    @shipping_price = current_user.orders.last.delivery.delivery_cost
  end

  def address_params
    params.require(:address).permit(:first_name, :last_name, :country, :city, :street,
                                    :post_code, :phone, :user_id)
  end

  def credit_card_params
    params.require(:credit_card).permit(:first_name, :last_name, :card_number,
                                        :month_expiration, :year_expiration, :security_code, :phone_number)
  end
end