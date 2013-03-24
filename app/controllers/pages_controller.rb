class PagesController < ApplicationController

  def home
  end

  def essays
    @posts = Post.all
  end
end
