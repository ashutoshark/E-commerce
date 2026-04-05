<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Seller Product Form</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 650px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .btn {
            border-radius: 25px;
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <div class="form-container">

        <!--  Heading -->
        <h3 class="text-center mb-4 text-primary">
            ${product.id == null ? "➕ Add New Product" : "✏️ Edit Product"}
        </h3>

        <!--  FORM START -->
        <form action="${product.id == null ? '/seller/products/save' : '/seller/products/update'}"
              method="post"
              enctype="multipart/form-data">

            <!--  Hidden ID (Important for Update) -->
            <input type="hidden" name="id" value="${product.id}"/>

            <!-- PRODUCT NAME -->
            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text"
                       name="name"
                       value="${product.name}"
                       class="form-control"
                       placeholder="Enter product name"
                       required>
            </div>

            <!-- CATEGORY ENUM -->
            <div class="mb-3">
                <label class="form-label">Category</label>

                <select name="categoryType" class="form-control" required>
                    <option value="">-- Select Category --</option>

                    <c:forEach var="cat" items="${categoryTypes}">
                        <option value="${cat}"
                            ${product.categoryType == cat ? "selected" : ""}>
                            ${cat}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- DESCRIPTION -->
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description"
                          class="form-control"
                          rows="3"
                          required>${product.description}</textarea>
            </div>

            <!-- PRICE -->
            <div class="mb-3">
                <label class="form-label">Price (₹)</label>
                <input type="number"
                       step="0.01"
                       name="price"
                       value="${product.price}"
                       class="form-control"
                       placeholder="Enter price"
                       required>
            </div>

            <!-- STOCK -->
            <div class="mb-3">
                <label class="form-label">Stock Quantity</label>
                <input type="number"
                       name="stockQuantity"
                       value="${product.stockQuantity}"
                       class="form-control"
                       placeholder="Enter stock quantity"
                       required>
            </div>

            <!-- IMAGE UPLOAD -->
            <div class="mb-3">
                <label class="form-label">Product Image</label>

                <input type="file"
                       name="imageFile"
                       class="form-control"
                       accept="image/*">

                <!--  IMAGE PREVIEW (EDIT MODE) -->
                <c:if test="${not empty product.imageUrl}">
                    <div class="mt-3 text-center">
                        <img src="${product.imageUrl}"
                             alt="Product Image"
                             class="img-thumbnail"
                             width="150">
                    </div>
                </c:if>
            </div>

            <!-- BUTTONS -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary px-4">
                    ${product.id == null ? "Save Product" : "Update Product"}
                </button>

                <a href="/seller/products" class="btn btn-secondary px-4">
                    Cancel
                </a>
            </div>

        </form>
        <!--FORM END -->

    </div>

</div>

</body>
</html>