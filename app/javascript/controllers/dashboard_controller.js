import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["status"]
  connect() {
  }

  status() {
    console.log(this.statusTarget)
  }
}
