import { Controller } from "@hotwired/stimulus";
import { DirectUpload } from "@rails/activestorage"

export default class extends Controller {
  static targets = ["progressbar", "mediaInput"]

  connect() {
    console.log(this.mediaInputTarget.dataset.directUploadUrl);
    console.log(this.progressbarTarget);
  }

  upload(){
    const uploader = new Uploader(this.mediaInputTarget.files[0], this.url)
    uploader.start()
    console.log(this.url);
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
    console.log(`${Math.round((event.loaded / event.total)* 100)} %`);
  }
}