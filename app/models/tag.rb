class Tag < ApplicationRecord
    has_many :item_to_tags
    has_many :items, through: :item_to_tags
  end
  