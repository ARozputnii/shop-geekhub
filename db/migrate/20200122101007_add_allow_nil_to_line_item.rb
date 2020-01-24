class AddAllowNilToLineItem < ActiveRecord::Migration[6.0]
  def change
    change_column :line_items, :cart_id, :bigint, null: true
  end
end
