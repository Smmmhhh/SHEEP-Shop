var navLinks;
// 페이지가 로드될 때 실행될 함수
window.onload = function() {
	// <nav> 요소의 모든 <a> 태그 요소를 가져옴
	var navLinks = document.querySelectorAll("nav a");

	// 가져온 링크 요소들을 순회하며 클릭 이벤트 추가
	navLinks.forEach(function(link) {
		link.addEventListener("click", showEdit);
	});
}

// 네비게이션 버튼 클릭 시 실행될 함수
function showEdit(event) {
	// 클릭된 링크의 텍스트 내용을 가져옴
	var linkText = event.target.textContent;

	// <div class="text"> 요소를 가져와 텍스트 내용을 변경
	var textDiv = document.querySelector(".text");
	textDiv.textContent = linkText;

	// 기본 동작 중지
	event.preventDefault();
}
