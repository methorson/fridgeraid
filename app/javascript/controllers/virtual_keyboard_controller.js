<<<<<<< HEAD
=======

>>>>>>> 053354ac332785835a7e43ded3b495184af1ed26
import { Controller } from "@hotwired/stimulus"
import Keyboard from 'simple-keyboard';
// import 'simple-keyboard/build/css/index.css';
// import layout from 'simple-keyboard-layouts/build/layouts/japanese';

export default class extends Controller {
  static targets = ['search', 'keyboard']

  connect() {
    console.log('connected');
    this.keyboard = new Keyboard({
      onChange: input => this.onChange(input),
      onKeyPress: button => this.onKeyUp(button),
      // ...layout
    });

    // console.log('test', this.keyboard);
  }

  onChange(input) {
    console.log("search", this.searchTarget.value);

    if (this.searchTarget.value) {
      this.searchTarget.value = input;
      console.log("Input changed", input);
    }
  }

  openKeyboard() {
    this.keyboardTarget.classList.remove("d-none");
  }
  // onKeyPress(button) {
  //   console.log('Button pressed', button);
  // }
}
<<<<<<< HEAD
=======

>>>>>>> 053354ac332785835a7e43ded3b495184af1ed26
