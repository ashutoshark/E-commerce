<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>My Orders</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

	<div class="container mt-5">
		<h2 class="text-center mb-4">🧾 My Orders</h2>

		<c:if test="${empty orders}">
			<div class="alert alert-info text-center">
				You haven't placed any orders yet. <a href="/products">Shop Now!</a>
			</div>
		</c:if>

		<c:if test="${not empty orders}">
			<c:forEach var="order" items="${orders}">
				<div class="card shadow mb-4">
					<div
						class="card-header bg-dark text-white d-flex justify-content-between">
						<div>
							<strong>Order #${order.id}</strong> | Date: ${order.orderDate}
						</div>
						<div>
							<span class="badge bg-info text-dark">${order.status}</span> <span
								class="badge ${order.paymentStatus == 'PAID' ? 'bg-success' : 'bg-warning text-dark'}">
								${order.paymentStatus} </span>
						</div>
					</div>

					<div class="card-body">
						<table class="table table-bordered">
							<thead class="table-light">
								<tr>
									<th>Product</th>
									<th>Quantity</th>
									<th>Price (₹)</th>
									<th>Subtotal (₹)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${order.items}">
									<tr>
										<td>${item.product.name}</td>
										<td>${item.quantity}</td>
										<td>${item.price}</td>
										<td>${item.price * item.quantity}</td>
									</tr>
									<!-- ⭐ ADD THIS BELOW EACH PRODUCT -->
									<c:if test="${order.status == 'DELIVERED'}">
										<tr>
											<td colspan="4" class="text-end"><a
												href="/review/add?productId=${item.product.id}"
												class="btn btn-sm btn-success"> ⭐ Rate this Product </a></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

						<div class="text-end mt-3">
							<h5>Total Amount: ₹${order.totalAmount}</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>
