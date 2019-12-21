class Room < ApplicationRecord
  has_many :users, through: :group
  has_many :groups
  accepts_nested_attributes_for :group
end