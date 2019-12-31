# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :text
#  image       :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ApplicationRecord
  has_many :products

  validates :title, uniqueness: true, length: {in: 3..15}
  validates :description, length: {in: 5..100}
end
