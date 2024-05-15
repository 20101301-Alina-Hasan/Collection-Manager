class Collection < ApplicationRecord
    has_many :items
    has_many :custom_details
    belongs_to :category
end
  