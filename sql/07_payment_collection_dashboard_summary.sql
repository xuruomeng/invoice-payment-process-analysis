-- Payment collection dashboard summary

SELECT
    i.invoice_id,
    i.client,
    i.project,
    i.project_code,
    i.invoice_date,
    i.due_date,
    i.invoice_amount,
    i.currency,
    i.payment_status,
    p.payment_date,
    p.amount_paid,
    p.payment_method,
    CASE
        WHEN i.payment_status = 'Paid' THEN 'Collected'
        WHEN i.payment_status = 'Pending' THEN 'Open'
        WHEN i.payment_status = 'Overdue' THEN 'Overdue'
        ELSE 'Unknown'
    END AS collection_status
FROM invoices i
LEFT JOIN payments p
    ON i.invoice_id = p.invoice_id
ORDER BY i.client, i.invoice_date;
