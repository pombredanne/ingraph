MATCH (a1)-[r:T]->()
WITH r, a1
LIMIT 1
MATCH (a1)-[r:Y]->(b2)
RETURN a1, r, b2