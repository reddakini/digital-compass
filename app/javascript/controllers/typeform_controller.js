import { Controller } from "@hotwired/stimulus"
import { createWidget } from '@typeform/embed'
import '@typeform/embed/build/css/widget.css'
createWidget('<form-id>', { container: document.querySelector('#form') })

// Connects to data-controller="typeform"
export default class extends Controller {
  connect() {
    console.log("Hello Typeform");
  }
}
