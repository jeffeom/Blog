class FavouritesController < ApplicationController
  def create
    fav      = current_user.favourites.new
    post     = Post.find params[:post_id]
    fav.post = post
    if fav.save
      redirect_to post_path(post), notice: "Favourited!"
    else
      redirect_to post_path(post), alert: "Error occured!"
    end
  end

  def destroy
    post     = Post.find params[:post_id]
    fav      = current_user.favourites.find params[:id]
    fav.destroy
    redirect_to post_path(post), notice: "Un-Favourited!"
  end
end
