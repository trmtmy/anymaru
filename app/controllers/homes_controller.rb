class HomesController < ApplicationController
  def top
  end

  def notes
    @post = Post.new
  end
end
