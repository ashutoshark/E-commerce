<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>❤️ My Wishlist</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<style>
body {
	background: #f8f9fa;
}

.wishlist-title {
	font-weight: bold;
	color: #0d6efd;
}

.card {
	border-radius: 15px;
	transition: 0.3s;
}

.card:hover {
	transform: translateY(-5px);
}

.product-img {
	height: 200px;
	object-fit: cover;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.remove-btn {
	border-radius: 20px;
}

.price {
	font-size: 18px;
	font-weight: bold;
	color: #28a745;
}
</style>
</head>

<body>

	<!-- 🔥 NAVBAR -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand">❤️ My Wishlist</span> <a
				href="/shop/products" class="btn btn-outline-light">Back to Shop</a>
		</div>
	</nav>

	<div class="container py-4">

		<!-- 🔍 SEARCH -->
		<form action="/shop/products" method="get" class="d-flex mb-4">
			<input type="text" name="keyword" class="form-control me-2"
				placeholder="Search products...">
			<button class="btn btn-primary">Search</button>
		</form>

		<!-- 🔥 TITLE -->
		<h3 class="wishlist-title text-center mb-4">❤️ Your Wishlist</h3>

		<div class="row">

			<c:forEach var="w" items="${wishlist}">
				<div class="col-md-4 mb-4">

					<div class="card shadow-sm h-100">

						<!-- IMAGE -->
						<img src="${w.product.imageUrl}" class="product-img"
							alt="${w.product.name}">

						<div class="card-body text-center">

							<!-- NAME -->
							<h5>${w.product.name}</h5>

							<!-- DESCRIPTION -->
							<p class="text-muted small">${w.product.description}</p>

							<!-- PRICE -->
							<p class="price">₹${w.product.price}</p>

							<!-- ACTIONS -->
							<div class="d-flex justify-content-center gap-2">

								<a href="/shop/product/${w.product.id}"
									class="btn btn-outline-primary btn-sm"> View </a> <a
									href="/wishlist/remove/${w.product.id}"
									class="btn btn-danger btn-sm remove-btn"
									onclick="return confirm('Remove from wishlist?')"> ❌ Remove
								</a>

							</div>

						</div>
					</div>

				</div>
			</c:forEach>

		</div>

		<!-- 🔥 EMPTY STATE -->
		<c:if test="${empty wishlist}">
			<div class="text-center mt-5">
				<h5 class="text-muted">😔 Your wishlist is empty</h5>
				<a href="/shop/products" class="btn btn-primary mt-3"> Browse
					Products </a>
			</div>
		</c:if>

	</div>

	<!-- 🔥 FOOTER -->
	<footer class="text-center py-3 bg-dark text-white mt-5">
		<p class="mb-0">&copy; 2026 E-Commerce Platform</p>
	</footer>

</body>
</html>