class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :title, :achieved_at, :description, :description_src

  embed :ids, include: true
  has_one :list
end
