class CompositionSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist

  belongs_to :user
  has_many :notes
  has_many :positions, through: :notes
end
