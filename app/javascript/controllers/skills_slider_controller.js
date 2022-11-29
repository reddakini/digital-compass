import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="skills-slider"
export default class extends Controller {

  connect() {
    console.log("hello from my second stimulus controller")
  }

  sliderValue(event) {
    console.log(event.target.dataset.id);
    document.getElementById(`value-${event.target.dataset.id}`).innerText = event.target.value
  }
}
