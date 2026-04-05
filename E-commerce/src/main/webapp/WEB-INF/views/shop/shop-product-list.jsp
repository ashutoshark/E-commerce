<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Shop Products</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container py-4">
		<h2 class="text-center mb-4">🛍️ Our Products</h2>

		<form action="/shop/products" method="get"
			class="mb-4 d-flex justify-content-center">
			<input type="text" name="keyword" value="${keyword}"
				class="form-control w-50 me-2" placeholder="Search products...">
			<button type="submit" class="btn btn-primary">Search</button>
		</form>

		<div class="row">
			<c:forEach var="product" items="${products}">
				<div class="col-md-3 mb-4">
					<div class="card shadow-sm h-100">
						<img src="${product.imageUrl}" class="card-img-top"
							alt="${product.name}" style="height: 180px; object-fit: cover;">
						<div class="card-body text-center">
							<h5 class="card-title">${product.name}</h5>
							<p class="text-muted mb-2">${product.category.name}</p>
							<p class="small text-muted">
								🏪 Seller: <span class="fw-semibold">${product.seller.name}</span>
							</p>
							<h6 class="text-success">₹${product.price}</h6>

							<!-- ⭐ Average Rating -->
							<p class="text-warning mb-2">⭐ ${ratingMap[product.id] != null ? ratingMap[product.id] : 0}
							</p>

							<c:choose>

								<c:when
									test="${wishlistIds != null && wishlistIds.contains(product.id)}">
									<a href="/wishlist/toggle/${product.id}"
										class="btn btn-danger btn-sm"> ❤️ </a>
								</c:when>

								<c:otherwise>
									<a href="/wishlist/toggle/${product.id}"
										class="btn btn-outline-danger btn-sm"> 🤍 </a>
								</c:otherwise>

							</c:choose>
							<a href="/shop/product/${product.id}"
								class="btn btn-outline-primary btn-sm mt-2">View Details</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
