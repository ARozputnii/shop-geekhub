class ChangeOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string, default: 'new'
    add_column :orders, :comment, :string
  end
end
