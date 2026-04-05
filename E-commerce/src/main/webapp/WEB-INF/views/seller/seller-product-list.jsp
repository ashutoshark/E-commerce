<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Seller Products</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body { background-color: #f8f9fa; }

        .product-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #ddd;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
        }

        .btn {
            border-radius: 25px;
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <!--  Title -->
    <h2 class="text-center mb-4 fw-bold text-primary">My Products</h2>

    <!--  Add Button -->
    <div class="text-end mb-3">
        <a href="/seller/products/add" class="btn btn-success px-4">➕ Add Product</a>
    </div>

    <!--  Table -->
    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle shadow-sm">

            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price (₹)</th>
                    <th>Stock</th>
                    <th style="width: 220px;">Actions</th>
                </tr>
            </thead>

            <tbody class="text-center">

                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.id}</td>

                        <td>
                            <c:choose>
                                <c:when test="${not empty p.imageUrl}">
                                    <img src="${p.imageUrl}" class="product-img">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/60x60?text=No+Image" class="product-img">
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>${p.name}</td>
                        <td>${p.category.name}</td>
                        <td><strong>₹ ${p.price}</strong></td>
                        <td>${p.stockQuantity}</td>

                        <td>
                            <!-- VIEW -->
                            <a href="/products/${p.id}" class="btn btn-info btn-sm text-white">View</a>

                            <!-- EDIT -->
                            <a href="/seller/products/edit/${p.id}" class="btn btn-warning btn-sm">Edit</a>

                            <!-- DELETE -->
                            <a href="/seller/products/delete/${p.id}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this product?');">
                               Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty products}">
                    <tr>
                        <td colspan="7" class="text-muted py-4">
                            No products found.
                        </td>
                    </tr>
                </c:if>

            </tbody>

        </table>
    </div>

    <!-- 🔙 Back -->
    <div class="text-center mt-4">
        <a href="/seller/dashboard" class="btn btn-secondary">⬅ Back to Dashboard</a>
    </div>

</div>

</body>
</html>