class Room < ApplicationRecord
  has_many :users, through: :groups
  has_many :groups
  accepts_nested_attributes_for :groups
end