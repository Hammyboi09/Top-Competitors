SELECT 
    t.hacker_id, 
    t.name 
FROM 
    (
        SELECT 
            h.hacker_id AS hacker_id,
            h.name AS name,
            COUNT(s.challenge_id) AS total_challenges 
        FROM 
            hackers h
        JOIN 
            submissions s ON h.hacker_id = s.hacker_id
        JOIN 
            challenges c ON s.challenge_id = c.challenge_id
        JOIN 
            difficulty d ON d.difficulty_level = c.difficulty_level
        WHERE 
            s.score = d.score 
        GROUP BY 
            h.hacker_id, h.name
    ) AS t 
WHERE 
    t.total_challenges > 1 
ORDER BY 
    t.total_challenges DESC, 
    t.hacker_id;

