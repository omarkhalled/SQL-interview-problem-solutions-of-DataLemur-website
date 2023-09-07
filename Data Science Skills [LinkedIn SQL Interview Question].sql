SELECT candidate_id


FROM candidates
WHERE skill = 'Python' or skill = 'PostgreSQL' or skill = 'Tableau'
group by candidate_id
having COUNT(skill) >= 3
