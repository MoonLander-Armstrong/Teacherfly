import { Controller } from "@hotwired/stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["finishedIcon", "unfinishedIcon"];

  connect() {
    const sendWidth = new CustomEvent("sendWidth", {
      detail: { progressBarWidth: "0%" },
    });
    this.sendWidthEvent = sendWidth;
  }

  toggleFinished(e) {
    const { finishedIconTarget, unfinishedIconTarget, sendWidthEvent } = this;
    const data = new FormData();
    data.append("finished", `${e.target.checked}`);

    Rails.ajax({
      url: `/api/v1/courses/${this.element.dataset.courseId}/sections/${this.element.dataset.sectionId}/finished`,
      type: "patch",
      data,
      success: function ({ progress, finished }) {
        if (finished) {
          finishedIconTarget.classList.remove("hidden");
          unfinishedIconTarget.classList.add("hidden");
          sendWidthEvent.detail.progressBarWidth = progress;
          document.dispatchEvent(sendWidthEvent);
        } else {
          finishedIconTarget.classList.add("hidden");
          unfinishedIconTarget.classList.remove("hidden");
          sendWidthEvent.detail.progressBarWidth = progress;
          document.dispatchEvent(sendWidthEvent);
        }
      },
    });
  }
}
