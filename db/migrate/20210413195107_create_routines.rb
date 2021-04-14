class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.integer :user_id
      t.integer :program_id
      t.integer :day_id
      t.integer :exercise_id
    end
  end
end
