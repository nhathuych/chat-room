import consumer from "./consumer"

// room switched
document.addEventListener('turbolinks:load', () => {
  const roomId = Number(document.getElementById('js-room-id').getAttribute('data-room-id'))

  disconnectAllChannel(consumer)

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: roomId }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(`room ${roomId} connected...`)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const userId = Number(document.getElementById('js-user-id').getAttribute('data-user-id'))
      const html = (userId == data.message.user_id) ? data.mine : data.theirs
      const msgContainer = document.getElementById('js-messages-container')
      const msgInput = document.getElementById('message_body')

      console.log(html)
      msgContainer.innerHTML += html
      msgInput.value = ''
      msgInput.focus()
    }
  })
})

function disconnectAllChannel(consumer) {
  console.log(consumer.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
}
