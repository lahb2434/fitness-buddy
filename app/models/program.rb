class Program < ActiveRecord::Base
    belongs_to :user
    has_many :routines
    
    def slug
        self.name.gsub(/\W/x, '-')
    end

    def self.find_by_slug(program_name)
        self.all.detect{|program| program.slug == program_name}
    end
    
end
