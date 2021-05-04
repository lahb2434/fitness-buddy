EDB.findit #seeds exercise and muscle data conservatively

user1 = User.new(username: "Marco", weight: "185 lbs", height: "5'8\"", password: "Polo")
user2 = User.new(username: "Azazel", weight: "300 lbs", height: "7'5\"", password: "Morningstar")
user3 = User.new(username: "Saylor", weight: "65 lbs", height: "2'5\"", password: "Adorable")

program1 = user1.programs.build(name: 'Absolute Full Body Smack Down')
program2 = user2.programs.build(name: 'RedBull Challenge')
program3 = user3.programs.build(name: 'Spartan Race Prep')

routine1 = program1.routines.build(routine_description: "Power")
routine2 = program2.routines.build(routine_description: "Hypertrophy")
routine3 = program3.routines.build(routine_description: "Endurance")

workout1 = routine1.workouts.build(repetitions: '5-8 reps', sets: "3 sets", warm_up_sets: "3 sets increase exponentially to 95% of 1rm")
workout2 = routine2.workouts.build(repetitions: '12-15 reps', sets: "3-4 sets", warm_up_sets: "3 easy + light weight")
workout3 = routine3.workouts.build(repetitions: '20+ reps', sets: "5 sets", warm_up_sets: "1 set light weight @ 20 reps")

workout1.exercise_ids =[1]
workout2.exercise_ids =[3]
workout3.exercise_ids =[5]

user1.save
user2.save
user3.save