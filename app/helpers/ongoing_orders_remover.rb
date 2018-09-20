module OngoingOrdersRemover
  def remove_ongoing_orders
    ongoing_orders = Order.find_by_state("ongoing")

    if ongoing_orders
      ongoing_orders.destroy
    end
  end
end