import { Controller } from "@hotwired/stimulus"
let counter = 0;
// Connects to data-controller="burger"
export default class extends Controller {
  static targets = ["burger"]
  connect() {
  }

  show() {
    console.dir(this.element.firstElementChild);
    this.element.firstElementChild.setAttribute('class', 'burger__menu__contents active');
  }

  hide() {
    console.dir(this.element.firstElementChild);
    this.element.firstElementChild.setAttribute('class', 'burger__menu__contents');
  }
}
