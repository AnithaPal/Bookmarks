class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      flash[:notice] = "Topic was created successfully"
      redirect_to @topic
    else
      flash[:error] = "There was an error creating your topic. Please try again"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topics_params)
      flash[:notice] = "Topics was updated successfully"
      redirect_to @topic
    else
      flash[:error] = "There was an error updating your topic. Please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Topic was successfully deleted"
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting your topic. Please try again."
    end
  end


  private

  def topics_params
    params.require(:topic).permit(:title)
  end

end
