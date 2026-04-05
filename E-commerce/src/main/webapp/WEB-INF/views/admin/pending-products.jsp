<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Pending Products | Admin</title>

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
	transform: scale(1.02);
}

.product-img {
	height: 180px;
	object-fit: cover;
	border-radius: 10px;
}

.reject-box {
	display: none;
}
</style>
</head>

<body>

	<!-- 🔥 Navbar -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/admin/dashboard">Admin Panel</a> <a
				href="/admin/logout" class="btn btn-danger">Logout</a>
		</div>
	</nav>

	<!-- 🔥 Header -->
	<div class="container text-center mt-4">
		<h2>Pending Products ⏳</h2>
		<p class="text-muted">Approve or reject seller products</p>
	</div>

	<!-- 🔥 Product List -->
	<div class="container mt-4">
		<div class="row g-4">

			<c:forEach var="p" items="${products}">

				<div class="col-md-4">
					<div class="card shadow-sm p-3">

						<!-- IMAGE -->
						<img src="${p.imageUrl}" class="product-img mb-3" />

						<!-- DETAILS -->
						<h5>${p.name}</h5>
						<p class="text-muted">${p.description}</p>
						<p>
							<b>₹ ${p.price}</b>
						</p>

						<!-- APPROVE -->
						<form action="/admin/products/approve" method="post">
							<input type="hidden" name="id" value="${p.id}">
							<button class="btn btn-success w-100 mb-2">✅ Approve</button>
						</form>

						<!-- REJECT BUTTON -->
						<button class="btn btn-danger w-100"
							onclick="toggleReject(${p.id})">❌ Reject</button>

						<!-- REJECT BOX -->
						<div id="rejectBox${p.id}" class="reject-box mt-2">
							<form action="/admin/products/reject" method="post">
								<input type="hidden" name="id" value="${p.id}">

								<textarea name="reason" class="form-control mb-2"
									placeholder="Enter rejection reason..." required></textarea>

								<button class="btn btn-warning w-100">Submit Reason</button>
							</form>
						</div>

					</div>
				</div>

			</c:forEach>

		</div>
	</div>

	<!-- 🔥 JS -->
	<script>
function toggleReject(id) {
    let box = document.getElementById("rejectBox" + id);
    box.style.display = (box.style.display === "none") ? "block" : "none";
}
</script>

</body>
</html>