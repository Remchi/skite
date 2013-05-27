class AddListIdToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :list_id, :integer, default: 1
  end
end
