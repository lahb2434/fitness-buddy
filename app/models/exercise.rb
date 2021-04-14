class Exercise < ActiveRecord::Base
    belongs_to :muscle  
    has_many :routines
    has_many :days, through: :routines
end
