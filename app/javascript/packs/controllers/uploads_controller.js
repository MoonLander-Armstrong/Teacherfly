import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage"

export default class extends Controller {
  static targets = ["progressbar", "mediaInput"]

  upload(){
    const uploader = new Uploader(this.mediaInputTarget.files[0], this.url);
    uploader.start()
    document.getElementById("progressPercent").classList.toggle("hidden")
  }


  get url(){
    return this.mediaInputTarget.dataset.directUploadUrl
  }
}


class Uploader {
  constructor(file, url) {
    this.uploader = new DirectUpload(file, url, this)
    this.file = file
    this.url = url
  }

  start() {
    this.uploader.create((error, blob) => {
      if (error) {
        console.log(error);
        // Handle the error
      } else {
        console.log(blob);
        // Add an appropriately-named hidden input to the form
        // with a value of blob.signed_id
      }
    })
  }


  directUploadWillStoreFileWithXHR(request) {
    request.upload.addEventListener("progress",
      event => this.directUploadDidProgress(event))
  }

  directUploadDidProgress(event) {
    // Use event.loaded and event.total to update the progress bar
    document.getElementById("upload-progressbar").style.width = `${Math.round((event.loaded / event.total)* 100)}%`
    document.getElementById("progressPercent").textContent = `${Math.round((event.loaded / event.total)* 100)}%` 
  }
}