-- Insert Customers
INSERT INTO customers VALUES
(1, 'Arjun Nair', 'India', '2023-01-10', 'Premium'),
(2, 'Meera Pillai', 'India', '2023-03-22', 'Basic'),
(3, 'Rahul Menon', 'UAE', '2023-07-15', 'Premium');

-- Insert Websites
INSERT INTO websites VALUES
(101, 1, 'arjuntech.com', 'WordPress', '2023-01-15'),
(102, 2, 'meerastore.in', 'WebsiteBuilder', '2023-03-25'),
(103, 3, 'rahulglobal.ae', 'WordPress', '2023-07-20');

-- Insert Tickets
INSERT INTO tickets VALUES
(1001, 101, 'DNS Issue', 'Resolved', 'High', '2024-01-01 10:00:00', '2024-01-02 12:00:00'),
(1002, 101, 'Website Down', 'Resolved', 'High', '2024-01-05 09:00:00', '2024-01-06 15:00:00'),
(1003, 102, 'SSL Error', 'Resolved', 'Medium', '2024-01-03 11:00:00', '2024-01-03 18:00:00'),
(1004, 103, 'DNS Issue', 'Resolved', 'High', '2024-01-07 08:00:00', '2024-01-08 14:00:00'),
(1005, 101, 'Email Not Working', 'Open', 'Low', '2024-01-10 10:00:00', NULL);

-- Insert DNS Changes
INSERT INTO dns_changes VALUES
(5001, 101, 'A', '192.168.1.1', '34.120.55.21', '2024-01-01 08:30:00'),
(5002, 103, 'A', '10.0.0.1', '52.66.10.90', '2024-01-07 07:45:00');
