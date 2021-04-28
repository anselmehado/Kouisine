class PostsController < ApplicationController
  # def index
  # end
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def edit

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    #@post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "I edited the blog!"
    else
      render :edit
    end
  end

  def set_post
      @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"I deleted the blog!"
  end

  def confirm
      @post = current_user.posts.build(post_params)
      #@post = Post.new(post_params)
      render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end


end
