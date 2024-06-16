// app/javascript/controllers/autofocus_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static target = ["collapseElement"]
  focus(event) {
    const collapseId = event.currentTarget.getAttribute("data-bs-target");
    const collapseElement = document.querySelector(collapseId);
    console.log(collapseId)
    setTimeout(() => {
      collapseElement.focus();
      collapseElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }, 100);
  }
}
