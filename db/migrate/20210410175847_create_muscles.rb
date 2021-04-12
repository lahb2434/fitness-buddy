class CreateMuscles < ActiveRecord::Migration
  def change
    create_table :muscles do |t|
      t.string :name
      t.integer :exercise_ids

      t.timestamps null: false
    end
  end
end
