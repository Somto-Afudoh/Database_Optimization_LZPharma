-- Optimization III - Data governance & role-based access control
-- Data governance is the process of managing, protecting, and 
--controlling data so that it is accurate, secure, consistent, 
-- and used appropriately across an organization.

-- Data Quality Implementation
ALTER TABLE inventory.drugs
ADD CONSTRAINT chk_price_positive CHECK (price > 0);

ALTER TABLE inventory.stock
ADD CONSTRAINT chk_quantity_nonnegative CHECK (quantity >= 0);

--RBACs
-- Roles are the positions/groups in the DATABASE
--Users are the people that occupies the ROLE

-- Step1: Create the Roles
CREATE ROLE data_engineer NOLOGIN;
CREATE ROLE data_analyst NOLOGIN;
CREATE ROLE researcher NOLOGIN;

-- delete a role
DROP ROLE name_of_role
-- Strip off its permission
DROP OWNED BY name_of_role
SELECT * FROM pg_catalog.pg_roles;

-- Step 2: Grant Permissions and Define actions within the 
--database
-- For Data Engineer: [grant a full read/ write Permission 
-- on the operations and inventory schemas; 
-- READ ONLY ACCESS TO RESEARCH SCHEMA]

GRANT USAGE ON SCHEMA operations, inventory TO data_engineer; -- To see the SCHEMAS
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA operations, inventory
TO data_engineer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA operations, inventory
TO data_engineer;

-- Read Only Access to Research
GRANT USAGE ON SCHEMA research TO data_engineer; -- To see the SCHEMAS
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA 
TO data_engineer;


-- For Researchers 
-- [Full read/write access to all tables in research schema]
GRANT USAGE ON SCHEMA research TO researcher;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA
research TO researcher; --[another way to grant permission]
GRANT USAGE ON ALL SEQUENCES IN SCHEMA research TO 
researcher; --[sequences: granting write access - id serial]

-- Analyst [read- only access on operations, inventory]
GRANT USAGE ON SCHEMA operations, inventory TO data_analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA operations, inventory
TO data_analyst

--REVOKE SELECT ON operations.customers FROM data_analyst;
REVOKE SELECT ON operations.customers FROM data_analyst;
--for GDPR

-- Step 3: Create Users & Assign Roles
-- Somto Data Engineer
CREATE USER somto WITH PASSWORD 'SomtoTheDataEngineer!';
CREATE USER osaka WITH PASSWORD 'OsakaTheDataAnalyst!';
CREATE USER toby WITH PASSWORD 'TobyTheResearcher';

-- Assign roles to the user
GRANT data_engineer TO somto;
GRANT data_analyst TO osaka;
GRANT researcher TO toby;

-- Delete a user from a role
REVOKE data_engineer FROM somto

- delete a user
DROP USER somto IF EXISTS