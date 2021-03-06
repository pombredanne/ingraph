package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class AggregationAcceptanceVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: Support multiple divisions in aggregate function
    Given an empty graph
    And having executed:
      """
      UNWIND range(0, 7250) AS i
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_01() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN count(n) / 60 / 60 AS count
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_01")
    }

    /*
    Scenario: Support column renaming for aggregates as well
    Given an empty graph
    And having executed:
      """
      UNWIND range(0, 10) AS i
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_02() {
        val container = Cypher2Relalg.processString('''
        MATCH ()
        RETURN count(*) AS columnName
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_02")
    }

    /*
    Scenario: Aggregates inside normal functions
    Given an empty graph
    And having executed:
      """
      UNWIND range(0, 10) AS i
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_03() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN size(collect(a))
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_03")
    }

    /*
    Scenario: Handle aggregates inside non-aggregate expressions
    Given an empty graph
    */
    @Test
    def void testAggregationAcceptance_04() {
        val container = Cypher2Relalg.processString('''
        MATCH (a {name: 'Andres'})<-[:FATHER]-(child)
        RETURN {foo: a.name='Andres', kids: collect(child.name)}
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_04")
    }

    /*
    Scenario: Count nodes
    Given an empty graph
    And having executed:
      """
      CREATE (a:L), (b1), (b2)
      CREATE (a)-[:A]->(b1), (a)-[:A]->(b2)
      """
    */
    @Test
    def void testAggregationAcceptance_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:L)-[rel]->(b)
        RETURN a, count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_05")
    }

    /*
    Scenario: Sort on aggregate function and normal property
    Given an empty graph
    And having executed:
      """
      CREATE ({division: 'Sweden'})
      CREATE ({division: 'Germany'})
      CREATE ({division: 'England'})
      CREATE ({division: 'Sweden'})
      """
    */
    @Test
    def void testAggregationAcceptance_06() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.division, count(*)
        ORDER BY count(*) DESC, n.division ASC
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_06")
    }

    /*
    Scenario: Aggregate on property
    Given an empty graph
    And having executed:
      """
      CREATE ({x: 33})
      CREATE ({x: 33})
      CREATE ({x: 42})
      """
    */
    @Test
    def void testAggregationAcceptance_07() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.x, count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_07")
    }

    /*
    Scenario: Count non-null values
    Given an empty graph
    And having executed:
      """
      CREATE ({y: 'a', x: 33})
      CREATE ({y: 'a'})
      CREATE ({y: 'b', x: 42})
      """
    */
    @Test
    def void testAggregationAcceptance_08() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.y, count(n.x)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_08")
    }

    /*
    Scenario: Sum non-null values
    Given an empty graph
    And having executed:
      """
      CREATE ({y: 'a', x: 33})
      CREATE ({y: 'a'})
      CREATE ({y: 'a', x: 42})
      """
    */
    @Test
    def void testAggregationAcceptance_09() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.y, sum(n.x)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_09")
    }

    /*
    Scenario: Handle aggregation on functions
    Given an empty graph
    And having executed:
      """
      CREATE (a:L), (b1), (b2)
      CREATE (a)-[:A]->(b1), (a)-[:A]->(b2)
      """
    */
    @Test
    def void testAggregationAcceptance_10() {
        val container = Cypher2Relalg.processString('''
        MATCH p=(a:L)-[*]->(b)
        RETURN b, avg(length(p))
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_10")
    }

    /*
    Scenario: Distinct on unbound node
    Given an empty graph
    */
    @Test
    def void testAggregationAcceptance_11() {
        val container = Cypher2Relalg.processString('''
        OPTIONAL MATCH (a)
        RETURN count(DISTINCT a)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_11")
    }

    /*
    Scenario: Distinct on null
    Given an empty graph
    And having executed:
      """
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_12() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN count(DISTINCT a.foo)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_12")
    }

    /*
    Scenario: Collect distinct nulls
    Given any graph
    */
    @Test
    def void testAggregationAcceptance_13() {
        val container = Cypher2Relalg.processString('''
        UNWIND [null, null] AS x
        RETURN collect(DISTINCT x) AS c
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_13")
    }

    /*
    Scenario: Collect distinct values mixed with nulls
    Given any graph
    */
    @Test
    def void testAggregationAcceptance_14() {
        val container = Cypher2Relalg.processString('''
        UNWIND [null, 1, null] AS x
        RETURN collect(DISTINCT x) AS c
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_14")
    }

    /*
    Scenario: Aggregate on list values
    Given an empty graph
    And having executed:
      """
      CREATE ({color: ['red']})
      CREATE ({color: ['blue']})
      CREATE ({color: ['red']})
      """
    */
    @Test
    def void testAggregationAcceptance_15() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN DISTINCT a.color, count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_15")
    }

    /*
    Scenario: Aggregates with arithmetics
    Given an empty graph
    And having executed:
      """
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_16() {
        val container = Cypher2Relalg.processString('''
        MATCH ()
        RETURN count(*) * 10 AS c
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_16")
    }

    /*
    Scenario: Aggregates ordered by arithmetics
    Given an empty graph
    And having executed:
      """
      CREATE (:A), (:X), (:X)
      """
    */
    @Test
    def void testAggregationAcceptance_17() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:A), (b:X)
        RETURN count(a) * 10 + count(b) * 5 AS x
        ORDER BY x
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_17")
    }

    /*
    Scenario: Multiple aggregates on same variable
    Given an empty graph
    And having executed:
      """
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_18() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN count(n), collect(n)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_18")
    }

    /*
    Scenario: Simple counting of nodes
    Given an empty graph
    And having executed:
      """
      UNWIND range(1, 100) AS i
      CREATE ()
      """
    */
    @Test
    def void testAggregationAcceptance_19() {
        val container = Cypher2Relalg.processString('''
        MATCH ()
        RETURN count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_19")
    }

    /*
    Scenario: Aggregation of named paths
    Given an empty graph
    And having executed:
      """
      CREATE (a:A), (b:B), (c:C), (d:D), (e:E), (f:F)
      CREATE (a)-[:R]->(b)
      CREATE (c)-[:R]->(d)
      CREATE (d)-[:R]->(e)
      CREATE (e)-[:R]->(f)
      """
    */
    @Test
    def void testAggregationAcceptance_20() {
        val container = Cypher2Relalg.processString('''
        MATCH p = (a)-[*]->(b)
        RETURN collect(nodes(p)) AS paths, length(p) AS l
        ORDER BY l
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_20")
    }

    /*
    Scenario: Aggregation with `min()`
    Given an empty graph
    And having executed:
      """
      CREATE (a:T {name: 'a'}), (b:T {name: 'b'}), (c:T {name: 'c'})
      CREATE (a)-[:R]->(b)
      CREATE (a)-[:R]->(c)
      CREATE (c)-[:R]->(b)
      """
    */
    @Test
    def void testAggregationAcceptance_21() {
        val container = Cypher2Relalg.processString('''
        MATCH p = (a:T {name: 'a'})-[:R*]->(other:T)
        WHERE other <> a
        WITH a, other, min(length(p)) AS len
        RETURN a.name AS name, collect(other.name) AS others, len
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_21")
    }

    /*
    Scenario: Handle subexpression in aggregation also occurring as standalone expression with nested aggregation in a literal map
    Given an empty graph
    And having executed:
      """
      CREATE (:A), (:B {prop: 42})
      """
    */
    @Test
    def void testAggregationAcceptance_22() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:A), (b:B)
        RETURN coalesce(a.prop, b.prop) AS foo,
        b.prop AS bar,
        {y: count(b)} AS baz
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_22")
    }

    /*
    Scenario: No overflow during summation
    Given any graph
    */
    @Test
    def void testAggregationAcceptance_24() {
        val container = Cypher2Relalg.processString('''
        UNWIND range(1000000, 2000000) AS i
        WITH i
        LIMIT 3000
        RETURN sum(i)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_24")
    }

    /*
    Scenario: Counting with loops
    Given an empty graph
    And having executed:
      """
      CREATE (a), (a)-[:R]->(a)
      """
    */
    @Test
    def void testAggregationAcceptance_25() {
        val container = Cypher2Relalg.processString('''
        MATCH ()-[r]-()
        RETURN count(r)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_25")
    }

    /*
    Scenario: `max()` should aggregate strings
    Given any graph
    */
    @Test
    def void testAggregationAcceptance_26() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['a', 'b', 'B', null, 'abc', 'abc1'] AS i
        RETURN max(i)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_26")
    }

    /*
    Scenario: `min()` should aggregate strings
    Given any graph
    */
    @Test
    def void testAggregationAcceptance_27() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['a', 'b', 'B', null, 'abc', 'abc1'] AS i
        RETURN min(i)
        ''')
        container.inferBasicSchema
        container.convert("tck/AggregationAcceptance_27")
    }

}
