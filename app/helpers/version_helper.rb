module VersionHelper
  def version
     "#{`git describe --abbrev=0 --tags`.gsub("\n",'')} - #{ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'}"
   end
end