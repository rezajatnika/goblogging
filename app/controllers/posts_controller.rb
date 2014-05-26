class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :destroy, :update]
  before_action :require_login, only: [:new, :create, :edit, :destroy]

  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # GET /posts/1
  def show
    @comment = Comment.new
    @comment.post = @post
  end

  # POST /posts/1
  def create
    @user = current_user
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created!'
    else
      render 'new'
    end
  end

  # PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated!'
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post deleted!'
  end

  private

  # Callback for @post, befor_action method
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  # Strong params
  def post_params
    post_attr = [:title, :content]
    params.require(:post).permit(*post_attr)
  end
end
