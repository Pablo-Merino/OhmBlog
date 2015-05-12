# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

run Rack::URLMap.new(ROUTES)
