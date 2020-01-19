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
  has_many :comments
  mount_uploaders :images, ImageUploader
  has_rich_text :description

  belongs_to :category

  #validates :title, uniqueness: true, length: { in: 3..19 }
=begin
  validates :description, length: { in: 10..250 }
  validates :price, presence: true
=end

  scope :new_products, -> { order('created_at DESC') }
  scope :old_products, -> { order('created_at ASC') }
  scope :asc,          -> { order('price ASC') }
  scope :desc,         -> { order('price DESC') }
  scope :best_star,    -> { group(:id).order('AVG(comments.rating) DESC') }
end
