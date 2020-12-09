import consumer from "./consumer";

const initGameCable = () => {
  const buzzsContainer = document.getElementById('buzzs');
  if (buzzsContainer) {
    const id = buzzsContainer.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        buzzsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initGameCable };