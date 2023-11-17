class CopyProductPriceToLineItems < ActiveRecord::Migration[7.0]
  def up
    Product.all.each do |product|
      product.line_items.each do |item|
        item.product_price = product.price
        item.save
      end
    end
  end
end
