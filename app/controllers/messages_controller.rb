class MessagesController < ApplicationController

  before_action:authenticate_user! , only:[:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id].present?)
      @message = Message.create(params.require(:message).permit(:user_id , :body , :room_id).merge(user_id: current_user.id))
    end
  redirect_to request.referer
  end

end
