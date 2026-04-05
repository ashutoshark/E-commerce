<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center mb-4">🛍 Your Shopping Cart</h2>

    <c:if test="${empty cartItems}">
        <div class="alert alert-warning text-center">
            Your cart is empty. <a href="/products">Go shopping!</a>
        </div>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Price (₹)</th>
                <th>Quantity</th>
                <th>Subtotal (₹)</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td><img src="${item.product.imageUrl}" width="60" height="60"></td>
                    <td>${item.product.name}</td>
                    <td>${item.product.price}</td>
                    <td>
                        <form action="/cart/updateQuantity" method="post" class="d-flex align-items-center">
                            <input type="hidden" name="cartItemId" value="${item.id}">
                            <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control w-50 me-2">
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </form>
                    </td>
                    <td>${item.product.price * item.quantity}</td>
                    <td>
                        <a href="/cart/remove/${item.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Remove this item from cart?')">Remove</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="text-end mt-3">
            <h4>Total: ₹${totalPrice}</h4>
            <a href="/checkout" class="btn btn-success mt-2">Proceed to Checkout</a>
        </div>
    </c:if>
</div>

</body>
</html>
