MATCH (a), (b)
WHERE a.id = 0
AND (a)-[:T]->(b:Label)
OR (a)-[:T*]->(b:MissingLabel)
RETURN DISTINCT b