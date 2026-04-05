<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Edit Seller</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container py-5">

    <div class="card shadow-lg p-4">

        <h3 class="mb-4 text-center text-primary">
            Edit Seller Details
        </h3>

        <form action="/seller/update" method="post">

            <input type="hidden" name="id" value="${seller.id}">

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text"
                       name="name"
                       class="form-control"
                       value="${seller.name}"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email"
                       name="email"
                       class="form-control"
                       value="${seller.email}"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="text"
                       name="password"
                       class="form-control"
                       value="${seller.password}"
                       required>
            </div>

            <div class="d-flex justify-content-between">
                <a href="/admin/seller_list" class="btn btn-secondary">
                    ⬅ Back
                </a>

                <button type="submit" class="btn btn-success">
                    💾 Update
                </button>
            </div>

        </form>

    </div>

</div>

</body>
</html>