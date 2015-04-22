class Application < Sinatra::Application
  use Rack::Auth::Basic, 'Restricted Area' do |username, password|
    [username, password] == %w(admin admin)
  end

  namespace '/admin' do
    get do
      haml :'admin/index'
    end
  end
end
