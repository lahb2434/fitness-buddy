class Program < ActiveRecord::Base

    has_many :routines
    has_many :users, through: :routines
    has_many :days, through: :routines

    def slug
        self.name.gsub(/\W/x, '-')
    end

    def self.find_by_slug(program_name)
        self.all.detect{|program| program.slug == program_name}
    end
    
end
