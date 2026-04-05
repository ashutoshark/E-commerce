<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
        rel="stylesheet"
    >
    <style>
        body {
            background-color: #f8f9fa;
        }
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
        .search-bar {
            max-width: 400px;
            margin: auto;
        }
        .btn {
            border-radius: 25px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4 fw-bold text-primary">🛍️ Product List</h2>

    <!-- Search Bar -->
    <form class="d-flex justify-content-center mb-4 search-bar" action="${pageContext.request.contextPath}/products" method="get">
        <input type="text" name="keyword" class="form-control me-2" placeholder="Search by name..." value="${keyword}">
        <button type="submit" class="btn btn-primary">🔍 Search</button>
    </form>

    <!-- Add Product Button -->
    <div class="text-end mb-3">
        <a href="${pageContext.request.contextPath}/products/add" class="btn btn-success px-4">➕ Add New Product</a>
    </div>

    <!-- Success Message -->
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">${success}</div>
    </c:if>

    <!-- Product Table -->
    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle shadow-sm">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
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
                                    <img src="${pageContext.request.contextPath}${p.imageUrl}" alt="${p.name}" class="product-img">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/60x60?text=No+Image" class="product-img" alt="No Image">
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${p.name}</td>
                        <td><strong>₹ ${p.price}</strong></td>
                        <td>${p.stockQuantity}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/products/${p.id}" class="btn btn-info btn-sm text-white">View</a>
                            <a href="${pageContext.request.contextPath}/products/edit/${p.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="${pageContext.request.contextPath}/products/delete/${p.id}" class="btn btn-danger btn-sm"
                               onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty products}">
                    <tr>
                        <td colspan="6" class="text-muted py-4">No products found.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
