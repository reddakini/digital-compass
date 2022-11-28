import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    // console.log("hi from the controller");
    var typed3 = new Typed(this.element, {
      strings: [
        'Finding a path into Tech...',
        'Find YOUR path into Tech !'
      ],
      typeSpeed: 40,
      backSpeed: 40,
      smartBackspace: true, // this is a default
      loop: true
    })
  }
}
