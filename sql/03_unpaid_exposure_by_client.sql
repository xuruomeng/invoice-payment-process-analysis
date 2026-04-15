-- 1. Unpaid invoice amount by client

SELECT
    client,
    SUM(CASE WHEN payment_status <> 'Paid' THEN invoice_amount ELSE 0 END) AS unpaid_amount
FROM invoices
GROUP BY client
ORDER BY unpaid_amount DESC;


-- 2. Pending amount by client

SELECT
    client,
    SUM(CASE WHEN payment_status = 'Pending' THEN invoice_amount ELSE 0 END) AS pending_amount
FROM invoices
GROUP BY client
ORDER BY pending_amount DESC;


-- 3. Overdue amount by client

SELECT
    client,
    SUM(CASE WHEN payment_status = 'Overdue' THEN invoice_amount ELSE 0 END) AS overdue_amount
FROM invoices
GROUP BY client
ORDER BY overdue_amount DESC;


-- 4. Unpaid invoice count by client

SELECT
    client,
    COUNT(CASE WHEN payment_status <> 'Paid' THEN 1 END) AS unpaid_invoice_count
FROM invoices
GROUP BY client
ORDER BY unpaid_invoice_count DESC;
