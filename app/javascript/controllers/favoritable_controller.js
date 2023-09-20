import { Controller } from "@hotwired/stimulus"

  export default class extends Controller {

  static targets = ["liked", "unliked", "markedasdone", "markasdone", "mark_er"]
  static values = {
    likePath: String,
    unlikePath: String,
    markPath: String,
    unmarkPath: String,

  }
  connect(){
    console.log(this.likePathValue)
    // console.log(this.unlikedT)
  }
  like(){
    this.likedTargets.forEach( likedTarget => {
      likedTarget.classList.remove("d-none")
    });
    this.unlikedTargets.forEach( unlikedTarget => {
      unlikedTarget.classList.add("d-none")
  });

    fetch(this.likePathValue)
  }
  unlike(){
    this.unlikedTargets.forEach( unlikedTarget => {
      unlikedTarget.classList.remove("d-none")
    });
    this.likedTargets.forEach( likedTarget => {
      likedTarget.classList.add("d-none")
  });
    fetch(this.unlikePathValue)
    // current_user.favorite(book)
  }
  // mark_done_js(){
  //   console.log(this.markPathValue)
  //   fetch(this.markPathValue)
  //   this.markasdoneTarget.classList.add("d-none")
  //   this.markedasdoneTarget.classList.remove("d-none")
  // }

  // mark_undone_js(){
  //   fetch(this.unmarkPathValue)
  //   this.markedasdoneTarget.classList.add("d-none")
  //   this.markasdoneTarget.classList.remove("d-none")
  // }
  mark_js(){
    // console.log(this.mark_erTarget.style.color)

    var color =  ''
  if ( this.mark_erTarget.style.color== 'rgb(99, 230, 190)' ){
    fetch(this.unmarkPathValue)
    // this.mark_erTarget.style.color = 'rgb(187, 190, 195)'
    color =  'rgb(187, 190, 195)'
  }
  else{
    fetch(this.markPathValue)
    // this.mark_erTarget.style.color = 'rgb(99, 230, 190)'
    color = 'rgb(99, 230, 190)'
  }

  this.mark_erTarget.style.color = color
  if ( this.mark_erTarget.id.substring(0,5)== "index") {
    document.getElementById("modal" + this.mark_erTarget.id.substring(5)).style.color = color
  }
  else {
    document.getElementById("index" + this.mark_erTarget.id.substring(5)).style.color = color
  }
}
}
