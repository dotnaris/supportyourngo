import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"]
  connect() {
  }

  updateNavbar(){
    if (window.scrollY >= this.navbarTarget.scrollHeight) {
      this.element.classList.add("navbar--white")
    } else {
      this.element.classList.remove("navbar--white")
    }
  }
}
