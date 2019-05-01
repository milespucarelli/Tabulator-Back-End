class PositionSerializer < ActiveModel::Serializer
  attributes :id, :str, :fret

  belongs_to :note
end
