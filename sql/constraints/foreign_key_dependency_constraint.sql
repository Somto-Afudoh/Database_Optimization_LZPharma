--Hint
--ALTER TABLE <schema>.<child_table>
--ADD CONSTRAINT <constraint_name>
--FOREIGN KEY (<child_column>) REFERENCES <schema>.<parent_table>(<parent_column>)
--ON DELETE CASCADE;
-- Constraints on Orders table foreign key depencies

ALTER TABLE operations.orders
ADD CONSTRAINT fk_orders_customer_delete
FOREIGN KEY (customer_id) REFERENCES operations.customers 
(customer_id) ON DELETE SET NULL;

ALTER TABLE operations.orders
ADD CONSTRAINT fk_orders_attdnt_delete
FOREIGN KEY (attendant_id) REFERENCES operations.employees
(employee_id) ON DELETE SET NULL;

ALTER TABLE operations.orders
ADD CONSTRAINT fk_orders_prescrib_delete
FOREIGN KEY (prescribed_by) REFERENCES operations.employees
(employee_id) ON DELETE SET NULL;

ALTER TABLE operations.orders
ADD CONSTRAINT fk_orders_drugs_delete
FOREIGN KEY (drug_id) REFERENCES inventory.drugs
(drug_id) ON DELETE SET NULL;

-- Inventory.stock dependency
ALTER TABLE inventory.stock
ADD CONSTRAINT fk_stock_drug
FOREIGN KEY (drug_id) REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;

-- Inventory.suppliers dependency
ALTER TABLE inventory.suppliers
ADD CONSTRAINT fk_suppliers_drug
FOREIGN KEY (drug_id) REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;

-- research.clinical_trials dependency
ALTER TABLE research.clinical_trials
ADD CONSTRAINT fk_trials_drug
FOREIGN KEY (drug_id) REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;

-- research.trial_participants dependency
ALTER TABLE research.trial_participants
ADD CONSTRAINT fk_participants_trial
FOREIGN KEY (trial_id) REFERENCES research.clinical_trials(trial_id)
ON DELETE CASCADE;

-- research.approvals dependency
ALTER TABLE research.approvals
ADD CONSTRAINT fk_approvals_drug
FOREIGN KEY (drug_id) REFERENCES inventory.drugs(drug_id)
ON DELETE CASCADE;

