class Application < Sinatra::Application
  get '/' do
    haml :index
  end
end
