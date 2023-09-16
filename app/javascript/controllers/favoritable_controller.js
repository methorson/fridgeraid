import { Controller } from "@hotwired/stimulus"

  export default class extends Controller {

  static targets = ["liked", "unliked"]
  static values = {
    likePath: String,
    unlikePath: String,
    markPath: String,
  }
  connect(){
    console.log(this.likePathValue)
    // console.log(this.unlikedT)
  }
  like(){
    this.likedTarget.classList.remove("d-none")
    this.unlikedTarget.classList.add("d-none")
    // current_user.favorite(book)
    fetch(this.likePathValue)
  }
  unlike(){
    this.likedTarget.classList.add("d-none")
    this.unlikedTarget.classList.remove("d-none")
    fetch(this.unlikePathValue)
    // current_user.favorite(book)
  }
  mark(){
    console.log(this.markPathValue)
    fetch(this.markPathValue)
    // current_user.favorite(book)
  }

}
