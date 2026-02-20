SELECT issue_type, COUNT(*) AS total_tickets
FROM tickets
GROUP BY issue_type
ORDER BY total_tickets DESC;

