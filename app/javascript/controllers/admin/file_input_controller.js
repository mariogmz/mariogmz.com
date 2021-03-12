import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['input', 'background', 'instructions', 'removeButton', 'deleteField'];

  changeBackground() {
    this.loadImage();
  }

  removeImage() {
    this.inputTarget.value = '';
    this.showInstructions();
    this.deleteFieldTarget.value = true;
  }

  loadImage() {
    const input = this.inputTarget;
    let background = this.backgroundTarget;

    if(input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = () => {
        background.style.backgroundImage = `url(${reader.result})`;
        background.classList.add('bg-contain', 'bg-no-repeat', 'bg-contain', 'bg-center');
        this.removeInstructions();
      }
      reader.readAsDataURL(input.files[0]);
    } else {
      this.showInstructions();
    }
  }

  removeInstructions() {
    this.removeButtonTarget.classList.remove('hidden');
    this.instructionsTarget.classList.add('hidden');
  }

  showInstructions() {
    this.backgroundTarget.classList.remove('bg-contain', 'bg-no-repeat', 'bg-contain', 'bg-center');
    this.backgroundTarget.style.backgroundImage = '';
    this.instructionsTarget.classList.remove('hidden');
    this.removeButtonTarget.classList.add('hidden');
  }
}
