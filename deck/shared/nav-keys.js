/* Relay keyboard nav to parent deck when slide iframe has focus */
document.addEventListener('keydown', (e) => {
  if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;
  switch (e.key) {
    case 'ArrowRight': case ' ': case 'PageDown': case 'ArrowDown':
      e.preventDefault();
      parent.postMessage('deck-next', '*');
      break;
    case 'ArrowLeft': case 'PageUp': case 'ArrowUp':
      e.preventDefault();
      parent.postMessage('deck-prev', '*');
      break;
  }
});
