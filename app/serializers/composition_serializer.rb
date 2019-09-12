class CompositionSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :tempo

  has_many :notes
  has_many :positions, through: :notes
end
