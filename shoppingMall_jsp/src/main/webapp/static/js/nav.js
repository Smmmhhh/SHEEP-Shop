window.onload = function() {
	var linkItems = document.querySelectorAll('.link-item');
	linkItems.forEach(function(item) {
		item.addEventListener('mouseenter', function() {
			this.classList.add('highlight');
		});
		item.addEventListener('mouseleave', function() {
			this.classList.remove('highlight');
		});
	});
};