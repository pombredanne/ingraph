MATCH (a)-[r1]->()-[r2]->(b)
WITH [r1, r2] AS rs, a AS first, b AS second
LIMIT 1
MATCH (first)-[rs*]->(second)
RETURN first, second