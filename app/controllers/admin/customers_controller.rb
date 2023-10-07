class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.posts.includes(:comments)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
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
    params.require(:customer).permit(:is_deleted, :name, :profile, :area, :image)
  end

end