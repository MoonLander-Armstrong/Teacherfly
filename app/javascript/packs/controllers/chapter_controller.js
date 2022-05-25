import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["chapterForm"];

  toggle() {
    this.chapterFormTarget.classList.toggle("hidden");
  }

  send() {
    this.chapterFormTarget.classList.add("hidden");
  }
}
