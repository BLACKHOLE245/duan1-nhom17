<link rel="stylesheet" href="css/style.css">
<div class="container-header">
    <header id="header-page">
        <section class="header-mid">
            <a href="./index.php" class="logo-page">
                <img src="./images/logo.png" alt="logo">
            </a>
        </section>
        <section class="header-left">
            <nav class="nav-page">
                <li><a href="index.php">Trang chủ</a></li>
                <li><a href="show-list-item.php">Sản Phẩm</a></li>
                <li><a href="#">Apple</a></li>
                <li><a href="#">Điện thoại</a></li>
                <li><a href="#">Máy tính</a></li>
                <li><a href="#">Laptop</a></li>
                <li><a href="#">Phụ kiện</a></li>
                <li><a href="#">Trả góp</a></li>
            </nav>
        </section>

        <section class="header-right">
            <form class="search-box" action="search.php" method="GET">
                <input type="text" class="search-text" placeholder="Sản phẩm cần tìm..." name="search" required>
                <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>

            <section class="action-page">
                <li><a href="#"><i class="fa-solid fa-headphones-simple"></i></a></li>
                <li><a id="userLink" href="./login-sigup/index.php"><i class="fa-regular fa-user"></i></a></li>
                <li>
                    <a href="#" onclick="showCart(event)">
                        <i class="fa-solid fa-basket-shopping"></i>
                        <p id="lenght-cart"></p>
                    </a>

                    <div id="show-cart">
                        <div id="my-cart">
                            <p id="cart-items"></p>
                        </div>

                        <div id="checkout">
                            <p id="cart-total">Tổng tiền: <span> 0 đ</span></p>

                            <div class="container-clear-cart">
                                <button type="button" class="clear-cart-btn">
                                    Xóa tất cả sản phẩm
                                </button>
                            </div>
                            <a id="view-cart-link" href="checkout.php">
                                Thanh Toán
                            </a>
                        </div>
                    </div>
                </li>
            </section>
        </section>
    </header>
    <div class="hello-user">
        <?php
        session_start();

        if (isset($_SESSION['user_id'])) {
            include 'db_connect.php';
            $user_id = $_SESSION['user_id'];
            $query = "SELECT * FROM users WHERE user_id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("s", $user_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if (!$result) {
                die("Lỗi truy vấn: " . $conn->error);
            }

            $row = $result->fetch_assoc();

            echo '<script>
            document.getElementById("userLink").href = "#";
          </script>';

            echo '<a href="login-sigup/logout.php">Đăng xuất</a>';

            if (isset($row['role'])) {
                if ($row['role'] == 0) {
                    echo '<a href="admin/index.php?user_id=' . $row['user_id'] . '">Tới Trang Quản Trị</a>';
                } else {
                    echo '<a href="#">Cập nhật thông tin</a>';
                }
            }

            echo '<span>' . $_SESSION['user_name'] . '</span>';

            $stmt->close();
            $conn->close();
        }
        ?>

    </div>

    <button class="top-page-btn">
        <i class="fa-solid fa-angle-up"></i>
    </button>

    <div class="container-success hidden">
        <div id="success-overlay">
            <i class="fa-regular fa-circle-check"></i>
            <p>Thành Công</p>
        </div>
    </div>

    <div class="hidden" id="delete-success">
        <div id="success-overlay-delete">
            <i class="fa-regular fa-trash-can"></i>
            <p>Đã Xoá</p>
        </div>
    </div>
</div>

<style>
    .grid-info {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 30px;
    }

    .hello-user {
        position: absolute;
        top: 10px;
        right: 10px;
        align-items: center;
        z-index: 101;
    }

    .hello-user a {
        color: #fff;
        padding: 0px 10px;
        border-right: 1px solid #fff;
        font-size: 13px
    }

    .hello-user a:hover {
        color: #221F20;
    }

    .hello-user span {
        font-weight: 600;
        padding-left: 10px;
    }
</style>

<style>
    #success-overlay {
        display: flex;
        align-items: center;
        gap: 10px;
        position: fixed;
        background-color: #221F20;
        color: #FFD400;
        z-index: 101;
        top: 10px;
        right: 75px;
        border-radius: 10px;
        padding: 10px 40px;
        border: 2px solid #32CD32;
        pointer-events: none;
    }

    #success-overlay-delete {
        display: flex;
        align-items: center;
        gap: 10px;
        position: fixed;
        background-color: #221F20;
        color: #FFD400;
        z-index: 101;
        top: 10px;
        right: 75px;
        border-radius: 10px;
        padding: 10px 40px;
        border: 2px solid #f80000;
        pointer-events: none;
    }
</style>

<style>
    .quantity-input {
        width: 35px;
    }

    .quantity-decrement,
    .quantity-increment {
        width: 20px;
        height: 20px;
        cursor: pointer;
    }
</style>