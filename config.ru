require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use ProgramsController
use MusclesController
use ExercisesController
use UsersController
use RoutinesController
use WorkoutsController
