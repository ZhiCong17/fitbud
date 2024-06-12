class ChatsController < ApplicationController
  def index
  end

  def message
    # raise
    @message = params[:message]
    @response = OpenAiService.call(@message)
    # did not declare render any page for this method
    # so default will be message.json.jbuilder
  end
end
