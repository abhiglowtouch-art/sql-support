-- Create Database
CREATE DATABASE support_analysis;
USE support_analysis;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE,
    plan_type VARCHAR(50)
);

-- Websites Table
CREATE TABLE websites (
    website_id INT PRIMARY KEY,
    customer_id INT,
    domain_name VARCHAR(100),
    platform VARCHAR(50),
    created_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Tickets Table
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    website_id INT,
    issue_type VARCHAR(100),
    status VARCHAR(50),
    priority VARCHAR(20),
    created_at TIMESTAMP,
    resolved_at TIMESTAMP,
    FOREIGN KEY (website_id) REFERENCES websites(website_id)
);

-- DNS Changes Table
CREATE TABLE dns_changes (
    change_id INT PRIMARY KEY,
    website_id INT,
    record_type VARCHAR(10),
    old_value VARCHAR(100),
    new_value VARCHAR(100),
    changed_at TIMESTAMP,
    FOREIGN KEY (website_id) REFERENCES websites(website_id)
);
