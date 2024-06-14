import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bot-message"
export default class extends Controller {
  static targets = [ "answer", "prompt" ]

  connect() {
    console.log("bot message connected");
    console.log(this.promptTarget);
    console.log(this.answerTarget);
  }

  genResponse(event) {
    event.preventDefault();
    console.log("genResponse called");
    // console.log(event.currentTarget)
    // console.log(event.currentTarget.message.value)
    const inputMessage = event.currentTarget.message.value;
    this.answerTarget.insertAdjacentHTML("beforeend", this.formatUserMessage(inputMessage));
    event.currentTarget.message.value = "";
    // const url = '/chats/message';
    const url = event.currentTarget.action;
    const requestDetails = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        // need this because Rails expects a CSRF token, and token in form is not available because converted to json
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ "message": inputMessage })
    }

    fetch(url, requestDetails)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        console.log(data.response.choices[0].message.content);
        // const answerFromBot = data["response"]["choices"][0]["message"]["content"];
        const answerFromBot = data.response.choices[0].message.content ;

        // this.answerTarget.innerHTML = answerFromBot;
        // this.answerTarget.insertAdjacentHTML("beforeend", this.formatBotMessage(answerFromBot));
        // this.answerTarget.scrollTo(0, this.answerTarget.scrollHeight);

        this.#insertMessageAndScrollDown(this.formatBotMessage(answerFromBot));
      })

  }

  #insertMessageAndScrollDown(message) {
    this.answerTarget.insertAdjacentHTML("beforeend", message)
    this.answerTarget.scrollTo(0, this.answerTarget.scrollHeight)
  }

  formatBotMessage(message) {
    return `<div class="bot-message d-flex mb-2">${message}</div>`;
  }

  formatUserMessage(message) {
    return `<div class="user-message d-flex justify-content-end mb-2">${message}</div>`;
  }
}
