class Day < ActiveRecord::Base
    has_many :routines
    has_many :programs, through: :routines
    has_many :exercises, through: :routines
end