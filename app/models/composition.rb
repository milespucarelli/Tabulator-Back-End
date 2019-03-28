class Composition < ApplicationRecord
  belongs_to :user
  has_many :notes
  has_many :positions, through: :notes
end
