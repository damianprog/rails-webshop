module DeliveryCreator
  def get_created_delivery(delivery_type)
    @delivery = Delivery.new

    if params[:delivery_type] == 'Two-Day shipping'
      @delivery.delivery_cost = 10
      @delivery.delivery_type = 'Two-Day shipping'
      @delivery.delivery_date = get_arrives_date
    else
      @delivery.delivery_cost = 0
      @delivery.delivery_type = 'Free pickup'
    end

    @delivery
  end
end