MATCH ()-[r1]->()-[r2]->()
WITH [r1, r2] AS rs
LIMIT 1
MATCH (first)-[rs*]->(second)
RETURN first, second