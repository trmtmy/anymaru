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

  # @category = Post.looks(params[:search], params[:category])

  end

end
