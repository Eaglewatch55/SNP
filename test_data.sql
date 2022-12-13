-- DATOS DE company_group
INSERT INTO company_group (group_name, alias, contact_mail)
VALUES ('Test group', 'test', 'test@mail.com');

-- DATOS DE company
INSERT INTO company (id_group, comp_name, alias)
VALUES (1, 'Company 1', 'C1');
INSERT INTO company (id_group, comp_name, alias)
VALUES (1, 'Company 2', 'C2');
INSERT INTO company (id_group, comp_name, alias)
VALUES (1, 'Company 3', 'C3');

-- DATOS DE simple_loan
INSERT INTO simple_loan (id_comp, loan_num, alias, currency, loan_amount, int_type, int_rate, months_term, financial_entity,loan_type, date_start,date_end)
VALUES (1, 'C1S001', 'c1simple1', 'MXN', 100000, 'FIX', .12, 24, 'BBVA', 'Automotriz', '2022-11-02', '2024-11-02');
INSERT INTO simple_loan (id_comp, loan_num, alias, currency, loan_amount, int_type, int_rate, months_term, financial_entity,loan_type, date_start,date_end)
VALUES (2, 'C2S001', 'c2simple1', 'MXN', 200000, 'FIX', .09, 36, 'BANORTE', 'Automotriz', '2021-09-10', '2024-09-10');
INSERT INTO simple_loan (id_comp, loan_num, alias, currency, loan_amount, int_type, int_rate, months_term, financial_entity,loan_type, date_start,date_end)
VALUES (2, 'C2S002', 'c2simple2', 'USD', 50000, 'VAR', .03, 48, 'BANK OF AMERICA', 'Maquinaria-Equipo', '2021-06-14', '2025-06-14');

-- DATOS DE revolver_credit
INSERT INTO revolver_credit (id_comp, credit_num, alias, currency, credit_limit, int_type, int_rate, months_term, financial_entity, date_start, date_end)
VALUES (1, 'C1R001', 'c1revol1', 'MXN', 3000000, 'VAR', .15, 24, 'BANREGIO', '2022-07-15', '2024-07-15');
INSERT INTO revolver_credit (id_comp, credit_num, alias, currency, credit_limit, int_type, int_rate, months_term, financial_entity, date_start, date_end)
VALUES (1, 'C1R002', 'c1revol2', 'MXN', 500000, 'VAR', .17, 36, 'BANREGIO', '2020-07-15', '2023-07-15');
INSERT INTO revolver_credit (id_comp, credit_num, alias, currency, credit_limit, int_type, int_rate, months_term, financial_entity, date_start, date_end)
VALUES (2, 'C2R001', 'c2revol1', 'MXN', 10000000, 'VAR', .15, 24, 'BANREGIO', '2022-09-15', '2024-09-15');

--DATOS DE credit_card
INSERT INTO credit_card (id_comp, card_num, alias, currency, credit_limit, int_rate, closing_date, payment_due_date, expiration_date, anual_fee_ammount, anual_fee_date, financial_entity)
VALUES (1, 1234123412341234, 'c1card', 'MXN', 114300, .46, '2021-10-21', '2021-11-11', '2023-10-01', 1200, '2021-03-05', 'BBVA');

--DATOS DE TABLA leasing
INSERT INTO leasing (id_comp, leasing_num, alias, currency, leasing_amount, int_type, int_rate, months_term, financial_entity, lease_type, date_start, date_end)
VALUES (3, 'C3L001', 'c3leas1', 'MXN', 350000, 'FIX', .13, 36, 'BANCREA', 'Automotriz', '2021-02-14', '2024-02-14');

