class User < ActiveRecord::Base
  has_many :card_collections
  has_many :cards, through: :card_collections
  has_secure_password
end
