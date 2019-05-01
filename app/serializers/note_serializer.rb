class NoteSerializer < ActiveModel::Serializer
  attributes :duration, :id
  has_many :positions
  belongs_to :composition
end
