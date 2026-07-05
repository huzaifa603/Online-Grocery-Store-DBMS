🛒 Online Grocery Store Management System

A full-stack Online Grocery Store Management System — a web-based application that replicates the operations of a digital grocery marketplace, allowing customers to browse and purchase grocery items while giving admins control over inventory and orders.

📖 Overview

This project simulates a real-world online grocery store. It provides two major interfaces:


Customer side — register, browse products, manage cart, place orders, and view order history
Admin side — manage products, update stock levels, and view customer orders


The database is normalized and designed using MySQL Workbench, with the frontend built in HTML/CSS and backend logic handled by PHP.

✨ Features


👤 Customer registration & login
🛍️ Product browsing by category
🛒 Cart management (add/update items)
📦 Order placement and order history
🔐 Admin panel — add/update products, manage stock, view orders
📊 Dashboard views — product prices, customer purchases, total bills, profits, and total quantities sold


🛠️ Tech Stack

LayerTechnologyFrontendHTML, CSSBackendPHPDatabaseMySQL (designed with MySQL Workbench)Local ServerXAMPP (Apache + MySQL + PHP)

🗄️ Database Design

The database follows a normalized relational model with the following core tables:

TablePurposeadminLogin credentials & details of administratorscustomerRegistered users' personal & account infoproductGrocery item details (name, category, stock, price)categoryProduct categories (fruits, vegetables, dairy, etc.)cartItems temporarily selected by a customer before checkoutcustomerordersOrder dates, status, and customer referencesorderdetailsPer-order line items (quantity, unit price, product)billinginfoPayment/billing data linked to customer orderssupplierVendors supplying grocery items

Key relational concepts used: primary/foreign keys, JOIN operations, aggregation functions (SUM()), and sorting/grouping (ORDER BY, GROUP BY).


Note: The sample SQL script included in the project report uses a simplified schema (products, prices, customers, sales, customer_carts, profits, etc.) for demonstrating queries — see database.sql in this repo for the full schema and seed data.



🔄 System Workflow

Customer Workflow


Register an account
Browse products, view details, add items to cart
Proceed to checkout and confirm order
Backend (PHP) calculates total and stores order details


Admin Workflow


Log in through the admin panel
Add/update product inventory
View and process pending customer orders
Changes reflect in real-time in the database


🚀 Getting Started

Prerequisites


XAMPP (Apache + MySQL + PHP)
A web browser


Setup


Clone the repository





Move the project into XAMPP's htdocs folder


bash   # e.g. on Windows: C:\xampp\htdocs\online-grocery-store


Create the database

Open phpMyAdmin or MySQL Workbench
Run the SQL script (database.sql) to create the onlinegrocery database and its tables

<img width="600" height="304" alt="image" src="https://github.com/user-attachments/assets/47037e44-8948-48f7-a97f-0721b121d9dc" />


Configure database connection
Update your PHP database connection file with your MySQL credentials (host, username, password, database name).

⚠️ Never commit real database credentials to GitHub — use placeholder values or a config file excluded via .gitignore.




Start Apache & MySQL from the XAMPP control panel.
Run the app by visiting:


   http://localhost/online-grocery-store

🧪 Sample Dashboard Queries

The project includes a demo dashboard (HTML/JS) with sections for:


Product Prices
Customer Purchases
Total Bills per Customer
Profits by Product
Total Quantities Sold

<img width="607" height="263" alt="image" src="https://github.com/user-attachments/assets/39e3a8aa-2e72-4934-990d-0ec80947951c" />

These are powered by SQL queries using JOINs and aggregation functions (see the SQL Code section of the project report).

⚠️ Challenges Faced


Database Normalization — eliminating redundancy while keeping retrieval efficient
User Authentication — secure login via PHP sessions and form validation
Form Handling — accurately managing dynamic cart/order data
Integration — connecting frontend forms with PHP backend and MySQL


🔮 Future Enhancements


💳 Payment gateway integration (PayPal, Stripe)
📱 Responsive design (Bootstrap)
🎯 Product recommendations based on purchase history
🚚 Delivery tracking
🔒 Data encryption for sensitive user information


📄 Conclusion

This project is a simplified but complete e-commerce cycle for a grocery store — covering frontend design, backend logic, and relational database management — and serves as a foundational model that can be extended into a fully functional commercial platform.

👥 Author

Syed Huzaifa Bilal



Course: Database Systems (Lab) — Final Project
Institute: Shaheed Zulfikar Ali Bhutto Institute of Science & Technology (SZABIST)
