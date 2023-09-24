import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-ingredients"
export default class extends Controller {
  connect() {

  }
  delete(event){
    console.log(event.currentTarget)
    const button = event.currentTarget
    const path = button.dataset['path']
    console.log(path)
    const csrfToken = document .querySelector("meta[name='csrf-token']") .getAttribute("content");
    fetch(path, {
      method: "DELETE",
      headers: {
        "X-CSRF-Token": csrfToken
      }
    });
  }
}
