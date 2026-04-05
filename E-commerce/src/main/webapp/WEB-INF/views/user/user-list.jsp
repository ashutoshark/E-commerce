<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>All Users</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <h2 class="mb-4 text-center text-primary">Registered Users</h2>

    <c:if test="${empty users}">
        <div class="alert alert-info text-center">No users found!</div>
    </c:if>

    <c:if test="${not empty users}">
        <table class="table table-bordered table-striped table-hover shadow-sm">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.fullName}</td>
                    <td>${u.email}</td>
                    <td>${u.phone}</td>
                    <td>${u.address}</td>
                    <td>
                        <a href="/user/edit/${u.id}" class="btn btn-sm btn-warning">✏️ Edit</a>
                        <a href="/user/delete/${u.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this user?');">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="text-center mt-4">
        <a href="/admin/dashboard" class="btn btn-secondary">⬅ Back to Admin Dashboard</a>
    </div>
</div>
</body>
</html>
