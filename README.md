# 🛍️ E-Commerce Platform

A comprehensive, full-featured e-commerce application built with **Spring Boot** and **MySQL**. This platform enables users to browse products, manage shopping carts, process orders, write reviews, and provides admin functionality for managing the store.

---

## ✨ Features

### 🛒 Customer Features
- **Product Browsing**: Browse and search through a catalog of products
- **Shopping Cart**: Add, update, and remove items from cart
- **Orders**: Place orders and track order status
- **Reviews & Ratings**: Write and view product reviews
- **User Account**: Register, login, and manage profile
- **Order History**: View past orders and details

### 👨‍💼 Seller Features
- **Product Management**: List and manage products
- **Sales Analytics**: Track sales and performance
- **Order Management**: Manage incoming orders

### 🔧 Admin Features
- **User Management**: Manage users and roles
- **Product Management**: Full product catalog management
- **Order Management**: Monitor and manage all orders
- **Review Moderation**: Manage product reviews
- **Analytics Dashboard**: View system-wide analytics

### 🔐 Security Features
- **Spring Security**: Secure authentication and authorization
- **Role-Based Access Control**: Different access levels for users, sellers, and admins
- **Input Validation**: Data validation using Hibernate Validator
- **Password Security**: Secure password handling

### 📁 Additional Features
- **File Upload**: Support for product images (up to 100MB)
- **Responsive Design**: Works across different devices
- **Database Persistence**: Robust MySQL database integration

---

## 🛠️ Tech Stack

| Component | Technology | Version |
|-----------|-----------|---------|
| **Framework** | Spring Boot | 3.5.7 |
| **Language** | Java | 17 |
| **Database** | MySQL | 8.0+ |
| **Build Tool** | Maven | - |
| **Web Server** | Embedded Tomcat | - |
| **ORM** | Hibernate JPA | - |
| **View Layer** | JSP | - |
| **Security** | Spring Security | - |
| **Validation** | Hibernate Validator | 8.0.1 |

### Key Dependencies
```xml
- Spring Boot Starter Web
- Spring Boot Starter Data JPA
- Spring Boot Starter Security
- Spring Boot DevTools
- MySQL Connector
- Jakarta Persistence & Validation APIs
- Tomcat Embedded Jasper (JSP Support)
- JSTL (JSP Standard Tag Library)
```

---

## 📋 Prerequisites

Before running the application, ensure you have the following installed:

- **Java Development Kit (JDK)**: Version 17 or higher
  - [Download JDK 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
  
- **MySQL Server**: Version 8.0 or higher
  - [Download MySQL](https://dev.mysql.com/downloads/mysql/)
  
- **Maven**: Version 3.6 or higher (optional if using mvnw)
  - [Download Maven](https://maven.apache.org/download.cgi)

---

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd E-commerce
```

### 2. Create the Database

Connect to MySQL and create the database:

```sql
CREATE DATABASE ecommerce;
```

### 3. Update Database Configuration

Edit `src/main/resources/application.properties`:

```properties
# Database Configuration
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce
spring.datasource.username=<your-mysql-username>
spring.datasource.password=<your-mysql-password>
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

**Note**: By default, the application uses:
- Username: `root`
- Password: `ashutosh`
- Database: `ecommerce`

### 4. Build the Application

Using Maven Wrapper (Windows):
```bash
mvnw.cmd clean install
```

Or using installed Maven:
```bash
mvn clean install
```

### 5. Run the Application

Using Maven:
```bash
mvnw.cmd spring-boot:run
```

Or run the JAR file:
```bash
java -jar target/E-commerce-1.jar
```

### 6. Access the Application

Once the application starts, open your browser and navigate to:
```
http://localhost:8081/
```

---

## 📁 Project Structure

```
E-commerce/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── in/sp/main/
│   │   │       ├── ECommerceApplication.java      # Main Spring Boot Application
│   │   │       ├── Config/                        # Configuration classes
│   │   │       ├── Controller/                    # Request handlers
│   │   │       ├── Entities/                      # JPA entities/models
│   │   │       ├── Enums/                         # Enumeration types
│   │   │       ├── Repositories/                  # Database access layer
│   │   │       └── Services/                      # Business logic layer
│   │   └── resources/
│   │       ├── application.properties             # Application configuration
│   │       ├── static/                            # Static resources (CSS, JS, images)
│   │       └── templates/                         # Template files
│   ├── webapp/
│   │   ├── WEB-INF/
│   │   │   └── views/                             # JSP view files
│   │   │       ├── admin/                         # Admin pages
│   │   │       ├── cart/                          # Cart pages
│   │   │       ├── orders/                        # Order pages
│   │   │       ├── product/                       # Product pages
│   │   │       ├── reviews/                       # Review pages
│   │   │       ├── seller/                        # Seller pages
│   │   │       ├── shop/                          # Shop pages
│   │   │       └── user/                          # User pages
│   │   └── uploads/                               # Uploaded product images
│   └── test/                                      # Unit & Integration tests
├── pom.xml                                         # Maven configuration
├── mvnw                                            # Maven wrapper (Unix)
├── mvnw.cmd                                        # Maven wrapper (Windows)
└── README.md                                       # Project documentation
```

---

## 🏗️ Application Architecture

### Layered Architecture
The application follows a **3-tier architecture** pattern:

```
┌─────────────────────────────────────┐
│     Presentation Layer (JSP)        │
│  (Views - WEB-INF/views/*)          │
├─────────────────────────────────────┤
│     Controller Layer (Routing)      │
│  (Handles HTTP requests)            │
├─────────────────────────────────────┤
│     Service Layer (Business Logic)  │
│  (Core business operations)         │
├─────────────────────────────────────┤
│     Repository Layer (Data Access)  │
│  (Interacts with database via JPA)  │
├─────────────────────────────────────┤
│     MySQL Database                  │
│  (Persistent data storage)          │
└─────────────────────────────────────┘
```

### Key Components

**Controllers**: Handle incoming HTTP requests and route them to appropriate services

**Services**: Contain business logic and orchestrate operations between repositories

**Repositories**: Provide data access abstraction using Spring Data JPA

**Entities**: Domain models representing database tables

**Enums**: Define enumeration types for status, roles, etc.

**Config**: Spring configuration classes for security, beans, etc.

---

## 🔧 Configuration

### Application Properties

Located at `src/main/resources/application.properties`:

#### Server Configuration
```properties
server.port=8081                    # Application port
```

#### Database Configuration
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce
spring.datasource.username=root
spring.datasource.password=ashutosh
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

#### JPA/Hibernate Configuration
```properties
spring.jpa.hibernate.ddl-auto=update              # Auto-create/update tables
spring.jpa.show-sql=true                          # Log SQL queries
spring.jpa.properties.hibernate.format_sql=true   # Format SQL output
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

#### JSP View Configuration
```properties
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

#### File Upload Configuration
```properties
spring.servlet.multipart.enabled=true
spring.servlet.multipart.max-file-size=100MB
spring.servlet.multipart.max-request-size=100MB
```

---

## 🔐 Security Configuration

The application uses **Spring Security** for authentication and authorization:

- **Authentication**: User login with email and password
- **Authorization**: Role-based access control (RBAC)
- **Password Encoding**: Bcrypt for secure password storage
- **Session Management**: Secure session handling

### User Roles
- `CUSTOMER`: Regular user browsing and purchasing
- `SELLER`: Can manage products and view sales
- `ADMIN`: Full system access and management

---

## 📊 Database Schema Overview

The application manages several key entities:

| Entity | Purpose |
|--------|---------|
| **User** | Customer and seller profiles |
| **Product** | Product catalog with details |
| **Cart** | Shopping cart items |
| **Order** | Customer orders and history |
| **OrderItem** | Individual items in orders |
| **Review** | Product reviews and ratings |
| **Category** | Product categorization |

---

## 🎯 API Endpoints (Examples)

### Public Endpoints
- `GET /` - Home page
- `GET /shop` - Product listing
- `GET /product/{id}` - Product details

### User Endpoints (Authenticated)
- `GET /cart` - View shopping cart
- `POST /cart/add` - Add to cart
- `POST /order/place` - Place order
- `GET /orders` - View order history

### Admin Endpoints (Admin Only)
- `GET /admin/dashboard` - Admin dashboard
- `GET /admin/products` - Manage products
- `GET /admin/users` - Manage users

---

## 🧪 Testing

Run tests using Maven:

```bash
# Run all tests
mvnw.cmd test

# Run specific test class
mvnw.cmd test -Dtest=TestClassName
```

Test files are located in `src/test/java/`

---

## 📦 Building & Deployment

### Build JAR Package
```bash
mvnw.cmd clean package
```

This creates `target/E-commerce-1.jar`

### Run Compiled JAR
```bash
java -jar target/E-commerce-1.jar
```

### Deployment Options
- **Local Server**: Run JAR on local machine
- **Docker**: Containerize using Docker
- **Cloud Platforms**: Deploy to AWS, Azure, Heroku, etc.
- **Application Server**: Deploy to Tomcat, JBoss, etc.

---

## 🐛 Troubleshooting

### Common Issues

#### 1. Database Connection Error
**Problem**: `Communications link failure`

**Solution**:
- Ensure MySQL server is running
- Verify database credentials in `application.properties`
- Check if MySQL is listening on port 3306

#### 2. Port Already in Use
**Problem**: `Port 8081 already in use`

**Solution**: Change port in `application.properties`:
```properties
server.port=8080  # or any other available port
```

#### 3. MySQL JDBC Driver Error
**Problem**: `No suitable driver found for jdbc:mysql://`

**Solution**:
- Rebuild project: `mvnw.cmd clean install`
- Ensure Maven dependencies are downloaded

#### 4. JSP View Not Found
**Problem**: `View not found for template`

**Solution**:
- Verify JSP files exist in `src/main/webapp/WEB-INF/views/`
- Check controller returns correct view name

---

## 📝 Development Guidelines

### Code Structure
- Follow **MVC pattern** (Model-View-Controller)
- Use **dependency injection** with Spring
- Keep **business logic in services**
- Use **repositories for data access**

### Naming Conventions
- Controllers: `*Controller`
- Services: `*Service` and `*ServiceImpl`
- Repositories: `*Repository`
- Entities: PascalCase
- Methods: camelCase

### Best Practices
- Add proper error handling
- Use meaningful variable names
- Add comments for complex logic
- Validate all user inputs
- Use transactions where needed

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/YourFeature`
3. Commit changes: `git commit -m 'Add YourFeature'`
4. Push to branch: `git push origin feature/YourFeature`
5. Open a Pull Request

### Guidelines
- Follow existing code style
- Add tests for new features
- Update documentation as needed
- Keep commits clean and meaningful

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📧 Support & Contact

- **Email**: [your-email@example.com]
- **Issues**: Report bugs in the GitHub Issues section
- **Documentation**: See HELP.md for additional resources

---

## 🎓 Learning Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA Guide](https://spring.io/projects/spring-data-jpa)
- [Spring Security Reference](https://spring.io/projects/spring-security)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Maven Official Guide](https://maven.apache.org/guides/)

---

## 📈 Roadmap

### Planned Features
- [ ] Email notifications for orders
- [ ] Advanced product filtering
- [ ] Wishlist functionality
- [ ] Payment gateway integration
- [ ] Mobile app version
- [ ] REST API endpoints
- [ ] GraphQL support
- [ ] Elasticsearch integration
- [ ] Microservices architecture

---

## 🙏 Acknowledgments

- Built with **Spring Boot** framework
- Database powered by **MySQL**
- Thanks to the open-source community

---

**Last Updated**: April 2026  
**Version**: 1.0  
**Status**: Active Development

