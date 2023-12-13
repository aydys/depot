class ChangePayTypeToOrders < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      change_table :orders do |t|
        direction.up { t.change :pay_type, :string }
        direction.down { t.change :pay_type, :integer }
      end
    end
  end
end
