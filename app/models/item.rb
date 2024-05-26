class Item < ApplicationRecord
    has_many :item_to_tags
    has_many :tags, through: :item_to_tags
    has_many :hearts
    belongs_to :collection
end
