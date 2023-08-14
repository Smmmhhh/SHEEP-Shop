 // 백엔드에서 가져온 데이터를 시뮬레이션한 배열
 var productsData = [
    { name: '상품1', price: 10000, quantity: 2, image: 'image/logo.png' },
    { name: '상품2', price: 20000, quantity: 3, image: 'image/coffee_image_1.jpg' },
    { name: '상품2', price: 20000, quantity: 3, image: 'image/coffee_image_1.jpg' }
];

// 백엔드로부터 가져온 데이터로 화면을 렌더링하는 함수
function renderProducts(products) {
    var buyTable = document.querySelector('#buyInfoTable');
    var tableContent = '';

    for (var i = 0; i < products.length; i++) {
        var product = products[i];
        tableContent += `
            <tr>
                <th>
             <div class="buydate">구매일자</div> <hr>
             <img src="${product.image}" alt="${product.name}">
          </th>
                <td>
                    <div><strong>제품명:</strong> ${product.name} </div>
                    <div><strong>가격:</strong> ${product.price}원</div>
                </td>
                <th>반품신청</th>
            </tr>`;
    }

    buyTable.innerHTML = tableContent;
}

// 화면이 로드되었을 때 실행
window.addEventListener('DOMContentLoaded', function() {
    renderProducts(productsData); // 백엔드로부터 가져온 데이터를 화면에 렌더링
});