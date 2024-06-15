// app/javascript/controllers/autofocus_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static target = ["collapseElement"]

  connect() {
    this.element.focus();

  }

  fire(){
    this.element.focus();
    console.log("hi")
  }

      // Remove focus from other elements
}
