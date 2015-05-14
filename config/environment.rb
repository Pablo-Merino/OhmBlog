require 'sinatra/base'
require 'ohm'
require 'ohm/contrib'
require 'sinatra/namespace'
require 'sinatra/multi_route'
require 'haml'
require 'pathname'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers, helpers and models
# TODO: Make it so there's no need for an specific order loading these files
require_relative '../lib/base_controller' # This needs to be first
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
require_relative 'routes' # And this has to be the last

Ohm.redis = Redic.new('redis://127.0.0.1:6379')
