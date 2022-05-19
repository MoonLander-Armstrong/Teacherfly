import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["comments"]
  
  appear(){
    this.commentsTarget.style.display = "block"
  }

  disappear(){
    this.commentsTarget.style.display = "none"
  }
}
