<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Seller Dashboard | E-Commerce</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body { background-color: #f8f9fa; }

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

<!-- 🔥 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="/seller/dashboard">Seller Dashboard</a>

        <div class="d-flex">
            <span class="text-white me-3">👤 ${seller.name}</span>
            <a href="/seller/logout" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

<!-- 🔥 Welcome -->
<div class="container text-center mt-5">
    <h2>Welcome, ${seller.name} 👋</h2>
    <p class="text-muted">Manage your products easily.</p>
</div>

<!-- 🔥 STATS -->
<div class="container mt-4">
    <div class="row text-center">

        <div class="col-md-4">
            <div class="card p-4 shadow">
                <h3>${totalProducts}</h3>
                <p>Total Products</p>
            </div>
        </div>

    </div>
</div>

<!-- 🔥 DASHBOARD CARDS -->
<div class="container mt-4">
    <div class="row g-4">

        <!-- PRODUCTS -->
        <div class="col-md-4">
            <div class="card shadow-sm text-center p-4">
                <div class="card-body">
                    <div class="card-icon mb-3">🛍️</div>
                    <h5 class="card-title">Manage Products</h5>
                    <p class="card-text">Add, edit, or delete your products.</p>

                    <!-- 🔥 IMPORTANT FIX -->
                    <a href="/seller/products" class="btn btn-primary">Go to Products</a>
                </div>
            </div>
        </div>

        <!-- ORDERS (Future) -->
        <div class="col-md-4">
            <div class="card shadow-sm text-center p-4">
                <div class="card-body">
                    <div class="card-icon mb-3">📦</div>
                    <h5 class="card-title">Manage Orders</h5>
                    <p class="card-text">Track customer orders.</p>

                    <a href="/seller/orders" class="btn btn-success">View Orders</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- 🔥 FOOTER -->
<footer class="text-center mt-5 py-3 bg-dark text-white">
    <p class="mb-0">&copy; 2025 E-Commerce Platform</p>
</footer>

</body>
</html>