def last_post
  session[:post_id]
end

def last_post_path
  last_post ? "/posts/#{last_post}" : "/posts"
end
