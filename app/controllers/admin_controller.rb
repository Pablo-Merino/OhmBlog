class AdminController < BaseController
  use Rack::Auth::Basic, 'Restricted Area' do |username, password|
    [username, password] == %w(admin admin)
  end
  
  get do
    @posts = Post.all
    haml :'admin/posts'
  end

  get '/posts/:id' do
    haml :'admin/view_post'
  end

  get '/posts/new' do
    haml :'admin/new_post'
  end
end
