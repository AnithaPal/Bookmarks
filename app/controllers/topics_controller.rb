class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user = current_user
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was created successfully"
      redirect_to @topic
    else
      flash[:error] = "Sorry, there was an error creating your topic. Please try again"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topics_params)
      flash[:notice] = "Topics was updated successfully"
      redirect_to @topic
    else
      flash[:error] = "Sorry, there was an error updating your topic. Please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "Topic was successfully deleted"
      redirect_to topics_path
    else
      flash[:error] = "Sorry, there was an error deleting your topic. Please try again."
    end
  end


  private

  def topics_params
    params.require(:topic).permit(:title)
  end

end
