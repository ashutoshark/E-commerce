<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>All Sellers</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">

<div class="container py-5">

    <h2 class="mb-4 text-center text-primary">Registered Sellers</h2>

    <c:if test="${empty sellers}">
        <div class="alert alert-info text-center">No sellers found!</div>
    </c:if>

    <c:if test="${not empty sellers}">
        <table class="table table-bordered table-striped table-hover shadow-sm">

            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="s" items="${sellers}">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.name}</td>
                        <td>${s.email}</td>

                        <td>
                            <a href="/seller/edit/${s.id}"
                               class="btn btn-sm btn-warning">✏️ Edit</a>

                            <a href="/seller/delete/${s.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Delete this seller?');">
                                🗑 Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </c:if>

    <div class="text-center mt-4">
        <a href="/admin/dashboard" class="btn btn-secondary">
            ⬅ Back to Admin Dashboard
        </a>
    </div>

</div>

</body>
</html>