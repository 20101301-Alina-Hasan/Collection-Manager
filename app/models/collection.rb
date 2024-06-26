class Collection < ApplicationRecord
    belongs_to :user
    # has_many :items, dependent: :destroy
    has_many :items
    # has_many :custom_details, dependent: :destroy
    has_many :custom_details
    belongs_to :category, optional: true
  
    validates :name, presence: true
  end
  