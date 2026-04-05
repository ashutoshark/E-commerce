<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>My Orders</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container py-5">
		<h2 class="text-center mb-4">📦 My Orders</h2>

		<c:if test="${empty orders}">
			<div class="alert alert-info text-center">
				No orders yet. <a href="/shop/products" class="alert-link">Start
					Shopping</a>
			</div>
		</c:if>

		<c:if test="${not empty orders}">
			<div class="row">
				<c:forEach var="order" items="${orders}">
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm border-primary">
							<div class="card-body">
								<h5 class="card-title">Order #${order.id}</h5>
								<p>
									<strong>Date:</strong> ${order.orderDate}
								</p>
								<p>
									<strong>Status:</strong> <span class="badge bg-success">${order.status}</span>
								</p>
								<p>
									<strong>Total:</strong> ₹${order.totalAmount}
								</p>
								<a href="#" class="btn btn-outline-primary btn-sm">View
									Details</a> <a href="#" class="btn btn-outline-primary btn-sm mb-2">View
									Details</a>

								<c:if test="${order.status == 'DELIVERED'}">
									<c:forEach var="item" items="${order.items}">
										<div class="mt-3">
											<span>${item.product.name}</span> <a
												href="/review/add?productId=${item.product.id}"
												class="btn btn-sm btn-success ms-2"> ⭐ Rate </a>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>
