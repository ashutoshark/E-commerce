<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white text-center">
            <h3 class="mb-0">User Profile</h3>
        </div>

        <div class="card-body">
            <c:if test="${not empty msg}">
                <div class="alert alert-success text-center">${msg}</div>
            </c:if>

            <table class="table table-bordered">
                <tr>
                    <th class="bg-light">Full Name</th>
                    <td>${user.fullName}</td>
                </tr>
                <tr>
                    <th class="bg-light">Email</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th class="bg-light">Phone</th>
                    <td>${user.phone}</td>
                </tr>
                <tr>
                    <th class="bg-light">Address</th>
                    <td>${user.address}</td>
                </tr>
            </table>

            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/user/profile/edit" class="btn btn-warning me-2">✏️ Edit Profile</a>
                <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-secondary me-2">🏠 Dashboard</a>
                <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-danger">🚪 Logout</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
