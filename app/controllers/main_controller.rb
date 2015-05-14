class MainController < BaseController
  get '/' do
    @featured_post = Post.find(cover_post: true)
    @posts = Post.all
    haml :index
  end

  get '/:slug' do
    
  end
end
