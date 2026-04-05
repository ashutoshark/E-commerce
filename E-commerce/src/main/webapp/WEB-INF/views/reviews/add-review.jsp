<html>
<head>
    <title>Rate Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container mt-5">
    <h3 class="text-center mb-4">⭐ Rate Product</h3>

```
<form action="/review/save" method="post" class="card p-4 shadow-sm">

    <input type="hidden" name="productId" value="${product.id}" />

    <div class="mb-3">
        <label>Rating</label>
        <select name="rating" class="form-select">
            <option value="1">1 ⭐</option>
            <option value="2">2 ⭐</option>
            <option value="3">3 ⭐</option>
            <option value="4">4 ⭐</option>
            <option value="5">5 ⭐</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Comment</label>
        <textarea name="comment" class="form-control"></textarea>
    </div>

    <button type="submit" class="btn btn-primary w-100">Submit Review</button>
</form>
```

</div>

</body>
</html>
