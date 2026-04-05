<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white text-center">
            <h3 class="mb-0">Edit Profile</h3>
        </div>

        <div class="card-body">
            <form action="${pageContext.request.contextPath}/user/profile/update" method="post">
                
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullName" value="${user.fullName}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" value="${user.email}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" value="${user.password}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" value="${user.phone}" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" value="${user.address}" class="form-control" required>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-success px-4 me-2">💾 Update Profile</button>
                    <a href="${pageContext.request.contextPath}/user/profile" class="btn btn-secondary px-4">Cancel</a>
                </div>

            </form>
        </div>
    </div>
</div>

</body>
</html>
