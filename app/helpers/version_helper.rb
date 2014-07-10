module VersionHelper
  def version
     "#{`git describe --abbrev=0 --tags`} - #{ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'}"
   end
end