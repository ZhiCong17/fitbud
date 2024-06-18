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

  def self.message(user)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "
        Give me motivation message.
        about doing workout.
        for a gym beginner
        based on #{user.gender}
        maximum 10 words.
        without any of your own answer.
        Must responce in Json format"
      }]
    })
    # JSON.parse(chaptgpt_response["choices"][0]["message"]["content"])
    # Extract the content string
    content_string = chaptgpt_response["choices"][0]["message"]["content"]

    # Parse the JSON content string into a Ruby hash
    parsed_content = JSON.parse(content_string)

    # Extract the message field
    parsed_content["message"]
  end
end
