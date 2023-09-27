import { Controller } from "@hotwired/stimulus"
import Keyboard from 'simple-keyboard';
import 'simple-keyboard/build/css/index.css';
import layout from 'simple-keyboard-layouts/build/layouts/japanese';

export default class extends Controller {
  connect() {
    this.keyboard = new Keyboard({
      onChange: input => this.onChange(input),
      onKeyPress: button => this.onKeyPress(button),
      ...layout
    });
  }

  onChange(input) {
    const inputElement = document.querySelector('.input');
    if (inputElement) {
      inputElement.value = input;
      console.log('Input changed', input);
    }
  }

  onKeyPress(button) {
    console.log('Button pressed', button);
  }
}
