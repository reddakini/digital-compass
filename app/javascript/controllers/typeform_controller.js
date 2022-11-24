import { Controller } from "@hotwired/stimulus"
import { createWidget } from '@typeform/embed'

// Connects to data-controller="typeform"
export default class extends Controller {
  connect() {
    // console.log("Hello Typeform");
    createWidget('wuDccAgU', { container: document.querySelector('#form') })
  }
}
