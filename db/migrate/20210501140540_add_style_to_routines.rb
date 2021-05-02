class AddStyleToRoutines < ActiveRecord::Migration
  def change
    add_column :routines, :style, :string
  end
end
