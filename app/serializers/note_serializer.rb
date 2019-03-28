class NoteSerializer < ActiveModel::Serializer
  attributes :duration, :id

  belongs_to :composition
  has_many :positions
end
