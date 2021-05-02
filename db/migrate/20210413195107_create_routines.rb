class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :routine_description
      t.integer :program_id
      
      
    end
  end
end
