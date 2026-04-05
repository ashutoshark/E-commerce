<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Product Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

	<div class="container mt-5">
		<h3 class="text-center mb-4">${product.id == null ? "Add New Product" : "Edit Product"}</h3>

		<!-- enctype="multipart/form-data" is required for file upload -->
		<form
			action="${product.id == null ? '/products/save' : '/products/update'}"
			method="post" enctype="multipart/form-data">

			<input type="hidden" name="id" value="${product.id}" />

			<div class="mb-3">
				<label class="form-label">Name:</label> <input type="text"
					name="name" value="${product.name}" class="form-control" required />
			</div>

			<div class="mb-3">
				<label class="form-label">Category:</label> <select
					name="categoryType" class="form-control" required>
					<option value="">-- Select Category --</option>

					<c:forEach var="cat" items="${categoryTypes}">
						<option value="${cat}"
							${product.categoryType == cat ? "selected" : ""}>${cat}
						</option>
					</c:forEach>

				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">Description:</label>
				<textarea name="description" class="form-control" required>${product.description}</textarea>
			</div>

			<div class="mb-3">
				<label class="form-label">Price (₹):</label> <input type="number"
					step="0.01" name="price" value="${product.price}"
					class="form-control" required />
			</div>

			<div class="mb-3">
				<label class="form-label">Stock Quantity:</label> <input
					type="number" name="stockQuantity" value="${product.stockQuantity}"
					class="form-control" required />
			</div>
			
			<div class="mb-3">
				<label class="form-label">Seller Name</label> <input
					type="email" name="email" value="${seller.email}"
					class="form-control" required />
			</div>

			<div class="mb-3">
				<label class="form-label">Product Image:</label> <input type="file"
					name="imageFile" class="form-control" accept="image/*"
					${product.id == null ? "required" : ""} />

				<c:if test="${not empty product.imageUrl}">
					<div class="mt-3 text-center">
						<img src="${product.imageUrl}" alt="Product Image"
							class="img-thumbnail" width="150" height="150" />
					</div>
				</c:if>
			</div>

			<div class="text-center">
				<button type="submit" class="btn btn-primary">${product.id == null ? "Save" : "Update"}</button>
				<a href="/products" class="btn btn-secondary">Cancel</a>
			</div>
		</form>
	</div>

</body>
</html>
