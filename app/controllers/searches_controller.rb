class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
      if @range == "Customer"
        @customers = Customer.looks(params[:search], params[:word])
      else
        @posts = Post.looks(params[:search], params[:word])
      end
    @content = params[:content]
  end

  def category_search
    # categoryテーブル内の検索を行う
    @posts = Post.where(category: params[:category])
    render :search
  end


end
