module OngoingOrdersRemover
  def remove_ongoing_orders
    @user_orders = current_user.orders

    if @user_orders
      @user_orders.each do |order|
        if order.state == "ongoing"
          order.destroy
        end
      end
    end
  end
end