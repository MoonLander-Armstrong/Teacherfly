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
      this.navbarTarget.classList.add("show-animation");
      this.navbarTarget.classList.remove("fade-animation");
    } else {
      this.navbarTarget.classList.add("fade-animation");
      this.navbarTarget.classList.remove("show-animation");
    }
  }
}
