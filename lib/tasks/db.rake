namespace :db do

  task :fixture => :environment do
    require './db/fixture'
  end
end
