<<<<<<< HEAD
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
=======
// import { Controller } from "@hotwired/stimulus"
// import Keyboard from 'simple-keyboard';
// import 'simple-keyboard/build/css/index.css';
// import layout from 'simple-keyboard-layouts/build/layouts/japanese';

// export default class extends Controller {
//   connect() {
//     this.keyboard = new Keyboard({
//       onChange: input => this.onChange(input),
//       onKeyPress: button => this.onKeyPress(button),
//       ...layout
//     });
//   }

//   onChange(input) {
//     const inputElement = document.querySelector('.input');
//     if (inputElement) {
//       inputElement.value = input;
//       console.log('Input changed', input);
//     }
//   }

//   onKeyPress(button) {
//     console.log('Button pressed', button);
//   }
// }
>>>>>>> 8b4db7d42962034ebe01b1629a8f35867613781d
