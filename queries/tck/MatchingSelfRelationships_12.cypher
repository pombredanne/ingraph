MATCH (n)-[r]-(n)
RETURN count(DISTINCT r)
