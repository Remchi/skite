class AchievementSerializer < ActiveModel::Serializer
  attributes :id, :title, :achieved_at, :description, :description_src
end
