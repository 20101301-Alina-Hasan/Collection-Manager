# app/models/heart.rb
class Heart < ApplicationRecord
  self.primary_key = [:user_id, :item_id]

  belongs_to :user
  belongs_to :item
end
  