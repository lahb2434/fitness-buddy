class Routine < ActiveRecord::Base
    has_many :workouts
    belongs_to :program 
    has_many :muscles, through: :workouts
    
    def slug
        self.routine_description.gsub(/\W/x, '-')
    end

    def self.find_by_slug(routine_name)
        self.all.detect{|routine| routine.slug == routine_name}
    end
end