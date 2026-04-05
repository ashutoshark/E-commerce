<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="/admin/dashboard">⚙️ Admin Dashboard</a>
        <div class="d-flex">
            <a href="/admin/orders" class="btn btn-outline-light me-2">📦 Orders</a>
            <a href="/admin/logout" class="btn btn-danger">🚪 Logout</a>
        </div>
    </div>
</nav>

<!-- Main Section -->
<div class="container py-5">

    <h3 class="text-center mb-4 text-primary fw-bold">Admin Profile</h3>

    <c:if test="${not empty msg}">
        <div class="alert alert-success text-center">${msg}</div>
    </c:if>

    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <form action="/admin/updateProfile" method="post">
                
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" value="${admin.username}" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" value="${admin.email}" class="form-control" required/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" value="${admin.password}" class="form-control" required/>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary px-4 me-2">💾 Update Profile</button>
                    <a href="/admin/dashboard" class="btn btn-secondary px-4">← Back</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
