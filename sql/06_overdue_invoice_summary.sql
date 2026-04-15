-- Overdue invoice summary

SELECT
    invoice_id,
    client,
    project,
    invoice_date,
    due_date,
    invoice_amount,
    currency,
    payment_status
FROM invoices
WHERE payment_status = 'Overdue'
ORDER BY due_date;
