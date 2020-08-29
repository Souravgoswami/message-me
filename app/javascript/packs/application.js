require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
import 'bootstrap'
window.$ = $


document.addEventListener('turbolinks:load', () => {
	$('[data-toggle="tooltip"]').tooltip({
		trigger: 'hover'
	}).click(function() { $(this).tooltip('hide') })
	$('[data-toggle="popover"]').popover()

	var mc = $('#messages')
	var mc0 = mc[0]
	var height = mc0.scrollHeight - mc.height(), j = 0, k = 0

	var interval = setInterval(() => {
		mc.scrollTop(j += k++)
		if(j > height) clearInterval(interval)
	}, 10)
})
