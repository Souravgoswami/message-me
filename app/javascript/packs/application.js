require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
window.$ = $

import 'semantic-ui-sass'

document.addEventListener('turbolinks:load', () => {
	$('.ui.dropdown').dropdown()
})
