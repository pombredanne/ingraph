MATCH (a1)-[r]->()
WITH r, a1
LIMIT 1
OPTIONAL MATCH (a1)-[r]->(b2)
RETURN a1, r, b2
