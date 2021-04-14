class User < ActiveRecord::Base
    has_secure_password
    
    has_many :routines
    has_many :programs, through: :routines
    has_many :days, through: :routines
    has_many :exercises, through: :routines
   


end
