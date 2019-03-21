class Measure < ApplicationRecord
  belongs_to :track
  has_many :notes
end
