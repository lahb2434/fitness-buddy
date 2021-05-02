class Workout < ActiveRecord::Base
    has_many :exercise_workouts
    has_many :exercises, through: :exercise_workouts
    # has_one :muscle, through: :exercise
    belongs_to :routine
    

end