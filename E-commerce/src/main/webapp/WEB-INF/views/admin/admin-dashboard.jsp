<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Admin Dashboard | E-Commerce</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
body {
	background-color: #f8f9fa;
}

.card {
	border-radius: 15px;
	transition: transform 0.2s ease-in-out;
}

.card:hover {
	transform: scale(1.03);
}

.card-icon {
	font-size: 40px;
	color: #0d6efd;
}

.navbar-brand {
	font-weight: bold;
}
</style>
</head>
<body>

	<!-- ✅ Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/dashboard">E-Commerce Admin
				Panel</a>
			<div class="d-flex">
				<a href="/admin/profile" class="btn btn-outline-light me-2">Profile</a>
				<a href="/admin/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</nav>

	<!-- ✅ Welcome Header -->
	<div class="container text-center mt-5">
		<h2>Welcome, ${admin.username} 👋</h2>
		<p class="text-muted">Manage products, users, and orders from one
			place.</p>
	</div>

	<!-- ✅ Dashboard Cards -->
	<div class="container mt-4">
		<div class="row g-4">
			<!-- Manage Products -->
			<div class="col-md-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<div class="card-icon mb-3">🛍️</div>
						<h5 class="card-title">Manage Products</h5>
						<p class="card-text">View, add, edit, or delete products from
							the store.</p>
						<a href="/products" class="btn btn-primary">Go to Products</a>
					</div>
				</div>
			</div>

			<!-- Manage Orders -->
			<div class="col-md-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<div class="card-icon mb-3">📦</div>
						<h5 class="card-title">Manage Orders</h5>
						<p class="card-text">Track and update customer order statuses.</p>
						<a href="/admin/orders" class="btn btn-success">View Orders</a>
					</div>
				</div>
			</div>

			<!-- Manage Users -->
			<div class="col-md-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<div class="card-icon mb-3">👥</div>
						<h5 class="card-title">Manage Users</h5>
						<p class="card-text">View and manage all registered users.</p>
						<a href="/user/list" class="btn btn-warning text-white">View
							Users</a>
					</div>
				</div>
			</div>

			<!-- Manage Seller -->
			<div class="col-md-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<div class="card-icon mb-3">👥</div>
						<h5 class="card-title">Manage Seller</h5>
						<p class="card-text">View and manage all registered sellers.</p>
						<a href="/admin/seller_list" class="btn btn-warning text-white">View
							Sellers</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card shadow-sm text-center p-4">
					<div class="card-body">
						<div class="card-icon mb-3">⏳</div>
						<h5 class="card-title">Pending Products</h5>
						<p class="card-text">Approve or reject seller products.</p>
						<a href="/admin/products/pending" class="btn btn-primary">
							Review Products </a>
					</div>
				</div>
			</div>



			<footer class="text-center mt-5 py-3 bg-dark text-white">
				<p class="mb-0">&copy; 2025 E-Commerce Platform. All rights
					reserved.</p>
			</footer>
</body>
</html>
