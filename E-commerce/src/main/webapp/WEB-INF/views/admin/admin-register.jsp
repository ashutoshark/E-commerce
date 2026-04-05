<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="col-md-6 offset-md-3">
        <div class="card shadow-lg">
            <div class="card-header text-center bg-dark text-white">
                <h4>Admin Registration</h4>
            </div>
            <div class="card-body">
                <form action="/admin/register" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required/>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-dark">Register</button>
                    </div>
                </form>

                <p class="mt-3 text-center">
                    Already have an account? <a href="/admin/login">Login here</a>
                </p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
