<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
		<div class="col-md-3 col-lg-2 text-white min-vh-100 p-3" 
		     style="background-color: #1e90ff;">

            <h4 class="text-center mb-4">User Dashboard</h4>
            <p><strong>${user.fullName}</strong></p>
            <hr>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link text-white" href="/user/dashboard">🏠 Home</a></li>
				<li class="nav-item"><a class="nav-link text-white" href="/user/profile">🛍️ My Profile</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="/shop/my-orders">🛍️ My Orders</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="/shop/cart">🛒 My Cart</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="/shop/products">🧾 All Products</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="/user/logout">🚪 Logout</a></li>
                <li class="nav-item"><a class="nav-link text-danger" href="/wishlist">❤️ My Wishlist</a></li>
                
            </ul>
        </div>

		<!-- Main Content -->
		<div class="col-md-9 col-lg-10 p-4">

		    <!-- Search Bar -->
		    <form action="/shop/search" method="get" class="d-flex mb-4">
		        <input type="text" name="keyword" class="form-control me-2" placeholder="Search for products...">
		        <button class="btn btn-primary">Search</button>
		    </form>

		    <h4 class="mb-4">Available Products</h4>

		    <div class="row">
		        <c:forEach var="p" items="${products}">
		            <div class="col-md-4 mb-4">
		                <div class="card h-100 shadow-sm">
		                    <img src="${p.imageUrl}" class="card-img-top" alt="${p.name}" style="height: 200px; object-fit: cover;">
		                    <div class="card-body">
		                        <h5 class="card-title">${p.name}</h5>
		                        <p class="card-text text-muted">${p.description}</p>
		                        <p><strong>₹${p.price}</strong></p>
		                        <a href="/shop/product/${p.id}" class="btn btn-sm btn-success">view Details</a>
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
		    </div>

		    <!-- In case no products -->
		    <c:if test="${empty products}">
		        <p class="text-muted text-center mt-5">No products available right now.</p>
		    </c:if>

		</div>

</body>
</html>
