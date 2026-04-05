<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Seller Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="bg-light">

	<!-- Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="/seller/dashboard">🛍️
				Seller Panel</a>
			<div class="d-flex">
				<a href="/seller/profile" class="btn btn-outline-light me-2">👤
					Profile</a> <a href="/seller/logout" class="btn btn-danger">🚪
					Logout</a>
			</div>
		</div>
	</nav>

	<!-- Main Container -->

	<div class="container mt-5">
		<h3 class="mb-4 text-center text-primary fw-bold">📦 My Orders</h3>

		```
		<!-- Message -->
		<c:if test="${not empty msg}">
			<div class="alert alert-success text-center">${msg}</div>
		</c:if>

		<!-- Orders Table -->
		<div class="card shadow-sm">
			<div class="card-body">
				<table class="table table-bordered table-hover align-middle">
					<thead class="table-dark text-center">
						<tr>
							<th>Order ID</th>
							<th>Customer</th>
							<th>Total Amount</th>
							<th>Status</th>
							<th>Update</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${orders}">
							<tr>
								<td class="text-center">${order.id}</td>
								<td>${order.user.fullName}</td>
								<td class="text-success fw-semibold">₹${order.totalAmount}</td>

								<!-- Status Badge -->
								<td class="text-center"><span
									class="badge 
                                <c:choose>
                                    <c:when test='${order.status == "PENDING"}'>bg-warning text-dark</c:when>
                                    <c:when test='${order.status == "SHIPPED"}'>bg-info</c:when>
                                    <c:when test='${order.status == "DELIVERED"}'>bg-success</c:when>
                                    <c:when test='${order.status == "CANCELLED"}'>bg-danger</c:when>
                                    <c:otherwise>bg-secondary</c:otherwise>
                                </c:choose>">
										${order.status} </span></td>

								<!-- Update Status -->
								<td>
									<form action="/seller/orders/updateStatus" method="post"
										class="d-flex justify-content-center">
										<input type="hidden" name="orderId" value="${order.id}" /> <select
											name="status" class="form-select form-select-sm me-2"
											style="max-width: 150px;">
											<option value="PENDING"
												${order.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
											<option value="SHIPPED"
												${order.status == 'SHIPPED' ? 'selected' : ''}>SHIPPED</option>
											<option value="DELIVERED"
												${order.status == 'DELIVERED' ? 'selected' : ''}>DELIVERED</option>
											<option value="CANCELLED"
												${order.status == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
										</select>

										<button type="submit" class="btn btn-sm btn-primary">Update</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Empty -->
				<c:if test="${empty orders}">
					<p class="text-muted text-center mt-4">No orders found.</p>
				</c:if>
			</div>
		</div>

		<!-- Back -->
		<div class="text-center mt-4">
			<a href="/seller/dashboard" class="btn btn-secondary">← Back to
				Dashboard</a>
		</div>
		```

	</div>

</body>
</html>
