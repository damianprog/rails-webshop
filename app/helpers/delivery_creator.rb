module DeliveryCreator
  def get_created_delivery(delivery_type, overall_price)
    @delivery = Delivery.new

    if delivery_type == 'Free pickup'
      @delivery.delivery_cost = 0
      @delivery.delivery_type = 'Free pickup'
    elsif delivery_type == 'Two-Day shipping'
      @delivery.delivery_cost = 10
      @delivery.delivery_type = 'Two-Day shipping'
      @delivery.delivery_date = get_arrives_date
    end

    @delivery
  end
end