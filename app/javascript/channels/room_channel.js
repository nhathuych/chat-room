import consumer from "./consumer"

// on room switched event
// data-turbolinks-track file included at application.html.erb
document.addEventListener('turbolinks:load', () => {
  const roomId = Number(document.getElementById('js-room-id').getAttribute('data-room-id'))
  const msgContainer = document.getElementById('js-messages-container')

  disconnectAllChannel(consumer)

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(`Room ${roomId} connected...`)
      if (msgContainer) msgContainer.scrollTop = msgContainer.scrollHeight
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const userId = Number(document.getElementById('js-user-id').getAttribute('data-user-id'))
      const html = (userId == data.message.user_id) ? data.mine : data.theirs
      const msgInput = document.getElementById('message_body')

      console.log(html)
      msgContainer.innerHTML += html
      msgContainer.scrollTop = msgContainer.scrollHeight
      msgInput.value = ''
      msgInput.focus()
    }
  })
})

function disconnectAllChannel(consumer) {
  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
}
