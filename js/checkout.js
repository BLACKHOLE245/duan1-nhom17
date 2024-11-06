document.addEventListener('DOMContentLoaded', function () {
    var cartItems = [];
    var cartContainer = document.getElementById('cart-container');
    var totalQuantityElement = document.querySelector('.total-products span');
    var hiddenInput = document.getElementById('hidden-cart-input');

    var storedCartItems = JSON.parse(localStorage.getItem('cartItems'));
    if (storedCartItems) {
        cartItems = storedCartItems;
        renderCart();
        updateCartTotal();
    } else {
        cartContainer.innerHTML = "<p>Giỏ hàng trống !!</p>";
    }

    function updateLocalStorage() {
        try {
            if (typeof Storage !== "undefined") {
                if (cartItems && cartItems.length > 0) {
                    localStorage.setItem('cartItems', JSON.stringify(cartItems));
                } else {
                    localStorage.removeItem('cartItems');
                }
            } else {
                console.error("Trình duyệt không hỗ trợ localStorage.");
            }
        } catch (error) {
            console.error("Lỗi khi lưu vào localStorage: " + error.message);
        }
    }

    function updateHiddenInput() {
        var hiddenInputValue = "";

        if (cartItems.length > 0) {
            cartItems.forEach(function (item, index) {
                var itemString = `<strong>${item.name}</strong>, Size: ${item.size}, SL: ${item.quantity}`;

                if (index < cartItems.length - 1) {
                    itemString += ' ||==|| ';
                }

                hiddenInputValue += itemString;
            });
        }

        hiddenInput.value = hiddenInputValue;

        updateLocalStorage();
    }

    function updateCartTotal() {
        var totalQuantity = calculateTotalQuantity();
        totalQuantityElement.textContent = totalQuantity;
    }

    function renderCart() {
        cartContainer.innerHTML = '';

        if (cartItems.length === 0) {
            cartContainer.innerHTML = '<p>Giỏ hàng trống !!</p>';
        } else {
            var totalQuantity = 0;
            var totalPrice = 0;

            cartItems.forEach(function (item, index) {
                var cartItemElement = document.createElement('div');
                cartItemElement.classList.add('cart-item');

                var itemHTML = `
                    <div class="cart-item">
                        <img class="product-img" src="${item.image}" alt="product-img">
                       
                        <div class="body-item">
                            <div class="info-left">
                                <p class="product-name" name="product_name">${item.name}</p>
                                <p class="product-info product-size" name="size_name">Kích thước: ${item.size}</p>
                                <p class="product-info product-price" name="product_price">Tạm tính: <span class="item-total-price"> ${formatPriceDetail(parseFloat(item.price) * parseInt(item.quantity))} </span></p>
                                <div class="quantity-controls">
                                    <button class="quantity-decrement" data-index="${index}">-</button>
                                    <input class="quantity-input" type="number" class="quantity-input" data-index="${index}" value="${item.quantity}" min="1">
                                    <button class="quantity-increment" data-index="${index}">+</button>
                                </div>
                            </div>

                            <div class="container-delete">
                                <button class="delete-cart" data-index="${index}"><i class="fa-solid fa-trash"></i></button>
                            </div>
                        </div>
                    </div>
                `;
                cartItemElement.innerHTML = itemHTML;
                cartContainer.appendChild(cartItemElement);

                totalQuantity += parseInt(item.quantity);
                var itemPrice = parseFloat(item.price);
                var itemQuantity = parseInt(item.quantity);

                if (!isNaN(itemPrice) && !isNaN(itemQuantity)) {
                    totalPrice += itemPrice * itemQuantity;
                } else {
                    console.error(`Lỗi: Giá hoặc Số lượng không hợp lệ cho sản phẩm ${item.name}`);
                }

            });

            var formattedTotalPrice = formatPriceDetail(totalPrice);

            document.querySelector('.total-products span').textContent = totalQuantity;

            document.querySelector('.total-price').textContent = formattedTotalPrice;

            var itemCount = totalQuantity;

            if (itemCount < 3) {
                // Hiển thị phí giao hàng
                var shipmentPriceElement = document.querySelector('.shipment-price');
                shipmentPriceElement.textContent = '5.000₫';

                var giaTamTinh = totalPrice;
                var tienShip = shipmentPriceElement.textContent;
                var tienShipInt = parseFloat(tienShip);
                var result = giaTamTinh + tienShipInt;

                var formattedSumPrice = formatPriceDetail(result);
                console.log('Formatted Sum Price:', formattedSumPrice);

                document.querySelector('.sum-price').textContent = formattedSumPrice;
            } else {
                // Nếu có 3 sản phẩm trở lên hiển thị "Miễn Phí"
                var sumPrice = totalPrice;
                var formattedSumPrice = formatPriceDetail(sumPrice);
                document.querySelector('.sum-price').textContent = formattedSumPrice;
                var shipmentPriceElement = document.querySelector('.shipment-price');
                shipmentPriceElement.textContent = "Miễn Phí";
            }
            var hiddenSumPriceInput = document.getElementById('hidden-sum-price');
            hiddenSumPriceInput.value = formattedSumPrice;
            updateHiddenInput();
        }
    }

    function formatPriceDetail(price) {
        // Kiểm tra và chuyển đổi `price` nếu là chuỗi
        if (typeof price === 'string') {
            // Loại bỏ dấu phân cách hàng nghìn (dấu chấm) nếu có
            price = parseFloat(price.replace(/\./g, '').replace('đ', '').trim());
        }
    
        var formatterDetail = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',
            minimumFractionDigits: 0,
            maximumFractionDigits: 0
        });
    
        return formatterDetail.format(price).replace(/,/g, '.');
    }
    
});