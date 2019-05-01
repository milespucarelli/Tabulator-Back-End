class CompositionSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist

  has_many :notes
  has_many :positions, through: :notes
end
