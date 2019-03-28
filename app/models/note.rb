class Note < ApplicationRecord
  belongs_to :composition
  has_many :positions
end
