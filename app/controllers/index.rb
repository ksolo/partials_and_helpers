# GET REQUESTS ================================================================
get '/' do
  @posts = Post.order('created_at DESC').limit(10)
  erb :posts
end

get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/posts/new' do
  erb :new
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  session[:post_id] = @post.id
  erb :show
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

# POST REQUESTS ===============================================================

post '/posts' do
  puts params.inspect
  @post = Post.new(params[:post])
  if @post.save
    redirect to "/posts/#{@post.id}"
  else
    erb :new
  end
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect to "/posts/#{@post.id}"
  else
    erb :edit
  end
end

post '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to '/posts'
end