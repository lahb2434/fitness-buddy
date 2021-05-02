class CreateExerciseWorkouts < ActiveRecord::Migration
  def change
    create_table :exercise_workouts do |t|
      t.integer :workout_id
      t.integer :exercise_id
    end
  end
end
