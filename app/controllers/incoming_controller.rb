class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     puts "INCOMING PARAMS HERE: #{params}"
     @user = User.find_by(email: params[:sender])
     @topic = Topic.find_by(title: params[:subject])
     @url = params["body_plain"]


     head 200

  end

end
