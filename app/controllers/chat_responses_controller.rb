class ChatResponsesController < ApplicationController
  include ActionController::Live

  def show
    # response.headers['Content-Type'] = 'text/event-stream'
    # response.headers['Last-Modified'] = Time.now.httpdate
    # sse = SSE.new(response.stream, event:'message')
    # client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    # begin

    #   client.chat
    # end
    # client = OpenAI::Client.new
    # chaptgpt_response = client.chat(parameters: {
    #   model: "gpt-3.5-turbo",
    #   messages: [{role:"user", content: "give me the pokemon with number 25.Give me only the text of the answer, without any of your own answer like 'Here is a simple recipe'."}]
    #   # messages: [{ role: "user", content: "Give me a simple recipe for #{@recipe.name} with the ingredients #{@recipe.ingredients}. Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'."}]
    # })
    # @content = chaptgpt_response["choices"][0]["message"]["content"]
end
