import { Turbo } from '@hotwired/turbo-rails';
import 'flowbite';

Turbo.start()

window.document.addEventListener("turbo:render", (_event) => {
  window.initFlowbite();
});

// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')
