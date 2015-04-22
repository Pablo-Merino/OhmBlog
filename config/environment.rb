require 'sinatra/base'
require 'ohm'
require 'ohm/contrib'
require 'sinatra/namespace'
require 'sinatra/multi_route'
require 'haml'

# Base classlol
class Application < Sinatra::Application
  # Some helper constants for path-centric logic
  APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

  APP_NAME = APP_ROOT.basename.to_s

  configure do
    # By default, Sinatra assumes that the root is the file that calls the
    # configure block. Since this is not the case for us, we set it manually.
    set :root, APP_ROOT.to_path
    # See: http://www.sinatrarb.com/faq.html#sessions
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] || 'S3ssi1onS3cr3t'

    # Set the views to
    set :views, File.join(Application.root, 'app', 'views')
  end

  Ohm.redis = Redic.new('redis://127.0.0.1:6379')

  # Set up the controllers, helpers and models
  Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
  Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
end
