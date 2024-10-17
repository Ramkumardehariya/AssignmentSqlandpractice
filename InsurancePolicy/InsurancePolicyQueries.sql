-- DDL QUERIES
-- 1. Add a new column to the agents table:
ALTER TABLE agents ADD COLUMN region VARCHAR(100);


-- 2. Rename the policy_name column in the policies table to policy_title:
ALTER TABLE policies RENAME COLUMN policy_name TO policy_title;
ALTER TABLE policies RENAME COLUMN POLICY_TITLE TO POLICY_NAME;


-- 3. Drop the address column from the customers table:
ALTER TABLE customers DROP COLUMN address;
ALTER TABLE customers ADD COLUMN address varchar(255);


-- DML QUERIES
-- 1. Update a policy's premium amount:
UPDATE policies SET premium = 1500.00 WHERE policy_id = 201;
INSERT INTO policies (policy_id, policy_title, policy_type, coverage_details, premium, start_date, end_date)
VALUES 
(201, 'Health Secure Plan', 'Health', 'Covers hospitalization, surgery, and medication expenses', 1200.00, '2024-01-01', '2025-01-01'),
(202, 'Auto Protection Plan', 'Auto', 'Covers vehicle damage, theft, and accident liability', 800.00, '2024-03-15', '2025-03-15');



-- 2. Delete a specific claim:
DELETE FROM claims WHERE claim_id = 202; 
INSERT INTO claims (claim_id, claim_date, claim_amount, approved_amount, claim_status, policy_id, customer_id)
VALUES 
(202, '2024-09-20', 5000.00, 4500.00, 'Approved', 201, 1),
(302, '2024-10-01', 2000.00, 0.00, 'Denied', 202, 2);

INSERT INTO customers (customer_id, first_name, last_name, date_of_birth, gender, contact_number, email)
VALUES 
(1, 'John', 'Doe', '1985-05-12', 'Male', '1234567890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1990-08-25', 'Female', '0987654321', 'jane.smith@example.com');




-- 3. Insert a new policy assignment:
INSERT INTO policy_assignments (assignment_id, customer_id, policy_id, start_date, end_date)
       VALUES (301, 1, 201, '2024-10-15', '2025-10-15');







-- JOIN QUERIES
-- 1. Retrieve all customers with their assigned policies and agents:
SELECT c.customer_id, c.first_name, c.last_name, p.policy_title, a.first_name AS agent_first_name, a.last_name AS agent_last_name
       FROM customers c JOIN policy_assignments pa ON c.customer_id = pa.customer_id JOIN policies p ON pa.policy_id = p.policy_id
       JOIN agents a ON pa.assignment_id = a.agent_id;


-- 2. Find all claims and the associated policy details:
SELECT c.claim_id, c.claim_date, c.claim_amount, p.policy_title, p.policy_type FROM claims c JOIN policies p ON c.policy_id = p.policy_id;



-- 3. List all claims along with the customer details:
SELECT cl.claim_id, cl.claim_date, cl.claim_amount, cu.first_name, cu.last_name FROM claims cl
       JOIN customers cu ON cl.customer_id = cu.customer_id;



-- 4. Get the total claim amount and number of claims per policy type:
SELECT p.policy_type, COUNT(c.claim_id) AS total_claims, SUM(c.claim_amount) AS total_claim_amount FROM claims c
       JOIN policies p ON c.policy_id = p.policy_id
       GROUP BY p.policy_type;



-- 5. Find the most recent claim for each customer:
SELECT c.customer_id, c.first_name, c.last_name, cl.claim_date, cl.claim_amount FROM customers c JOIN claims cl ON c.customer_id = cl.customer_id
      WHERE cl.claim_date = ( SELECT MAX(cl2.claim_date) FROM claims cl2 WHERE cl2.customer_id = c.customer_id);



