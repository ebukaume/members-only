class PostsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
  end

  def index
    @user = current_user
    @posts = Post.all
  end
end
