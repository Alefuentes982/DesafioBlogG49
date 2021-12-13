class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "12345", only: :dashboard
  
  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(title: params[:title], image_url: params[:image_url], content: params[:content])
  end

  def dashboard
  end

end
