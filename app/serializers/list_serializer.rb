class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :public

  embed :ids
  has_many :achievements
end
