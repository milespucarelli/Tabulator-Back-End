class Track < ApplicationRecord
  belongs_to :composition
  has_many :measures
end
