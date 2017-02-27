class Card < ActiveRecord::Base
  has_many :card_collections
  has_many :users, through: :card_collections
end
