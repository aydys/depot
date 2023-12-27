class SupportRequest < ApplicationRecord
  belongs_to :order, optional: true

  has_rich_text :response

  def get_orders
    Order.where(email: self.email).order('created_at desc')
  end
end
