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
  mount_uploaders :images, ImageUploader
  belongs_to :category

  validates :title, uniqueness: true, length: { in: 3..19 }
  validates :description, length: { in: 10..250 }
  validates :price, presence: true


  scope :new_products, -> { order('created_at DESC') }
  scope :old_products, -> { order('created_at ASC') }
  scope :asc,          -> { order('price ASC') }
  scope :desc,         -> { order('price DESC') }

end
