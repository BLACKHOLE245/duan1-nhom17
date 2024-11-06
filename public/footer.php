<!-- HTML Footer -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
    footer {
        background-color: white;
        padding: 40px 20px;
        font-family: Arial, sans-serif;
        color: #333;
        border-top: 1px solid #e5e5e5;
    }

    footer>.footer-container {
        display: flex;
        justify-content: space-between;
        max-width: 1200px;
        margin: auto;
        flex-wrap: wrap;
        gap: 20px;
    }

    footer div {
        flex: 1;
        min-width: 250px;
    }

    footer h3 {
        color: #333;
        font-size: 18px;
        margin-top: 20px;
    }

    footer p {
        font-size: 14px;
        line-height: 1.6;
        margin: 5px 0;
    }

    footer .working-hours p {
        color: #27a844;
        font-weight: bold;
        font-size: 16px;
    }

    footer .working-hours .highlight {
        color: #ff3333;
    }

    footer ul {
        list-style-type: none;
        padding: 0;
    }

    footer ul li {
        margin: 5px 0;
    }

    footer ul li a {
        color: #333;
        text-decoration: none;
        font-size: 14px;
    }

    footer ul li a:hover {
        text-decoration: underline;
    }

    footer .contact-info p {
        font-size: 14px;
        line-height: 1.6;
    }

    footer .contact-info span {
        color: #ff3333;
        font-weight: bold;
    }

    footer .contact-info a {
        color: #007bff;
        text-decoration: none;
    }

    footer .contact-info a:hover {
        text-decoration: underline;
    }

    footer .social-icons {
        display: flex;
        gap: 10px;
        margin-top: 10px;
    }

    footer .social-icons a img {
        width: 30px;
        transition: transform 0.3s;
    }

    footer .social-icons a img:hover {
        transform: scale(1.1);
    }

    footer .showroom h3,
    footer .payment h3,
    footer .featured h3 {
        font-size: 16px;
        font-weight: bold;
        margin-top: 15px;
    }

    footer .showroom a {
        color: #007bff;
        text-decoration: none;
    }

    footer .showroom a:hover {
        text-decoration: underline;
    }

    footer .payment img {
        width: 100%;
        max-width: 250px;
        margin-top: 10px;
    }

    footer .featured a {
        font-size: 14px;
        color: #333;
        text-decoration: none;
        margin-right: 8px;
    }

    footer .featured a:hover {
        text-decoration: underline;
    }

    footer .footer-bottom {
        text-align: center;
        padding-top: 20px;
        font-size: 12px;
        color: #666;
        border-top: 1px solid #e5e5e5;
        margin-top: 20px;
    }

    footer .footer-bottom img {
        margin-top: 10px;
        width: 150px;
    }

    @media (max-width: 768px) {
        footer .footer-container {
            flex-direction: column;
            align-items: center;
        }
    }
</style>

<body>

    <!-- <footer style="background-color: #f9f9f9; padding: 20px; font-family: Arial, sans-serif;"> -->
    <footer>
        <div style="display: flex; justify-content: space-between; max-width: 1200px; margin: auto;">
            <div>
                <img src="images/logo.png" alt="Logo" style="width: 100px;">
                <h3>THỜI GIAN LÀM VIỆC</h3>
                <p style="color: #27a844; font-weight: bold;">9:00AM - 21:00PM</p>
                <p>(Kể cả Thứ 7 & Chủ Nhật)</p>
                <p style="color: #ff3333;">>>> DDM Now (Giao nhanh 2H)</p>
            </div>

            <!-- Links -->
            <div>
                <ul style="list-style-type: none; padding: 0;">
                    <li><a href="#">Giới thiệu Di Động Mỹ</a></li>
                    <li><a href="#">Chính sách bảo hành</a></li>
                    <li><a href="#">Chính sách đổi trả hoàn tiền</a></li>
                    <li><a href="#">Bảo mật thông tin</a></li>
                    <li><a href="#">Điều khoản sử dụng</a></li>
                    <li><a href="#">Hướng dẫn thanh toán</a></li>
                    <li><a href="#">Hướng dẫn mua hàng Online</a></li>
                    <li><a href="#">Tuyển dụng</a></li>
                    <li><a href="#">Chính sách vận chuyển và giao hàng</a></li>
                    <li><a href="#">Hướng dẫn mua trả trước qua Kredivo</a></li>
                </ul>
            </div>

            <!--  Support -->
            <div>
                <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                <p>Hotline (09:00 - 21:00): <span style="color: #ff3333; font-weight: bold;">099.9999.888</span></p>
                <p>Kiếu nại (09:00 - 21:00): <span style="color: #ff3333; font-weight: bold;">099.9999.888</span></p>
                <p>Zalo tư vấn (09:00 - 23:00): <a href="zalo.me/0999999888" style="color: blue;">Zalo Offical</a></p>
                <p>Email: Polymobile@Support.com</p>
                <h3>Kết nối với chúng tôi</h3>
                <div style="display: flex; gap: 10px;">
                    <a href="facebook.com"><img src="images/fb.png" alt="Facebook" style="width: 30px;"></a>
                    <a href="tiktok.com"><img src="images/tt.png" alt="TikTok" style="width: 30px;"></a>
                </div>
            </div>

            <!-- Showroom check -->
            <div>
                <h3>Showroom:</h3>
                <p>293 Đường 3/2, P.10, Q.10, TP. HCM</p>
                <p style="color: red;">(Làm việc: 09:00 - 21:00) (<a href="#" style="color: blue;">Google Map</a>)</p>
                <p>143 Võ Văn Ngân, P. Linh Chiểu, Thủ Đức</p>
                <p style="color: red;">(Làm việc: 09:00 - 21:00) (<a href="#" style="color: blue;">Google Map</a>)</p>
                <p>Kho Online (Ship nhanh 2h TP.HCM)</p>
                <p style="color: red;">(Làm việc: 09:30 - 18:00)</p>
                <h3>PHƯƠNG THỨC THANH TOÁN</h3>
                <img src="images/listbank.jpg" alt="Payment Methods" style="width: 240px;">
                <h3>Điện thoại nổi bật</h3>
                <p>
                    <a href="#">iPhone 14</a> | <a href="#">iPhone 15</a> | <a href="#">iPhone 16</a> |
                    <a href="#">iPhone X</a> | <a href="#">Pixel 9</a> | <a href="#">Pixel 8</a> |
                    <a href="#">Pixel 7</a> | <a href="#">S24 Ultra</a>
                </p>
            </div>
        </div>
        <div style="text-align: center; font-size: 10px; margin-top: 10px; margin-bottom: 0px;">
            <hr style="margin: 0;">
            <p style="margin: 0;">Copyright © 2024 Poly Mobile. Giấy chứng nhận ĐKKD số 41J8029429 do UBND Quận 10 cấp
                ngày 22/02/2022.
                Bản quyền thuộc về: Poly Mobile</p>
        </div>

    </footer>
</body>

</html>