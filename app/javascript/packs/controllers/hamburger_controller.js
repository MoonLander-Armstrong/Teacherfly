import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["navbar", "button"];
  static values = {
    show: Boolean,
  };

  connect() {
    this.show = false;
  }
  toggleNavBar() {
    this.showValue = !this.showValue;
  }

  showValueChanged(current) {
    if (current) {
      this.element.parentElement.style.height = "360px";
    } else {
      this.element.parentElement.style.height = "88px";
    }
  }

  layout() {
    this.element.parentElement.style.height = "88px";
    this.showValue = false;
  }
}
