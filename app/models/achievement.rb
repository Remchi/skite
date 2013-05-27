class InThePast < ActiveModel::Validator
  def validate(record)
    if record.achieved_at > Time.now
      record.errors['achieved_at'] << "It can't be in the future."
    end
  end
end

class Achievement < ActiveRecord::Base
  validates :title, presence: true

  validates_with InThePast
end
