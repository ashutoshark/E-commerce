<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Seller Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="col-md-4 offset-md-4">
        <div class="card shadow-lg">
            <div class="card-header text-center bg-dark text-white">
                <h4>Seller Login</h4>
            </div>
            <div class="card-body">
                <form action="/seller/login" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required/>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-dark">Login</button>
                    </div>
                </form>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">${error}</div>
                </c:if>

                <p class="mt-3 text-center">
                    Don’t have an account? <a href="/seller/register">Register</a>
                </p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
