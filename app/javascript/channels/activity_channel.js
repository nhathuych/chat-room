import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    this.perform("appear") // method appear of ActivityChannel called
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let eleUserStatus = document.querySelectorAll(`.js-user-${data.user_id}-status`)
    let isOnline = data.status == 'online'

    eleUserStatus.forEach(element => {
      isOnline ? element.classList.add('online') : element.classList.remove('online')
    })
  }
})
