# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  commenter  :string
#  rating     :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_comments_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

class Comment < ApplicationRecord
  belongs_to :product
  #
    validates :commenter, presence: true, length: { minimum: 2 }
    validates :body,      presence: true, length: { minimum: 5 }

  STARS = [
    [5, 'gorgeous'],
    [4, 'good'],
    [3, 'regular'],
    [2, 'poor'],
    [1, 'bad']
  ].freeze
end
