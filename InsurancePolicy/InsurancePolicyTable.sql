CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

SELECT * FROM CUSTOMERS;

CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    policy_name VARCHAR(100),
    policy_type VARCHAR(50),
    coverage_details TEXT,
    premium DECIMAL(10, 2),
    start_date DATE,
    end_date DATE
);

SELECT * FROM POLICIES;

CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    claim_date DATE,
    claim_amount DECIMAL(10, 2),
    approved_amount DECIMAL(10, 2),
    claim_status VARCHAR(20),
    policy_id INT,
    customer_id INT,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM CLAIMS;

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    hire_date DATE
);

SELECT * FROM AGENTS;

CREATE TABLE policy_assignments (
    assignment_id INT PRIMARY KEY,
    customer_id INT,
    policy_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

SELECT * FROM POLICY_ASSIGNMENTS;

CREATE TABLE claim_processing (
    processing_id INT PRIMARY KEY,
    claim_id INT,
    processing_date DATE,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

SELECT * FROM CLAIM_PROCESSING;





