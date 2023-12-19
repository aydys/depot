class NotifyShipDateJob < ApplicationJob
  queue_as :default

  def perform(order)
    order.notify_ship_date
  end
end
