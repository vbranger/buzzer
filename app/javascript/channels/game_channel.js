import { data } from "jquery";
import consumer from "./consumer";

const initGameCable = () => {
  const show = document.getElementById('show');
  const buzzsContainer = document.getElementById('buzzs');

  if (show) {
    const id = show.dataset.gameId;

    consumer.subscriptions.create({ channel: "GameChannel", id: id }, {
      connected() {
        console.log("hello from game channel"); 
      },
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        if (buzzsContainer) {
          buzzsContainer.insertAdjacentHTML('beforeend', data);
        }
      },
    });
  }
}

export { initGameCable };