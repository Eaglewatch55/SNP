CREATE  TABLE  group (
    uid_group UUID NOT NULL PRIMARY KEY,
    group_name VARCHAR (50) NOT NULL,
    group_alias VARCHAR (6) NOT NULL,
    contact_mail VARCHAR (50) NOT NULL
);

ALTER TABLE group ADD CONSTRAINT unique_group UNIQUE (uid_group, group_name, group_alias);


CREATE TABLE company (
    uid_comp UUID NOT NULL PRIMARY KEY,
    uid_group UUID REFERENCES group(uid_group) NOT NULL,
    comp_name VARCHAR (50) NOT NULL,
    comp_alias VARCHAR (6) NOT NULL
);

ALTER TABLE company ADD CONSTRAINT unique_company UNIQUE (uid_comp, uid_group, comp_name, comp_alias);



CREATE TABLE simple_loan (
    uid_loan UUID NOT NULL PRIMARY KEY,
    uid_comp UUID REFERENCES company(uid_comp) NOT NULL,
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

ALTER TABLE simple_loan ADD CONSTRAINT unique_simple_keys UNIQUE (uid_loan, uid_comp);
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
ALTER TABLE simple_loan ADD CONSTRAINT list_int_type CHECK (int_type = 'FIX' OR int_type = 'VAR');
ALTER TABLE simple_loan ADD CONSTRAINT list_loan_type CHECK (loan_type = 'Hipotecario' OR loan_type = 'Automotriz' OR loan_type = 'Capital de trabajo');

