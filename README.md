# 🚗 Car Rental Management System

## 📖 Project Overview

The **Car Rental Management System** is a full-stack, web-based application that streamlines the process of booking rental cars. It enables users to browse, book, and manage car rentals while providing administrators with complete control over car listings, bookings, and customer interactions.

This project is built with **PHP**, **MySQL**, **HTML5**, **CSS**, **JavaScript**, **Bootstrap**, and **AJAX**, and runs locally on an **XAMPP** server.

---

## 🔐 User Roles & Features

### 👨‍💼 Admin Features
- Secure login and password update
- Add, edit, and delete car brands and car listings
- Approve or cancel car booking requests
- View and manage testimonials
- Respond to contact queries
- View all registered users
- Edit static content pages (About Us, Terms & Conditions)
- Manage contact information

### 🙋 Registered User Features
- Register and log in with email and password
- Recover forgotten passwords
- Browse cars and make bookings
- View booking history and current booking status
- Update personal profile and password
- Submit testimonials
- Logout securely

---

## 🗃️ Database Structure

| Table        | Description                               |
|--------------|-------------------------------------------|
| `admin`      | Stores admin credentials                  |
| `cars`       | Holds available car information           |
| `client`     | Stores registered user details            |
| `hire`       | Tracks car bookings by users              |
| `message`    | Stores feedback/messages from users       |

### 📊 Entity Relationship Overview

- **One client** can generate multiple **hire** and **message** records.
- **One car** can be rented by multiple clients at different times.
- `message.client_id` is nullable for soft-deletion of clients.

---

## 🛠️ Technologies Used

- **Frontend:** HTML5, CSS3, JavaScript, AJAX, jQuery, Bootstrap
- **Backend:** PHP 5.5
- **Database:** MySQL (XAMPP)
- **Server:** Apache (XAMPP)
- **IDE/Editor:** VS Code or any text editor

---

## ⚙️ System Requirements

- **OS:** Windows/macOS/Linux
- **RAM:** 2GB minimum (4GB recommended)
- **Software:**
  - [XAMPP](https://www.apachefriends.org/)
  - Modern web browser (Chrome, Firefox, Edge)

---

## 🚀 Setup Instructions

1. **Install XAMPP** and run Apache and MySQL modules.
2. **Clone or Download** this repository.
3. Move the project folder to `htdocs` directory in XAMPP.
4. Import the SQL file:
   - Open browser → `http://localhost/phpmyadmin`
   - Create a new database (e.g., `car_rental_db`)
   - Import the provided `.sql` file into this database
5. Open browser → `http://localhost/car-rental-folder-name/`
6. Login using default admin credentials (if provided).

---

## 📂 Project Structure

car-rental-system/
│
├── admin/ # Admin dashboard and management
├── includes/ # DB connection and utility files
├── images/ # Car and UI images
├── user/ # User-facing pages
├── css/ # Stylesheets
├── js/ # JavaScript files
├── db.sql # MySQL Database dump file
└── index.php # Landing page

---

## ✅ Learning Outcomes

Through this project, we:
- Designed an ERD and converted it to a normalized relational schema
- Used foreign key constraints and referential integrity
- Implemented core SQL operations including JOINs and GROUP BY
- Practiced modular design and real-world system modeling
- Understood web security fundamentals (authentication, input validation)

---

## 📌 Future Enhancements

- Add email notifications for bookings
- Implement payment gateway integration
- Add PDF invoice generation
- Improve UI with advanced filtering and search
- Enable multi-language support

---
