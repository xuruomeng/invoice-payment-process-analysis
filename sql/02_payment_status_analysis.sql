-- 1. Count invoices by payment status

SELECT
    payment_status,
    COUNT(invoice_id) AS invoice_count
FROM invoices
GROUP BY payment_status
ORDER BY invoice_count DESC;


-- 2. Total invoice amount by payment status

SELECT
    payment_status,
    SUM(invoice_amount) AS total_invoice_amount
FROM invoices
GROUP BY payment_status
ORDER BY total_invoice_amount DESC;


-- 3. Payment status by client

SELECT
    client,
    payment_status,
    COUNT(invoice_id) AS invoice_count,
    SUM(invoice_amount) AS total_invoice_amount
FROM invoices
GROUP BY client, payment_status
ORDER BY client, total_invoice_amount DESC;


-- 4. List all unpaid invoices

SELECT
    invoice_id,
    client,
    project,
    invoice_date,
    due_date,
    invoice_amount,
    payment_status
FROM invoices
WHERE payment_status <> 'Paid'
ORDER BY due_date;
