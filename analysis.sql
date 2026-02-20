SELECT issue_type, COUNT(*) AS total_tickets
FROM tickets
GROUP BY issue_type
ORDER BY total_tickets DESC;

SELECT 
    issue_type,
    AVG(TIMESTAMPDIFF(HOUR, created_at, resolved_at)) AS avg_resolution_hours
FROM tickets
WHERE status = 'Resolved'
GROUP BY issue_type;


SELECT 
    website_id,
    COUNT(*) AS ticket_volume
FROM tickets
GROUP BY website_id
HAVING COUNT(*) >= 2;

SELECT 
    d.website_id,
    COUNT(t.ticket_id) AS incidents_after_change
FROM dns_changes d
JOIN tickets t 
ON d.website_id = t.website_id
AND t.created_at BETWEEN d.changed_at 
AND d.changed_at + INTERVAL 24 HOUR
GROUP BY d.website_id;


SELECT 
    ticket_id,
    website_id,
    TIMESTAMPDIFF(HOUR, created_at, resolved_at) AS resolution_time
FROM tickets
WHERE priority = 'High'
AND status = 'Resolved'
AND TIMESTAMPDIFF(HOUR, created_at, resolved_at) > 24;



SELECT 
    c.customer_name,
    t.ticket_id,
    COUNT(*) OVER (PARTITION BY c.customer_id) AS total_customer_tickets
FROM customers c
JOIN websites w ON c.customer_id = w.customer_id
JOIN tickets t ON w.website_id = t.website_id;



WITH customer_stats AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(t.ticket_id) AS total_tickets,
        AVG(TIMESTAMPDIFF(HOUR, t.created_at, t.resolved_at)) AS avg_resolution
    FROM customers c
    JOIN websites w ON c.customer_id = w.customer_id
    JOIN tickets t ON w.website_id = t.website_id
    WHERE t.status = 'Resolved'
    GROUP BY c.customer_id, c.customer_name
)

SELECT *
FROM customer_stats
WHERE total_tickets >= 2
AND avg_resolution > 20;






