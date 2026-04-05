<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>${product.name}</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container py-5">
		<div class="row">
			<div class="col-md-5">
				<img src="${product.imageUrl}" class="img-fluid rounded shadow-sm"
					alt="${product.name}">
			</div>
			<div class="col-md-7">
				<h2>${product.name}</h2>
				<p class="text-muted">${product.category.name}</p>
				<h3 class="text-success">₹${product.price}</h3>
				<p class="mt-3">${product.description}</p>

				<h4 class="mt-4">⭐ Customer Reviews</h4>

				<c:if test="${empty reviews}">
					<p class="text-muted">No reviews yet.</p>
				</c:if>

				<c:forEach var="r" items="${reviews}">
					<div class="card p-2 mb-2">
						<strong>${r.user.fullName}</strong> - ⭐ ${r.rating}
						<p>${r.comment}</p>
					</div>
				</c:forEach>
				<form action="/shop/add-to-cart" method="post" class="mt-4">
					<input type="hidden" name="productId" value="${product.id}">
					<div class="d-flex align-items-center mb-3">
						<label for="quantity" class="me-2">Quantity:</label> <input
							type="number" name="quantity" value="1" min="1"
							class="form-control w-25">
					</div>
					<button type="submit" class="btn btn-primary btn-lg">🛒
						Add to Cart</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
