class OpenAiService
  def self.call(prompt)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "#{prompt}.
        Give me only the answer ralated to fitness,
        without any of your own answer'.
        Answer 'Please ask correct question' if the question is not related to fitness."
        }]
    })
  end
  # chaptgpt_response["choices"][0]["message"]["content"]

  # def self.message
  #   client = OpenAI::Client.new
  #   chaptgpt_response = client.chat(parameters: {
  #     model: "gpt-3.5-turbo",
  #     messages: [{ role: "user", content: "
  #       Give me encourage message,
  #       only in 1 sentence.
  #       without any of your own answer'."
  #       }]
  #     })
  # end
end
