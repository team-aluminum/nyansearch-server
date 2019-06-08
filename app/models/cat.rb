class Cat < ApplicationRecord
  validates :shop_id, presence: true

  belongs_to :shop
end
