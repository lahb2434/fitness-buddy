class CreateExersiseMuscles < ActiveRecord::Migration
  def change
    create_table :exersise_muscles do |t|
      t.integer :muscle_id
      t.integer :exercise_id

      t.timestamps null: false
    end
  end
end
