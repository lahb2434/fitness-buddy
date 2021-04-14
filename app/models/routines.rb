class Routine < ActiveRecord::Base
    belongs_to :user
    belongs_to :program 
    belongs_to :day
    belongs_to :exercise

    # Routine.find_by(user_id: 1, program_id: 1, day_id: 1).each do

end