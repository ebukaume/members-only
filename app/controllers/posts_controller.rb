class PostsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  
  def new
    @post = Post.new
    debugger
  end

  def create

  end

  def index
    @posts = Post.all
  end
end
