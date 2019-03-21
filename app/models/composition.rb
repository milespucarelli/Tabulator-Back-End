class Composition < ApplicationRecord
  belongs_to :user
  has_many :tracks
end
