<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>${product.name}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.product-card {
	max-width: 850px;
	margin: 40px auto;
	border-radius: 12px;
	overflow: hidden;
}

.product-image img {
	object-fit: cover;
	width: 100%;
	height: 100%;
	border-right: 1px solid #dee2e6;
}

.card-body h3 {
	font-weight: 600;
	color: #333;
}

.price-tag {
	font-size: 1.4rem;
	color: #28a745;
	font-weight: 600;
}

.back-btn {
	border-radius: 30px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card shadow product-card">
			<div class="row g-0">

				<!-- Product Image -->
				<div class="col-md-5 product-image">
					<c:choose>
						<c:when test="${not empty product.imageUrl}">
							<img src="${pageContext.request.contextPath}${product.imageUrl}"
								alt="${product.name}" class="img-fluid">
						</c:when>
						<c:otherwise>
							<img src="https://via.placeholder.com/400x400?text=No+Image"
								alt="No Image" class="img-fluid">
						</c:otherwise>
					</c:choose>
				</div>

				<!-- Product Details -->
				<div class="col-md-7">
					<div class="card-body">
						<h3>${product.name}</h3>
						<p class="text-muted">${product.description}</p>
						<p class="price-tag">₹ ${product.price}</p>
						<p>
							<strong>Stock Available:</strong> ${product.stockQuantity}
						</p>

						<!-- ⭐ Reviews Section -->
						<h4 class="mt-4">⭐ Customer Reviews</h4>

						<!-- ⭐ Average Rating -->
						<h5 class="text-warning">
							⭐ Average Rating: ${avgRating}
						</h5>

						<!-- ❌ No Reviews -->
						<c:if test="${empty reviews}">
							<p class="text-muted">No reviews yet.</p>
						</c:if>

						<!-- 📝 Reviews List -->
						<c:forEach var="r" items="${reviews}">
							<div class="card p-3 mb-2 shadow-sm">

								<div class="d-flex justify-content-between">
									<strong>${r.user.fullName}</strong>

									<!-- ⭐ Star Display -->
									<span class="text-warning">
										<c:forEach begin="1" end="${r.rating}">
											⭐
										</c:forEach>
									</span>
								</div>

								<p class="mb-1">${r.comment}</p>

								<small class="text-muted">
									${r.reviewDate}
								</small>

							</div>
						</c:forEach>

					</div>
				</div>
			</div>

			<div class="card-footer text-end bg-white border-0 pb-4 pe-4">
				<a href="${pageContext.request.contextPath}/products"
					class="btn btn-secondary back-btn">← Back to Products</a>
			</div>
		</div>
	</div>

</body>
</html>