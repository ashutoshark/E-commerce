<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-lg p-4">
        <h3 class="mb-4 text-center text-primary">Edit User Details</h3>

        <form action="/user/update" method="post">
            <input type="hidden" name="id" value="${user.id}">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullName" class="form-control" value="${user.fullName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" value="${user.email}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phone" class="form-control" value="${user.phone}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Address</label>
                <input type="text" name="address" class="form-control" value="${user.address}">
            </div>

            <div class="d-flex justify-content-between">
                <a href="/user/list" class="btn btn-secondary">⬅ Back</a>
                <button type="submit" class="btn btn-success">💾 Update</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
