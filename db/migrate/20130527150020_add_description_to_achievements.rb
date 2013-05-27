class AddDescriptionToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :description, :text
    add_column :achievements, :description_src, :text
  end
end
