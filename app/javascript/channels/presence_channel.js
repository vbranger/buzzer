import consumer from "./consumer";

const initPresenceCable = () => {
  const presenceContainer = document.getElementById("presence-container");
  console.log('init presence cable')
  if (presenceContainer) {
    const id = presenceContainer.dataset.gameId;
    console.log('inside presence cable')
    consumer.subscriptions.create({ channel: "PresenceChannel", id: id }, {
      connected() {
        console.log("hello from presence channel"); 
      },
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
      disconnect() {
        console.log('disconnected from inside');
      }
    });
  }
  else {
    console.log('disconnect')
    // window.cable.subscriptions.consumer.disconnect();
  }
}

export { initPresenceCable };