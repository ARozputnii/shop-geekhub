class RemovePayTypeFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :pay_type, :string
    add_column :orders, :phone, :integer

  end
end
