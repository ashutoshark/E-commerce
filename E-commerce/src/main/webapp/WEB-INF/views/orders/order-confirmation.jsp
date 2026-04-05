<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5 text-center">
    <div class="card shadow p-5">
        <h1 class="text-success mb-3">🎉 Order Placed Successfully!</h1>
        <p class="lead">${msg}</p>
        <p>Thank you for shopping with us. Your order has been successfully placed and will be processed shortly.</p>

        <div class="mt-4">
            <a href="/order/my-orders" class="btn btn-primary me-2">View My Orders</a>
            <a href="/products" class="btn btn-secondary">Continue Shopping</a>
        </div>
    </div>
</div>

</body>
</html>
