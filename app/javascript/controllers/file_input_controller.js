import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['input', 'background', 'instructions'];

  changeBackground() {
    this.loadImage();
    this.removeInstructions();
  }

  loadImage() {
    const input = this.inputTarget;
    let background = this.backgroundTarget;

    if(input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = () => {
        background.style.backgroundImage = `url(${reader.result})`;
        background.classList.add('bg-contain', 'bg-no-repeat', 'bg-contain', 'bg-center');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  removeInstructions() {
    this.instructionsTarget.classList.add('hidden');
  }
}
