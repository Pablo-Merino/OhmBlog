class Application < Sinatra::Application
  get '/admin' do
    'admin'
  end
end