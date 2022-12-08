import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["status", "edit", "payment", "welcome"]
  connect() {
  }

  welcome() {
    this.editTarget.classList.add('dashboard__edit__remove');
    this.paymentTarget.classList.add('dashboard__payment__remove');
    this.statusTarget.classList.add('dashboard__remove');
    this.welcomeTarget.classList.remove('dashboard__welcome__remove');
  }


  status() {
    this.welcomeTarget.classList.add('dashboard__welcome__remove');
    this.editTarget.classList.add('dashboard__edit__remove');
    this.paymentTarget.classList.add('dashboard__payment__remove');
    this.statusTarget.classList.remove('dashboard__remove');
  }

  edit() {
    this.welcomeTarget.classList.add('dashboard__welcome__remove');
    this.statusTarget.classList.add('dashboard__remove');
    this.paymentTarget.classList.add('dashboard__payment__remove');
    this.editTarget.classList.remove('dashboard__edit__remove');
  }

  payment() {
    this.welcomeTarget.classList.add('dashboard__welcome__remove');
    this.statusTarget.classList.add('dashboard__remove');
    this.editTarget.classList.add('dashboard__edit__remove');
    this.paymentTarget.classList.remove('dashboard__payment__remove');
  }
}
