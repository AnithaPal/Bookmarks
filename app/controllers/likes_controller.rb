class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    if like.save!
      flash[:notice] = "You like this bookmark!"
    else
      flash[:error] = "Sorry, there was an error liking that bookmark. Pleasee try again"
    end
    redirect_to request.referer
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like
    if like.destroy
      flash[:notice] = "You unlike this bookmark!"
    else
      flash[:error] = "Sorry, there was an error unliking that bookmark. Please try again"
    end
    redirect_to request.referer
  end

end
