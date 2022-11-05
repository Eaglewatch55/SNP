-- CREACION DE TABLA company_group
CREATE TABLE company_group (
    id_group BIGSERIAL NOT NULL PRIMARY KEY,
    group_name VARCHAR (50) NOT NULL,
    group_alias VARCHAR (6) NOT NULL,
    contact_mail VARCHAR (50) NOT NULL
);
ALTER TABLE company_group ADD CONSTRAINT unique_group UNIQUE (id_group, group_name, group_alias);

-- CRACION DE TABLA company
CREATE TABLE company (
    id_comp BIGSERIAL NOT NULL PRIMARY KEY,
    id_group BIGINT REFERENCES company_group(id_group) NOT NULL,
    comp_name VARCHAR (50) NOT NULL,
    comp_alias VARCHAR (6) NOT NULL
);
ALTER TABLE company ADD CONSTRAINT unique_company UNIQUE (id_comp, id_group, comp_name, comp_alias);

--CREACION DE TABLA simple_loan
CREATE TABLE simple_loan (
    id_simple_loan BIGSERIAL NOT NULL PRIMARY KEY,
    id_comp BIGINT REFERENCES company(id_comp) NOT NULL,
    loan_num VARCHAR (50),
    loan_alias VARCHAR (10) NOT NULL,
    currency VARCHAR(3),
    loan_amount NUMERIC (20,2) NOT NULL,
    int_type VARCHAR (3) NOT NULL,
    int_rate NUMERIC (6,4) NOT NULL,
    months_term INTEGER NOT NULL,
    financial_entity VARCHAR (50) NOT NULL,
    loan_type VARCHAR (50),
    date_start DATE NOT NULL,
    date_end DATE NOT NULL
);
ALTER TABLE simple_loan ADD CONSTRAINT unique_simple_keys UNIQUE (id_simple_loan);
ALTER TABLE simple_loan ADD CONSTRAINT list_simple_currency CHECK (
    currency = 'AUD' OR 
    currency = 'GBP' OR 
    currency = 'EUR' OR 
    currency = 'JPY' OR 
    currency = 'CHF' OR 
    currency = 'USD' OR 
    currency = 'AFN' OR 
    currency = 'ALL' OR 
    currency = 'DZD' OR 
    currency = 'AOA' OR 
    currency = 'ARS' OR 
    currency = 'AMD' OR 
    currency = 'AWG' OR 
    currency = 'AUD' OR 
    currency = 'ATS' OR 
    currency = 'BEF' OR 
    currency = 'AZN' OR 
    currency = 'BSD' OR 
    currency = 'BHD' OR 
    currency = 'BDT' OR 
    currency = 'BBD' OR 
    currency = 'BYR' OR 
    currency = 'BZD' OR 
    currency = 'BMD' OR 
    currency = 'BTN' OR 
    currency = 'BOB' OR 
    currency = 'BAM' OR 
    currency = 'BWP' OR 
    currency = 'BRL' OR 
    currency = 'GBP' OR 
    currency = 'BND' OR 
    currency = 'BGN' OR 
    currency = 'BIF' OR 
    currency = 'XOF' OR 
    currency = 'XAF' OR 
    currency = 'XPF' OR 
    currency = 'KHR' OR 
    currency = 'CAD' OR 
    currency = 'CVE' OR 
    currency = 'KYD' OR 
    currency = 'CLP' OR 
    currency = 'CNY' OR 
    currency = 'COP' OR 
    currency = 'KMF' OR 
    currency = 'CDF' OR 
    currency = 'CRC' OR 
    currency = 'HRK' OR 
    currency = 'CUC' OR 
    currency = 'CUP' OR 
    currency = 'CYP' OR 
    currency = 'CZK' OR 
    currency = 'DKK' OR 
    currency = 'DJF' OR 
    currency = 'DOP' OR 
    currency = 'XCD' OR 
    currency = 'EGP' OR 
    currency = 'SVC' OR 
    currency = 'EEK' OR 
    currency = 'ETB' OR 
    currency = 'EUR' OR 
    currency = 'FKP' OR 
    currency = 'FIM' OR 
    currency = 'FJD' OR 
    currency = 'GMD' OR 
    currency = 'GEL' OR 
    currency = 'DMK' OR 
    currency = 'GHS' OR 
    currency = 'GIP' OR 
    currency = 'GRD' OR 
    currency = 'GTQ' OR 
    currency = 'GNF' OR 
    currency = 'GYD' OR 
    currency = 'HTG' OR 
    currency = 'HNL' OR 
    currency = 'HKD' OR 
    currency = 'HUF' OR 
    currency = 'ISK' OR 
    currency = 'INR' OR 
    currency = 'IDR' OR 
    currency = 'IRR' OR 
    currency = 'IQD' OR 
    currency = 'IED' OR 
    currency = 'ILS' OR 
    currency = 'ITL' OR 
    currency = 'JMD' OR 
    currency = 'JPY' OR 
    currency = 'JOD' OR 
    currency = 'KZT' OR 
    currency = 'KES' OR 
    currency = 'KWD' OR 
    currency = 'KGS' OR 
    currency = 'LAK' OR 
    currency = 'LVL' OR 
    currency = 'LBP' OR 
    currency = 'LSL' OR 
    currency = 'LRD' OR 
    currency = 'LYD' OR 
    currency = 'LTL' OR 
    currency = 'LUF' OR 
    currency = 'MOP' OR 
    currency = 'MKD' OR 
    currency = 'MGA' OR 
    currency = 'MWK' OR 
    currency = 'MYR' OR 
    currency = 'MVR' OR 
    currency = 'MTL' OR 
    currency = 'MRO' OR 
    currency = 'MUR' OR 
    currency = 'MXN' OR 
    currency = 'MDL' OR 
    currency = 'MNT' OR 
    currency = 'MAD' OR 
    currency = 'MZN' OR 
    currency = 'MMK' OR 
    currency = 'ANG' OR 
    currency = 'NAD' OR 
    currency = 'NPR' OR 
    currency = 'NLG' OR 
    currency = 'NZD' OR 
    currency = 'NIO' OR 
    currency = 'NGN' OR 
    currency = 'KPW' OR 
    currency = 'NOK' OR 
    currency = 'OMR' OR 
    currency = 'PKR' OR 
    currency = 'PAB' OR 
    currency = 'PGK' OR 
    currency = 'PYG' OR 
    currency = 'PEN' OR 
    currency = 'PHP' OR 
    currency = 'PLN' OR 
    currency = 'PTE' OR 
    currency = 'QAR' OR 
    currency = 'RON' OR 
    currency = 'RUB' OR 
    currency = 'RWF' OR 
    currency = 'WST' OR 
    currency = 'STD' OR 
    currency = 'SAR' OR 
    currency = 'RSD' OR 
    currency = 'SCR' OR 
    currency = 'SLL' OR 
    currency = 'SGD' OR 
    currency = 'SKK' OR 
    currency = 'SIT' OR 
    currency = 'SBD' OR 
    currency = 'SOS' OR 
    currency = 'ZAR' OR 
    currency = 'KRW' OR 
    currency = 'ESP' OR 
    currency = 'LKR' OR 
    currency = 'SHP' OR 
    currency = 'SDG' OR 
    currency = 'SRD' OR 
    currency = 'SZL' OR 
    currency = 'SEK' OR 
    currency = 'CHF' OR 
    currency = 'SYP' OR 
    currency = 'TWD' OR 
    currency = 'TZS' OR 
    currency = 'THB' OR 
    currency = 'TOP' OR 
    currency = 'TTD' OR 
    currency = 'TND' OR 
    currency = 'TRY' OR 
    currency = 'TMM' OR 
    currency = 'USD' OR 
    currency = 'UGX' OR 
    currency = 'UAH' OR 
    currency = 'UYU' OR 
    currency = 'AED' OR 
    currency = 'VUV' OR 
    currency = 'VEB' OR 
    currency = 'VND' OR 
    currency = 'YER' OR 
    currency = 'ZMK' OR 
    currency = 'ZWD'
);
ALTER TABLE simple_loan ADD CONSTRAINT list_int_type_simple CHECK (int_type = 'FIX' OR int_type = 'VAR');
ALTER TABLE simple_loan ADD CONSTRAINT list_loan_type_simple CHECK (
    loan_type = 'Hipotecario' OR 
    loan_type = 'Automotriz' OR 
    loan_type = 'Capital de trabajo' OR
    loan_type = 'Maquinaria-Equipo'
);

--CREACION DE TABLA revolver_credit
CREATE TABLE revolver_credit (
    id_revolver BIGSERIAL NOT NULL PRIMARY KEY,
    id_comp BIGINT REFERENCES company(id_comp) NOT NULL,
    credit_num VARCHAR (50),
    credit_alias VARCHAR (10) NOT NULL,
    currency VARCHAR(3),
    credit_limit NUMERIC (20,2) NOT NULL,
    int_type VARCHAR (3) NOT NULL,
    int_rate NUMERIC (6,4) NOT NULL,
    months_term INTEGER NOT NULL,
    financial_entity VARCHAR (50) NOT NULL,
    date_start DATE NOT NULL,
    date_end DATE NOT NULL
);
ALTER TABLE revolver_credit ADD CONSTRAINT unique_revolver_keys UNIQUE (id_revolver);
ALTER TABLE revolver_credit ADD CONSTRAINT list_revolver_currency CHECK (
    currency = 'AUD' OR 
    currency = 'GBP' OR 
    currency = 'EUR' OR 
    currency = 'JPY' OR 
    currency = 'CHF' OR 
    currency = 'USD' OR 
    currency = 'AFN' OR 
    currency = 'ALL' OR 
    currency = 'DZD' OR 
    currency = 'AOA' OR 
    currency = 'ARS' OR 
    currency = 'AMD' OR 
    currency = 'AWG' OR 
    currency = 'AUD' OR 
    currency = 'ATS' OR 
    currency = 'BEF' OR 
    currency = 'AZN' OR 
    currency = 'BSD' OR 
    currency = 'BHD' OR 
    currency = 'BDT' OR 
    currency = 'BBD' OR 
    currency = 'BYR' OR 
    currency = 'BZD' OR 
    currency = 'BMD' OR 
    currency = 'BTN' OR 
    currency = 'BOB' OR 
    currency = 'BAM' OR 
    currency = 'BWP' OR 
    currency = 'BRL' OR 
    currency = 'GBP' OR 
    currency = 'BND' OR 
    currency = 'BGN' OR 
    currency = 'BIF' OR 
    currency = 'XOF' OR 
    currency = 'XAF' OR 
    currency = 'XPF' OR 
    currency = 'KHR' OR 
    currency = 'CAD' OR 
    currency = 'CVE' OR 
    currency = 'KYD' OR 
    currency = 'CLP' OR 
    currency = 'CNY' OR 
    currency = 'COP' OR 
    currency = 'KMF' OR 
    currency = 'CDF' OR 
    currency = 'CRC' OR 
    currency = 'HRK' OR 
    currency = 'CUC' OR 
    currency = 'CUP' OR 
    currency = 'CYP' OR 
    currency = 'CZK' OR 
    currency = 'DKK' OR 
    currency = 'DJF' OR 
    currency = 'DOP' OR 
    currency = 'XCD' OR 
    currency = 'EGP' OR 
    currency = 'SVC' OR 
    currency = 'EEK' OR 
    currency = 'ETB' OR 
    currency = 'EUR' OR 
    currency = 'FKP' OR 
    currency = 'FIM' OR 
    currency = 'FJD' OR 
    currency = 'GMD' OR 
    currency = 'GEL' OR 
    currency = 'DMK' OR 
    currency = 'GHS' OR 
    currency = 'GIP' OR 
    currency = 'GRD' OR 
    currency = 'GTQ' OR 
    currency = 'GNF' OR 
    currency = 'GYD' OR 
    currency = 'HTG' OR 
    currency = 'HNL' OR 
    currency = 'HKD' OR 
    currency = 'HUF' OR 
    currency = 'ISK' OR 
    currency = 'INR' OR 
    currency = 'IDR' OR 
    currency = 'IRR' OR 
    currency = 'IQD' OR 
    currency = 'IED' OR 
    currency = 'ILS' OR 
    currency = 'ITL' OR 
    currency = 'JMD' OR 
    currency = 'JPY' OR 
    currency = 'JOD' OR 
    currency = 'KZT' OR 
    currency = 'KES' OR 
    currency = 'KWD' OR 
    currency = 'KGS' OR 
    currency = 'LAK' OR 
    currency = 'LVL' OR 
    currency = 'LBP' OR 
    currency = 'LSL' OR 
    currency = 'LRD' OR 
    currency = 'LYD' OR 
    currency = 'LTL' OR 
    currency = 'LUF' OR 
    currency = 'MOP' OR 
    currency = 'MKD' OR 
    currency = 'MGA' OR 
    currency = 'MWK' OR 
    currency = 'MYR' OR 
    currency = 'MVR' OR 
    currency = 'MTL' OR 
    currency = 'MRO' OR 
    currency = 'MUR' OR 
    currency = 'MXN' OR 
    currency = 'MDL' OR 
    currency = 'MNT' OR 
    currency = 'MAD' OR 
    currency = 'MZN' OR 
    currency = 'MMK' OR 
    currency = 'ANG' OR 
    currency = 'NAD' OR 
    currency = 'NPR' OR 
    currency = 'NLG' OR 
    currency = 'NZD' OR 
    currency = 'NIO' OR 
    currency = 'NGN' OR 
    currency = 'KPW' OR 
    currency = 'NOK' OR 
    currency = 'OMR' OR 
    currency = 'PKR' OR 
    currency = 'PAB' OR 
    currency = 'PGK' OR 
    currency = 'PYG' OR 
    currency = 'PEN' OR 
    currency = 'PHP' OR 
    currency = 'PLN' OR 
    currency = 'PTE' OR 
    currency = 'QAR' OR 
    currency = 'RON' OR 
    currency = 'RUB' OR 
    currency = 'RWF' OR 
    currency = 'WST' OR 
    currency = 'STD' OR 
    currency = 'SAR' OR 
    currency = 'RSD' OR 
    currency = 'SCR' OR 
    currency = 'SLL' OR 
    currency = 'SGD' OR 
    currency = 'SKK' OR 
    currency = 'SIT' OR 
    currency = 'SBD' OR 
    currency = 'SOS' OR 
    currency = 'ZAR' OR 
    currency = 'KRW' OR 
    currency = 'ESP' OR 
    currency = 'LKR' OR 
    currency = 'SHP' OR 
    currency = 'SDG' OR 
    currency = 'SRD' OR 
    currency = 'SZL' OR 
    currency = 'SEK' OR 
    currency = 'CHF' OR 
    currency = 'SYP' OR 
    currency = 'TWD' OR 
    currency = 'TZS' OR 
    currency = 'THB' OR 
    currency = 'TOP' OR 
    currency = 'TTD' OR 
    currency = 'TND' OR 
    currency = 'TRY' OR 
    currency = 'TMM' OR 
    currency = 'USD' OR 
    currency = 'UGX' OR 
    currency = 'UAH' OR 
    currency = 'UYU' OR 
    currency = 'AED' OR 
    currency = 'VUV' OR 
    currency = 'VEB' OR 
    currency = 'VND' OR 
    currency = 'YER' OR 
    currency = 'ZMK' OR 
    currency = 'ZWD'
);
ALTER TABLE revolver_credit ADD CONSTRAINT list_int_type_revolver CHECK (int_type = 'FIX' OR int_type = 'VAR');

--CREACION DE TABLA credit_card
CREATE TABLE credit_card (
    id_credit_card BIGSERIAL NOT NULL PRIMARY KEY,
    id_comp BIGINT REFERENCES company(id_comp) NOT NULL,
    card_num NUMERIC (16,0),
    card_alias VARCHAR (10) NOT NULL,
    currency VARCHAR(3),
    credit_limit NUMERIC (20,2) NOT NULL,
    int_rate NUMERIC (6,4) NOT NULL,
    closing_date DATE NOT NULL,
    payment_due_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    anual_fee_ammount NUMERIC (20,2),
    anual_fee_date DATE,
    financial_entity VARCHAR (50) NOT NULL
);
ALTER TABLE credit_card ADD CONSTRAINT unique_credit_card_keys UNIQUE (id_credit_card);
ALTER TABLE credit_card ADD CONSTRAINT list_credit_card_currency CHECK (
    currency = 'AUD' OR 
    currency = 'GBP' OR 
    currency = 'EUR' OR 
    currency = 'JPY' OR 
    currency = 'CHF' OR 
    currency = 'USD' OR 
    currency = 'AFN' OR 
    currency = 'ALL' OR 
    currency = 'DZD' OR 
    currency = 'AOA' OR 
    currency = 'ARS' OR 
    currency = 'AMD' OR 
    currency = 'AWG' OR 
    currency = 'AUD' OR 
    currency = 'ATS' OR 
    currency = 'BEF' OR 
    currency = 'AZN' OR 
    currency = 'BSD' OR 
    currency = 'BHD' OR 
    currency = 'BDT' OR 
    currency = 'BBD' OR 
    currency = 'BYR' OR 
    currency = 'BZD' OR 
    currency = 'BMD' OR 
    currency = 'BTN' OR 
    currency = 'BOB' OR 
    currency = 'BAM' OR 
    currency = 'BWP' OR 
    currency = 'BRL' OR 
    currency = 'GBP' OR 
    currency = 'BND' OR 
    currency = 'BGN' OR 
    currency = 'BIF' OR 
    currency = 'XOF' OR 
    currency = 'XAF' OR 
    currency = 'XPF' OR 
    currency = 'KHR' OR 
    currency = 'CAD' OR 
    currency = 'CVE' OR 
    currency = 'KYD' OR 
    currency = 'CLP' OR 
    currency = 'CNY' OR 
    currency = 'COP' OR 
    currency = 'KMF' OR 
    currency = 'CDF' OR 
    currency = 'CRC' OR 
    currency = 'HRK' OR 
    currency = 'CUC' OR 
    currency = 'CUP' OR 
    currency = 'CYP' OR 
    currency = 'CZK' OR 
    currency = 'DKK' OR 
    currency = 'DJF' OR 
    currency = 'DOP' OR 
    currency = 'XCD' OR 
    currency = 'EGP' OR 
    currency = 'SVC' OR 
    currency = 'EEK' OR 
    currency = 'ETB' OR 
    currency = 'EUR' OR 
    currency = 'FKP' OR 
    currency = 'FIM' OR 
    currency = 'FJD' OR 
    currency = 'GMD' OR 
    currency = 'GEL' OR 
    currency = 'DMK' OR 
    currency = 'GHS' OR 
    currency = 'GIP' OR 
    currency = 'GRD' OR 
    currency = 'GTQ' OR 
    currency = 'GNF' OR 
    currency = 'GYD' OR 
    currency = 'HTG' OR 
    currency = 'HNL' OR 
    currency = 'HKD' OR 
    currency = 'HUF' OR 
    currency = 'ISK' OR 
    currency = 'INR' OR 
    currency = 'IDR' OR 
    currency = 'IRR' OR 
    currency = 'IQD' OR 
    currency = 'IED' OR 
    currency = 'ILS' OR 
    currency = 'ITL' OR 
    currency = 'JMD' OR 
    currency = 'JPY' OR 
    currency = 'JOD' OR 
    currency = 'KZT' OR 
    currency = 'KES' OR 
    currency = 'KWD' OR 
    currency = 'KGS' OR 
    currency = 'LAK' OR 
    currency = 'LVL' OR 
    currency = 'LBP' OR 
    currency = 'LSL' OR 
    currency = 'LRD' OR 
    currency = 'LYD' OR 
    currency = 'LTL' OR 
    currency = 'LUF' OR 
    currency = 'MOP' OR 
    currency = 'MKD' OR 
    currency = 'MGA' OR 
    currency = 'MWK' OR 
    currency = 'MYR' OR 
    currency = 'MVR' OR 
    currency = 'MTL' OR 
    currency = 'MRO' OR 
    currency = 'MUR' OR 
    currency = 'MXN' OR 
    currency = 'MDL' OR 
    currency = 'MNT' OR 
    currency = 'MAD' OR 
    currency = 'MZN' OR 
    currency = 'MMK' OR 
    currency = 'ANG' OR 
    currency = 'NAD' OR 
    currency = 'NPR' OR 
    currency = 'NLG' OR 
    currency = 'NZD' OR 
    currency = 'NIO' OR 
    currency = 'NGN' OR 
    currency = 'KPW' OR 
    currency = 'NOK' OR 
    currency = 'OMR' OR 
    currency = 'PKR' OR 
    currency = 'PAB' OR 
    currency = 'PGK' OR 
    currency = 'PYG' OR 
    currency = 'PEN' OR 
    currency = 'PHP' OR 
    currency = 'PLN' OR 
    currency = 'PTE' OR 
    currency = 'QAR' OR 
    currency = 'RON' OR 
    currency = 'RUB' OR 
    currency = 'RWF' OR 
    currency = 'WST' OR 
    currency = 'STD' OR 
    currency = 'SAR' OR 
    currency = 'RSD' OR 
    currency = 'SCR' OR 
    currency = 'SLL' OR 
    currency = 'SGD' OR 
    currency = 'SKK' OR 
    currency = 'SIT' OR 
    currency = 'SBD' OR 
    currency = 'SOS' OR 
    currency = 'ZAR' OR 
    currency = 'KRW' OR 
    currency = 'ESP' OR 
    currency = 'LKR' OR 
    currency = 'SHP' OR 
    currency = 'SDG' OR 
    currency = 'SRD' OR 
    currency = 'SZL' OR 
    currency = 'SEK' OR 
    currency = 'CHF' OR 
    currency = 'SYP' OR 
    currency = 'TWD' OR 
    currency = 'TZS' OR 
    currency = 'THB' OR 
    currency = 'TOP' OR 
    currency = 'TTD' OR 
    currency = 'TND' OR 
    currency = 'TRY' OR 
    currency = 'TMM' OR 
    currency = 'USD' OR 
    currency = 'UGX' OR 
    currency = 'UAH' OR 
    currency = 'UYU' OR 
    currency = 'AED' OR 
    currency = 'VUV' OR 
    currency = 'VEB' OR 
    currency = 'VND' OR 
    currency = 'YER' OR 
    currency = 'ZMK' OR 
    currency = 'ZWD'
);

--CREACION DE TABLA leasing
CREATE TABLE leasing (
    id_leasing BIGSERIAL NOT NULL PRIMARY KEY,
    id_comp BIGINT REFERENCES company(id_comp) NOT NULL,
    leasing_num VARCHAR (50),
    leasing_alias VARCHAR (10) NOT NULL,
    currency VARCHAR(3),
    leasing_amount NUMERIC (20,2) NOT NULL,
    int_type VARCHAR (3) NOT NULL,
    int_rate NUMERIC (6,4) NOT NULL,
    months_term INTEGER NOT NULL,
    financial_entity VARCHAR (50) NOT NULL,
    lease_type VARCHAR (50),
    date_start DATE NOT NULL,
    date_end DATE NOT NULL
);
ALTER TABLE leasing ADD CONSTRAINT unique_leasing_keys UNIQUE (id_leasing);
ALTER TABLE leasing ADD CONSTRAINT list_leasing_currency CHECK (
    currency = 'AUD' OR 
    currency = 'GBP' OR 
    currency = 'EUR' OR 
    currency = 'JPY' OR 
    currency = 'CHF' OR 
    currency = 'USD' OR 
    currency = 'AFN' OR 
    currency = 'ALL' OR 
    currency = 'DZD' OR 
    currency = 'AOA' OR 
    currency = 'ARS' OR 
    currency = 'AMD' OR 
    currency = 'AWG' OR 
    currency = 'AUD' OR 
    currency = 'ATS' OR 
    currency = 'BEF' OR 
    currency = 'AZN' OR 
    currency = 'BSD' OR 
    currency = 'BHD' OR 
    currency = 'BDT' OR 
    currency = 'BBD' OR 
    currency = 'BYR' OR 
    currency = 'BZD' OR 
    currency = 'BMD' OR 
    currency = 'BTN' OR 
    currency = 'BOB' OR 
    currency = 'BAM' OR 
    currency = 'BWP' OR 
    currency = 'BRL' OR 
    currency = 'GBP' OR 
    currency = 'BND' OR 
    currency = 'BGN' OR 
    currency = 'BIF' OR 
    currency = 'XOF' OR 
    currency = 'XAF' OR 
    currency = 'XPF' OR 
    currency = 'KHR' OR 
    currency = 'CAD' OR 
    currency = 'CVE' OR 
    currency = 'KYD' OR 
    currency = 'CLP' OR 
    currency = 'CNY' OR 
    currency = 'COP' OR 
    currency = 'KMF' OR 
    currency = 'CDF' OR 
    currency = 'CRC' OR 
    currency = 'HRK' OR 
    currency = 'CUC' OR 
    currency = 'CUP' OR 
    currency = 'CYP' OR 
    currency = 'CZK' OR 
    currency = 'DKK' OR 
    currency = 'DJF' OR 
    currency = 'DOP' OR 
    currency = 'XCD' OR 
    currency = 'EGP' OR 
    currency = 'SVC' OR 
    currency = 'EEK' OR 
    currency = 'ETB' OR 
    currency = 'EUR' OR 
    currency = 'FKP' OR 
    currency = 'FIM' OR 
    currency = 'FJD' OR 
    currency = 'GMD' OR 
    currency = 'GEL' OR 
    currency = 'DMK' OR 
    currency = 'GHS' OR 
    currency = 'GIP' OR 
    currency = 'GRD' OR 
    currency = 'GTQ' OR 
    currency = 'GNF' OR 
    currency = 'GYD' OR 
    currency = 'HTG' OR 
    currency = 'HNL' OR 
    currency = 'HKD' OR 
    currency = 'HUF' OR 
    currency = 'ISK' OR 
    currency = 'INR' OR 
    currency = 'IDR' OR 
    currency = 'IRR' OR 
    currency = 'IQD' OR 
    currency = 'IED' OR 
    currency = 'ILS' OR 
    currency = 'ITL' OR 
    currency = 'JMD' OR 
    currency = 'JPY' OR 
    currency = 'JOD' OR 
    currency = 'KZT' OR 
    currency = 'KES' OR 
    currency = 'KWD' OR 
    currency = 'KGS' OR 
    currency = 'LAK' OR 
    currency = 'LVL' OR 
    currency = 'LBP' OR 
    currency = 'LSL' OR 
    currency = 'LRD' OR 
    currency = 'LYD' OR 
    currency = 'LTL' OR 
    currency = 'LUF' OR 
    currency = 'MOP' OR 
    currency = 'MKD' OR 
    currency = 'MGA' OR 
    currency = 'MWK' OR 
    currency = 'MYR' OR 
    currency = 'MVR' OR 
    currency = 'MTL' OR 
    currency = 'MRO' OR 
    currency = 'MUR' OR 
    currency = 'MXN' OR 
    currency = 'MDL' OR 
    currency = 'MNT' OR 
    currency = 'MAD' OR 
    currency = 'MZN' OR 
    currency = 'MMK' OR 
    currency = 'ANG' OR 
    currency = 'NAD' OR 
    currency = 'NPR' OR 
    currency = 'NLG' OR 
    currency = 'NZD' OR 
    currency = 'NIO' OR 
    currency = 'NGN' OR 
    currency = 'KPW' OR 
    currency = 'NOK' OR 
    currency = 'OMR' OR 
    currency = 'PKR' OR 
    currency = 'PAB' OR 
    currency = 'PGK' OR 
    currency = 'PYG' OR 
    currency = 'PEN' OR 
    currency = 'PHP' OR 
    currency = 'PLN' OR 
    currency = 'PTE' OR 
    currency = 'QAR' OR 
    currency = 'RON' OR 
    currency = 'RUB' OR 
    currency = 'RWF' OR 
    currency = 'WST' OR 
    currency = 'STD' OR 
    currency = 'SAR' OR 
    currency = 'RSD' OR 
    currency = 'SCR' OR 
    currency = 'SLL' OR 
    currency = 'SGD' OR 
    currency = 'SKK' OR 
    currency = 'SIT' OR 
    currency = 'SBD' OR 
    currency = 'SOS' OR 
    currency = 'ZAR' OR 
    currency = 'KRW' OR 
    currency = 'ESP' OR 
    currency = 'LKR' OR 
    currency = 'SHP' OR 
    currency = 'SDG' OR 
    currency = 'SRD' OR 
    currency = 'SZL' OR 
    currency = 'SEK' OR 
    currency = 'CHF' OR 
    currency = 'SYP' OR 
    currency = 'TWD' OR 
    currency = 'TZS' OR 
    currency = 'THB' OR 
    currency = 'TOP' OR 
    currency = 'TTD' OR 
    currency = 'TND' OR 
    currency = 'TRY' OR 
    currency = 'TMM' OR 
    currency = 'USD' OR 
    currency = 'UGX' OR 
    currency = 'UAH' OR 
    currency = 'UYU' OR 
    currency = 'AED' OR 
    currency = 'VUV' OR 
    currency = 'VEB' OR 
    currency = 'VND' OR 
    currency = 'YER' OR 
    currency = 'ZMK' OR 
    currency = 'ZWD'
);
ALTER TABLE leasing ADD CONSTRAINT list_int_type_leasing CHECK (int_type = 'FIX' OR int_type = 'VAR');
ALTER TABLE leasing ADD CONSTRAINT list_lease_type CHECK (
    lease_type = 'Hipotecario' OR 
    lease_type = 'Automotriz' OR 
    lease_type = 'Maquinaria-Equipo'
);

CREATE TABLE simple_payments (
    uid_simple_payment UUID NOT NULL PRIMARY KEY,
    id_simple_loan BIGINT REFERENCES simple_loan(id_simple_loan) NOT NULL,
    payment_date DATE NOT NULL,
    capital_amortization NUMERIC(20,2) NOT NULL,
    interest_payment NUMERIC(20,2) NOT NULL
);
ALTER TABLE simple_payments ADD CONSTRAINT unique_id_simple_payment UNIQUE (uid_simple_payment);

CREATE TABLE revolver_dispositions (
    uid_revolver_disposition UUID NOT NULL PRIMARY KEY,
    id_revolver BIGINT REFERENCES revolver_credit(id_revolver) NOT NULL,
    disposition_date DATE NOT NULL,
    payment_date DATE NOT NULL,
    disposition_amount NUMERIC(20,2) NOT NULL
);
ALTER TABLE revolver_dispositions ADD CONSTRAINT unique_id_revolver_disposition UNIQUE (uid_revolver_disposition);

CREATE TABLE leasing_payments (
    uid_leasing_payment UUID NOT NULL PRIMARY KEY,
    id_leasing BIGINT REFERENCES leasing(id_leasing) NOT NULL,
    payment_date DATE NOT NULL,
    capital_amortization NUMERIC(20,2) NOT NULL,
    interest_payment NUMERIC(20,2) NOT NULL
);
ALTER TABLE leasing_payments ADD CONSTRAINT unique_id_leasing_payments UNIQUE (uid_leasing_payment);
