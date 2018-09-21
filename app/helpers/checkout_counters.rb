module CheckoutCounters
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