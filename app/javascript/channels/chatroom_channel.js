import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
	connected() {
	},

	disconnected() {
	},

	received(data) {
		let mc = $('#messages')

		let mc0 = mc[0]
		let userAtBottom = mc0.scrollTop + 16 > Math.floor(mc0.scrollHeight - mc.height())

		mc.append(data.body)

		// Scroll to bottom if the user is at bottom
		if (userAtBottom)
			mc.scrollTop(mc0.scrollHeight)
	}
})
