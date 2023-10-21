class Public::PostsController < ApplicationController
before_action :authenticate_customer!, only: [:create]

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = "投稿完了"
      redirect_to  public_post_path(@post)
    else
      @posts = Post.all
      render :new
    end
  end

  def update
  end

  def index
    @posts = Post.all.page(params[:page]).per(10).order(created_at: :desc)
    # ↑page～(ページネーション)order～(新着順)
    @customers = Customer.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:introduction, :category, post_images: [])
  end

end
