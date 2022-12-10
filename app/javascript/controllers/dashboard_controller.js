import { Controller } from "@hotwired/stimulus"

let counter1 = 0
let counter2 = 0

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["status", "edit", "payment", "welcome", "editUserInfo", "editProjectInfo"]
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

  editUserInfo() {
    if (counter1 === 0 ) {
      this.editUserInfoTarget.classList.add('dashboard__welcome__card__profile__edit__section__hide__and__show')
      counter1 += 1;
    } else {
      this.editUserInfoTarget.classList.remove('dashboard__welcome__card__profile__edit__section__hide__and__show')
      counter1 = 0;
    }
  }

  // dashboard__edit__section__edit__hide__and__show{

  editProjectInfo() {
    console.dir(this.editProjectInfoTarget.classList);
    if (counter2 === 0 ) {
      this.editProjectInfoTarget.classList.add('dashboard__edit__section__edit__hide__and__show')
      counter2 += 1;
    } else {
      this.editProjectInfoTarget.classList.remove('dashboard__edit__section__edit__hide__and__show')
      counter2 = 0;
    }
  }
}
