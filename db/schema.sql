DROP DATABASE IF EXISTS complaint_management_system;

CREATE DATABASE complaint_management_system;
USE complaint_management_system;

-- Users table
CREATE TABLE users (
                       user_id VARCHAR(50) PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       number VARCHAR(50) NOT NULL,
                       role ENUM('EMPLOYEE', 'ADMIN') NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Complaints table with ON DELETE CASCADE for foreign keys
CREATE TABLE complaints (
                            complaint_id VARCHAR(50) PRIMARY KEY,
                            title VARCHAR(200) NOT NULL,
                            description TEXT NOT NULL,
                            department VARCHAR(50) NOT NULL,
                            priority ENUM('LOW', 'MEDIUM', 'HIGH') DEFAULT 'MEDIUM',
                            status ENUM('PENDING', 'IN_PROGRESS', 'RESOLVED', 'REJECTED') DEFAULT 'PENDING',
                            submitted_by VARCHAR(50) NOT NULL,
                            assigned_to VARCHAR(50),
                            admin_remarks TEXT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            FOREIGN KEY (submitted_by) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
                            FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Sample data
INSERT INTO users (user_id, username, password, full_name, email, number, role)
VALUES ('ADM001', 'Sainsa', '1234', 'Sainsa Rethmi', 'sainsa@gmail.com', '0704839927', 'ADMIN');

-- Employee 1 (Tharushan)
INSERT INTO users (user_id, username, password, full_name, email, number, role)
VALUES ('EMP001', 'Rethmi', '5678', 'Rethmi Thennakoon', 'rethmi@gmail.com', '0787345352', 'EMPLOYEE');



-- Complaint submitted by EMPLOYEE 'EMP001' and not yet assigned
INSERT INTO complaints (
    complaint_id, title, description, department, priority,
    status, submitted_by, assigned_to, admin_remarks
) VALUES (
             'CMP001',
             'Air Conditioner Not Working',
             'The AC in Room 204 is not functioning properly and needs urgent repair.',
             'Maintenance',
             'HIGH',
             'PENDING',
             'EMP001',
             NULL,
             NULL
         );

-- Complaint submitted by EMP001 and assigned to ADMIN 'ADM001'
INSERT INTO complaints (
    complaint_id, title, description, department, priority,
    status, submitted_by, assigned_to, admin_remarks
) VALUES (
             'CMP002',
             'Email Not Receiving',
             'Unable to receive emails since last week.',
             'IT Support',
             'MEDIUM',
             'IN_PROGRESS',
             'EMP001',
             'ADM001',
             'Issue forwarded to IT department.'
         );
