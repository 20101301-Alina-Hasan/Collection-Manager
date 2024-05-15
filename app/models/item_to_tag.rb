class ItemToTag < ApplicationRecord
    self.primary_key = [:item_id, :tag_id]

    belongs_to :item
    belongs_to :tag
end
  