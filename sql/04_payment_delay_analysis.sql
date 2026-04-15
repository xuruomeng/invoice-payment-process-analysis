-- 1. Join invoices and payments

SELECT
    i.invoice_id,
    i.client,
    i.invoice_date,
    i.due_date,
    i.invoice_amount,
    i.payment_status,
    p.payment_date,
    p.amount_paid,
    p.payment_method
FROM invoices i
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
ORDER BY i.client, i.invoice_date;


-- 2. Paid invoices with payment dates

SELECT
    i.invoice_id,
    i.client,
    i.invoice_date,
    i.due_date,
    p.payment_date,
    i.invoice_amount,
    p.amount_paid
FROM invoices i
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
WHERE i.payment_status = 'Paid'
ORDER BY p.payment_date;


-- 3. Paid invoices and estimated payment delay in days
-- Note: date difference syntax may vary depending on SQL environment

SELECT
    i.invoice_id,
    i.client,
    i.due_date,
    p.payment_date,
    julianday(p.payment_date) - julianday(i.due_date) AS payment_delay_days
FROM invoices i
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
WHERE i.payment_status = 'Paid'
ORDER BY payment_delay_days DESC;


-- 4. Average payment delay by client

SELECT
    i.client,
    ROUND(AVG(julianday(p.payment_date) - julianday(i.due_date)), 2) AS avg_payment_delay_days
FROM invoices i
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
WHERE i.payment_status = 'Paid'
GROUP BY i.client
ORDER BY avg_payment_delay_days DESC;
