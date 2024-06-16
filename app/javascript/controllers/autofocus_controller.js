// app/javascript/controllers/autofocus_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

   connect() {
    console.log(this.element)
     setTimeout(() => {
       this.element.focus();
     });

   }
}
