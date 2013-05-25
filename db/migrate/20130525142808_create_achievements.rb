class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title
      t.datetime :achieved_at

      t.timestamps
    end
  end
end
