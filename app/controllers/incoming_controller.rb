class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @url = params["stripped-text"]

    if @user.nil?
      @user = User.new(email: params[:sender], name: "Guest", password: "temp0rary_passw0rd")
      @user.skip_confirmation!
      @user.save!
     end

    if @topic.nil?
      @topic = @user.topics.create(title: params[:subject])
    end

    @bookmark = @topic.bookmarks.create!(url: @url, user: @user)

    head 200
  end
end
