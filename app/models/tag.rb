class Tag < ApplicationRecord
    has_many :item_to_tags, dependent: :destroy
    has_many :items, through: :item_to_tags
  end
  