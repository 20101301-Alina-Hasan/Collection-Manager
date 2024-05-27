class Item < ApplicationRecord
    has_many :item_to_tags, dependent: :destroy
    has_many :tags, through: :item_to_tags
    has_many :hearts, dependent: :destroy
    belongs_to :collection
end
