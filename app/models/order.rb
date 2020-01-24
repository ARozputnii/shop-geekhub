# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  comment    :string
#  email      :string
#  name       :string
#  phone      :integer
#  status     :string           default("new")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true

  validates :name, :address, :email, :phone, presence: true

  Statuses = ['new', 'completed', 'canceled']
  scope :new_orders, -> { where(status: 'new') }
  scope :completed,  -> { where(status: 'completed') }
  scope :canceled,   -> { where(status: 'canceled') }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end

