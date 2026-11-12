
CREATE DATABASE IF NOT EXISTS flybeyond_db;

USE flybeyond_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE destinations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255)
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    travel_date DATE NOT NULL,
    travellers INT NOT NULL,
    special_requests TEXT,
    booking_status VARCHAR(30) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE contact_messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(200),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO destinations (name, country, description, image) VALUES
('Bali', 'Indonesia', 'Beautiful tropical beaches and temples.', 'Bali.jpg'),
('Paris', 'France', 'The city of love and lights.', 'Paris.jpg'),
('Switzerland', 'Switzerland', 'Beautiful mountains and lakes.', 'Switzerland.jpg'),
('Maldives', 'Maldives', 'Crystal clear beaches and island resorts.', 'Maldives.jpg'),
('Dubai', 'UAE', 'Modern architecture and desert adventures.', 'Dubai.jpg'),
('Japan', 'Japan', 'Traditional culture and beautiful landscapes.', 'Japan.jpg'),
('Rome', 'Italy', 'Historic architecture and landmarks.', 'Rome.jpg'),
('Italy', 'Italy', 'Beautiful coastal towns and culture.', 'Italy.jpg'),
('South Korea', 'South Korea', 'Modern cities and traditional culture.', 'South Korea.jpg');

-- Create the admin account through the application
-- after password hashing is implemented.
