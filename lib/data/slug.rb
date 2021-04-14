class CreateIt

    def slug
        self.name.gsub(/\W/x, '-')
    end

    def self.start
    user = User.create(username: 'Cookie', password: 'Monster')

    days = (1..7).to_a

    days.each do |num_day|
        Day.create(name: "Day #{num_day}")
    end

    programs = ['Upper/Lower','Push/Pull/Legs','Full Body']

    programs.each do |workout|
        program = Program.create(name: workout)
        # program.day_ids = (1..7).to_a
      end

    user = User.first
    program = Program.first
    # user.user_programs.create(program: program)

    end
end



 
