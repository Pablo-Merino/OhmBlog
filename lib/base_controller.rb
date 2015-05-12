class BaseController < Sinatra::Application
  configure do
    # By default, Sinatra assumes that the root is the file that calls the
    # configure block. Since this is not the case for us, we set it manually.
    set :root, APP_ROOT.to_path
    # See: http://www.sinatrarb.com/faq.html#sessions
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] || 'S3ssi1onS3cr3t'

    # Set the views to
    set :views, File.join(self.root, 'app', 'views')
  end
end