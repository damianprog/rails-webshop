module OrdersGetter
  def get_finished_orders
    @all_orders = current_user.orders
    @finished_orders = Array.new

    @all_orders.each do |order|
      if order.state == "finished"
        @finished_orders.push(order)
      end
    end
    @finished_orders
  end
end