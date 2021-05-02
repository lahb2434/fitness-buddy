class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :repetitions
      t.string :sets
      t.string :warm_up_sets
      t.integer :routine_id
    end
  end
end
