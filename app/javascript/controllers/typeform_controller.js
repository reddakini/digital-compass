import { Controller } from "@hotwired/stimulus"
import { createWidget } from '@typeform/embed'
import '@typeform/embed/build/css/widget.css'

// Connects to data-controller="typeform"
export default class extends Controller {
  connect() {
    console.log("Hello Typeform");
    createWidget('<form-id>', { container: document.querySelector('#form') })
  }
}
