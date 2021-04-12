class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :exercise_ids

      t.timestamps null: false
    end
  end
end
