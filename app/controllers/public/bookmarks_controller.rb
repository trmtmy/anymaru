class Public::BookmarksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @bookmark = current_customer.bookmarks.build(post: @post)
    pp "@bookmarks-----------------------------#{@bookmark.inspect}"
    if @bookmark.save
      pp "saved---------------------------------------------"
      render 'create'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = current_customer.bookmarks.find_by(post_id: @post.id)
    @bookmark.destroy
    render 'destroy'
  end

end
