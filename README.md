

# 📚 Online Book Shop Management System

## 📖 Overview

The **Online Book Shop Management System** is a web-based application that enables customers to browse, search, and purchase books online while providing bookstore administrators with tools to manage inventory, orders, customers, and reports.
The project is built with **ASP.NET (C#)** and **SQL Server** for backend, and **HTML, CSS, Bootstrap, JavaScript** for frontend.

Developed as part of **PRJT-311** for the **Bachelor of Agricultural Information Technology** program at **Anand Agricultural University**.

---

## 🎯 Purpose

* Provide a platform for customers to browse, search, and purchase books online.
* Allow administrators to efficiently manage store operations.
* Streamline the process from browsing to delivery.
* Enhance customer experience with detailed book information and reviews.

---

## 🏆 Objectives

* Create a **web portal** for managing book and user details.
* Store and manage data of books, customers, and orders.
* Offer a wide range of books and authors for easy discovery.

---

## 🛠 Technology Stack

| Category     | Tools                                          |
| ------------ | ---------------------------------------------- |
| **Platform** | Visual Studio 2022                             |
| **Frontend** | HTML, CSS, Bootstrap, JavaScript, ASP.NET (C#) |
| **Backend**  | SQL Server (Local DB)                          |
| **OS**       | Windows 10                                     |
| **Hardware** | 4GB/8GB/16GB RAM, Intel i5/i7, x64 processor   |

---

## 👥 Types of Users

1. **Admin** – Manages books, customers, orders, and reports.
2. **User/Customer** – Browses books, places orders, and views history.

---

## ⚙ Functionality

### **User**

* Browse and search books by title, author, genre, and price.
* View book details, author bios, and customer reviews.
* Add books to shopping cart and proceed to checkout.
* Manage profile information.
* View order history.

### **Admin**

* Manage book inventory (add, update, delete).
* Process orders and update statuses.
* Manage customers and view their order history.
* Generate reports and sales analytics.

### **Login**

* Secure authentication for Admin and User.
* Invalid credentials prevent access.

---

## 📂 Database Schema

### 1. **User Table**

```sql
U_ID INT(10) PRIMARY KEY,
Username VARCHAR(15) NOT NULL,
U_Password VARCHAR(10) NOT NULL,
U_Name VARCHAR(30) NOT NULL,
U_Email VARCHAR(20) NOT NULL,
U_Contact_No INT(10) NOT NULL,
U_Address VARCHAR(50) NOT NULL,
Role VARCHAR(50) NOT NULL,
Status VARCHAR(50) NOT NULL
```

### 2. **Add Book Table**

```sql
B_ID INT(10) PRIMARY KEY,
B_Titel VARCHAR(30) NOT NULL,
Price INT(10) NOT NULL,
B_Author VARCHAR(50) NOT NULL,
Quantity VARCHAR(100) NOT NULL
```

### 3. **Order Table**

```sql
O_ID INT(10) PRIMARY KEY NOT NULL,
U_ID INT(10) NOT NULL,
O_Date DATE NOT NULL,
O_Quantity VARCHAR(20) NOT NULL,
FOREIGN KEY (U_ID) REFERENCES User(U_ID)
```

### 4. **Order Detail Table**

```sql
OrderDetail_ID INT(10) PRIMARY KEY,
U_ID INT(10) NOT NULL,
B_ID INT(10) NOT NULL,
O_ID INT(10) NOT NULL,
Quantity INT(10) NOT NULL,
Price INT(10) NOT NULL,
FOREIGN KEY (U_ID) REFERENCES User(U_ID),
FOREIGN KEY (B_ID) REFERENCES AddBook(B_ID),
FOREIGN KEY (O_ID) REFERENCES Order(O_ID)
```

---

## 📸 Screenshots

### **User**

* Login Page
* Home Page
* Profile Page
* Book Order Page
* Book History Page

### **Admin**

* User Management Page
* Add New Book Page
* Book List Page
* Book Order Management Page

---

## 📅 Project Details

* **Course Code:** PRJT-311
* **Semester:** 5th
* **Submission Date:** 30-11-2024
* **Developer:** Chaudhary BharatBhai BhuraBhai


