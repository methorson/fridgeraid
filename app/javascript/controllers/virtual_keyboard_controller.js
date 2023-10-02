import { Controller } from "@hotwired/stimulus";
import Keyboard from 'simple-keyboard';

export default class extends Controller {
  static targets = ['search', 'keyboard'];

  connect() {
    console.log('connected');
    this.keyboard = new Keyboard({
      onChange: input => this.onChange(input),
      onKeyPress: button => this.onKeyPress(button),
    });

    // Add an event listener for the "keyboard.show" event
    this.keyboardTarget.addEventListener('keyboard.show', () => {
      this.onShow();
    });
  }

  onShow() {
    // Call separate methods for showing the keyboard and applying the blur effect
    this.showKeyboard();
    this.applyBlurEffect();
  }

  showKeyboard() {
    const keyboard = this.keyboardTarget;
    console.log('Keyboard target:', keyboard);
    keyboard.classList.remove('d-none');
    this.applyBlurEffect();
  }

  applyBlurEffect() {
    const container = document.querySelector('.container'); // Adjust the selector accordingly
    container.style.filter = 'blur(5px)';
  }

  onChange(input) {
    console.log("search", this.searchTarget.value);
    if (this.searchTarget.value) {
      this.searchTarget.value = input;
      console.log("Input changed", input);
    }
  }

  onKeyPress(button) {
    console.log('Button pressed', button);
    // Add any keyboard-related logic here
  }
}
