# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  images      :string           default([]), is an Array
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

class Product < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy

  validates :title, uniqueness: true, length: { in: 3..19 }
  validates :description, length: { in: 10..250 }
  validates :price, presence: true, length: { maximum: 8 }

  mount_uploaders :images, ImageUploader
  has_rich_text :description

  scope :new_products, -> { order('created_at DESC') }
  scope :old_products, -> { order('created_at ASC') }
  scope :asc,          -> { order('price ASC') }
  scope :desc,         -> { order('price DESC') }
  scope :best_star,    -> { group(:id).order('AVG(comments.rating) DESC') }
end
