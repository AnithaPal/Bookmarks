class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @user = current_user
    @bookmark = Bookmark.new(bookmark_params)
    
    @bookmark.topic = @topic
    @bookmark.user = current_user
    if @bookmark.save
      flash[:notice] = "Bookmark was created successfully"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Sorry, there was an error creating your bookmark. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated successfully"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Sorry, there was an error updating your bookmark. Please try again."
      render :edit
    end
  end

  def destroy 
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully deleted"
      redirect_to topics_path
    else
      flash[:error] = "Sorry, there was an error deleting your bookmark. Please try again."
      render :show
    end
  end


private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
