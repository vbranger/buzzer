import { Controller } from 'stimulus'; 
export default class extends Controller {
  connect() {
    console.log("hello from StimulusJS")
  }

  buzz() {
    if (!this.element.classList.contains('buzzed') && !this.element.classList.contains('locked')) {
      console.log('buzz!')
      document.getElementById('buzz_buzzed').checked = true;
        document.getElementById('new_buzz').submit();
    } else {
      console.log('locked')
    }
  }
}