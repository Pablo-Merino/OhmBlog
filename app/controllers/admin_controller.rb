class AdminController < BaseController
  use Rack::Auth::Basic, 'Restricted Area' do |username, password|
    [username, password] == %w(admin admin)
  end
  
  get '/posts' do
    @posts = Post.all
    haml :'admin/posts'
  end

  get '/posts/new' do
    haml :'admin/new_post'
  end

  post '/posts/new' do
    post = Post.new(params)
    post.cover_post = params[:cover_post] == 'on' ? true : false

    other_cover_posts = Post.find(cover_post: true).entries
    if other_cover_posts != 0
      other_cover_posts.each do |p|
        p.cover_post = false
        p.save
      end
    end

    if post.save
      redirect to('/posts')
    else
      haml :'admin/new_post'
    end
  end

  get '/posts/:id' do
    haml :'admin/view_post'
  end
end
