class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:bookmarks]

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.order(created_at: :desc)
    @bookmarks_posts = @customer.bookmarked_posts.order(created_at: :desc)
    @post = Post.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        flash[:notice] = "会員情報を更新しました。"
        redirect_to  public_customer_path(current_customer.id)
      else
        render :edit
      end
  end

  def bookmarks
    @customer = Customer.find(params[:id])
    bookmarks = Bookmark.where(customer_id: @customer.id).pluck(:post_id)
    @bookmarks_posts = Post.find(bookmarks)
  end

  def confirm
  end

  def is_withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end



  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :name, :email, :profile, :area, :image)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end


end
