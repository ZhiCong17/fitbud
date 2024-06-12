class ChatsController < ApplicationController
  def index
  end

  def message
    @message = params[:message]
    @response = OpenAiService.call(@message)
  end
end
