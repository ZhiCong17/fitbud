// app/javascript/controllers/autofocus_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { currentDay: Number }
  connect() {
    const index = parseInt(this.element.dataset.index);
    if (index + 1 === this.currentDayValue) {
      setTimeout(() => {
              this.element.focus();
            }, 100);
    }
  }
}
