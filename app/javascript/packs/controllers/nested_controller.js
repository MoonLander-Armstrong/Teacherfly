import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["comments", "action"]
  
  appear(){
    this.commentsTarget.style.display = "block"
  }
}
