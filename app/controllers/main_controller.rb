class MainController < BaseController
  get '/' do
    haml :index
  end

  get '/:slug' do
    
  end
end
