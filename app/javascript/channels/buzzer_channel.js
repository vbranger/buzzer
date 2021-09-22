import consumer from "./consumer";

const initBuzzerCable = () => {
  const buzzer = document.getElementById('buzzer_component');
  const buzzerContainer = document.getElementById('buzzer_container');
  if (buzzer) {
    const id = buzzer.dataset.gameId;
    consumer.subscriptions.create({ channel: "BuzzerChannel", id: id }, {
      received(data) {
        // removing the buzzer
        buzzerContainer.innerHTML = '';
        // inserting a new one
        buzzerContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initBuzzerCable };