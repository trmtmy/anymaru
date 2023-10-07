class Public::BookmarksController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @bookmark = current_customer.bookmarks.build(post: @post)
    @bookmark.save
      render 'create'
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = current_customer.bookmarks.find_by(post_id: @post.id)
    @bookmark.destroy
    render 'destroy'
  end

end
