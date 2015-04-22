class Application < Sinatra::Application
  get '/' do
    haml :index
  end

  get '/:slug' do
    
  end
end
