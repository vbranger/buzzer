const initBuzzer = () => {
  const buzzer = document.getElementById('buzzer');
  buzzer.addEventListener('click', function() {
    document.getElementById('buzz_buzzed').checked = true;
    document.getElementById('new_buzz').submit();
  })
}

export { initBuzzer }