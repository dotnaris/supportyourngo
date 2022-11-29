import { Controller } from "@hotwired/stimulus"


const classEnvironment = ["card__description left__description left__description__environment__active"]
const hideClassEnvironment = ["card__description left__description left__description__environment"]

const classEducation = ["card__description left__description left__description__education__active"]
const hideClassEducation = ["card__description left__description left__description__education"]

const classCulture = ["card__description left__description left__description__culture__active"]
const hideClassCulture = ["card__description left__description left__description__culture"]

const classAnimal = ["card__description left__description left__description__animal__active"]
const hideClassAnimal = ["card__description left__description left__description__animal"]

// Connects to data-controller="card"
export default class extends Controller {
  static targets = ["environment", "education", "culture", "animal"]
  connect() {
    console.log("hello from card")
    console.log(this.element.parentElement.parentElement.children[0].children[1])
    console.log(this.element.parentElement.parentElement.children[0].children[2])
    console.log(this.element.parentElement.parentElement.children[0].children[3])
    console.log(this.element.parentElement.parentElement.children[0].children[4])
  }

  environment() {
    this.element.parentElement.parentElement.children[0].children[2].setAttribute('class', `${hideClassEducation}`)
    this.element.parentElement.parentElement.children[0].children[3].setAttribute('class', `${hideClassCulture}`)
    this.element.parentElement.parentElement.children[0].children[4].setAttribute('class', `${hideClassAnimal}`)
    this.element.parentElement.parentElement.children[0].children[1].setAttribute('class', `${classEnvironment}`)
  }

  education() {
    this.element.children[0].children[1].setAttribute('class', `${hideClassEnvironment}`)
    this.element.children[0].children[3].setAttribute('class', `${hideClassCulture}`)
    this.element.children[0].children[4].setAttribute('class', `${hideClassAnimal}`)
    this.element.children[0].children[2].setAttribute('class', `${classEducation}`)
  }

  culture() {
    this.element.children[0].children[1].setAttribute('class', `${hideClassEnvironment}`)
    this.element.children[0].children[4].setAttribute('class', `${hideClassAnimal}`)
    this.element.children[0].children[2].setAttribute('class', `${hideClassEducation}`)
    this.element.children[0].children[3].setAttribute('class', `${classCulture}`)
  }

  animal() {
    this.element.children[0].children[1].setAttribute('class', `${hideClassEnvironment}`)
    this.element.children[0].children[2].setAttribute('class', `${hideClassEducation}`)
    this.element.children[0].children[3].setAttribute('class', `${hideClassCulture}`)
    this.element.children[0].children[4].setAttribute('class', `${classAnimal}`)
  }
}
