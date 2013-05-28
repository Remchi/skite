class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :public

  embed :ids, include: true
  has_many :achievements
end
