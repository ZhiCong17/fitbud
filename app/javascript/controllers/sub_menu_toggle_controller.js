import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sub-menu-toggle"
export default class extends Controller {
static targets = ["subMenu"]

  connect() {
    console.log("connected");
  }

  display() {
    this.subMenuTarget.classList.toggle("show");
  }

}
