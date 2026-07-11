-- Naming convention idx_<table_name>_<column_name> ON schema.tablename (column name)

-- Index all the foreign keys in the orders TABLE
CREATE INDEX idx_orders_customer_id ON operations.orders (customer_id);
CREATE INDEX idx_order_drugs_id ON operations.orders (drug_id);
CREATE INDEX idx_order_attendant_emp ON operations.orders(attendant_id);
CREATE INDEX idx_order_paid_emp ON operations.orders(paid_to);
CREATE INDEX idx_order_dispatched_emp ON operations.orders(dispatched_by);
CREATE INDEX idx_order_prescribed_emp ON operations.orders(prescribed_by)

-- Index all the foreign keys in the trial_participants TABLE
CREATE INDEX idx_trial_participants_trial_id ON research.trial_participants (trial_id)

-- Index all the foreign keys in the approvals table
CREATE INDEX idx_approvals_drug_id ON research.approvals (drug_id)

-- Index all the foreign keys in the clinical_trials table
CREATE INDEX idx_clinical_trials_drug_id ON research.clinical_trials (drug_id)

-- Index all the foreign keys in the suppliers table
CREATE INDEX idx_suppliers_drug_id ON inventory.suppliers (drug_id)

-- Index all the foreign keys in the stock table
CREATE INDEX idx_stock_drug_id ON inventory.stock (drug_id)
