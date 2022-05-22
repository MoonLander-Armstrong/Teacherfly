import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["commentForm"];

  toggle() {
    this.commentFormTarget.classList.toggle("hidden");
  }

  send() {
    this.commentFormTarget.classList.add("hidden");
  }
}
