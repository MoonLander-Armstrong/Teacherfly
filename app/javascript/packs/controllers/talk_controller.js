import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["opinion"]

  fight(){
    console.log(123);
    this.opinionTarget.value = ''
  }
}