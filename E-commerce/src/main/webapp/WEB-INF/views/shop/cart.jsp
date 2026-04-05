<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <h2 class="text-center mb-4">🛒 My Shopping Cart</h2>

    <c:if test="${empty cartItems}">
        <div class="alert alert-info text-center">Your cart is empty. <a href="/shop/products" class="alert-link">Go Shopping</a></div>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table table-striped table-bordered text-center align-middle shadow-sm">
            <thead class="table-primary">
                <tr>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td><img src="${item.product.imageUrl}" width="60" class="rounded"></td>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td>₹${item.product.price}</td>
                        <td>₹${item.quantity * item.product.price}</td>
                        <td><a href="/shop/cart/remove/${item.id}" class="btn btn-danger btn-sm">Remove</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-end mt-4">
            <h4>Total: <span class="text-success">₹${total}</span></h4>
            <form action="/shop/checkout" method="post">
                <button type="submit" class="btn btn-success btn-lg mt-3">✅ Proceed to Checkout</button>
            </form>
        </div>
    </c:if>
</div>
</body>
</html>
