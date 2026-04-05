<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow-lg p-4">
                    <h3 class="text-center mb-4 text-primary">Welcome Back</h3>

                    <c:if test="${not empty msg}">
                        <div class="alert alert-success">${msg}</div>
                    </c:if>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/user/login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required/>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Login</button>

                        <div class="text-center mt-3">
                            <p>Don’t have an account?
                                <a href="${pageContext.request.contextPath}/user/register" class="text-decoration-none">Register now</a>
                            </p>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</body>
</html>
