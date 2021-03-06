package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class OrderByAcceptanceVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: ORDER BY should return results in ascending order
    And having executed:
      """
      CREATE (n1 {prop: 1}),
        (n2 {prop: 3}),
        (n3 {prop: -5})
      """
    */
    @Test
    def void testOrderByAcceptance_01() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.prop AS prop
        ORDER BY n.prop
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_01")
    }

    /*
    Scenario: ORDER BY DESC should return results in descending order
    And having executed:
      """
      CREATE (n1 {prop: 1}),
        (n2 {prop: 3}),
        (n3 {prop: -5})
      """
    */
    @Test
    def void testOrderByAcceptance_02() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.prop AS prop
        ORDER BY n.prop DESC
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_02")
    }

    /*
    Scenario: ORDER BY of a column introduced in RETURN should return salient results in ascending order
    */
    @Test
    def void testOrderByAcceptance_03() {
        val container = Cypher2Relalg.processString('''
        WITH [0, 1] AS prows, [[2], [3, 4]] AS qrows
        UNWIND prows AS p
        UNWIND qrows[p] AS q
        WITH p, count(q) AS rng
        RETURN p
        ORDER BY rng
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_03")
    }

    /*
    Scenario: Renaming columns before ORDER BY should return results in ascending order
    And having executed:
      """
      CREATE (n1 {prop: 1}),
        (n2 {prop: 3}),
        (n3 {prop: -5})
      """
    */
    @Test
    def void testOrderByAcceptance_04() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.prop AS n
        ORDER BY n + 2
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_04")
    }

    /*
    Scenario: Handle projections with ORDER BY - GH#4937
    And having executed:
      """
      CREATE (c1:Crew {name: 'Neo', rank: 1}),
        (c2:Crew {name: 'Neo', rank: 2}),
        (c3:Crew {name: 'Neo', rank: 3}),
        (c4:Crew {name: 'Neo', rank: 4}),
        (c5:Crew {name: 'Neo', rank: 5})
      """
    */
    @Test
    def void testOrderByAcceptance_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (c:Crew {name: 'Neo'})
        WITH c, 0 AS relevance
        RETURN c.rank AS rank
        ORDER BY relevance, c.rank
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_05")
    }

    /*
    Scenario: ORDER BY should order booleans in the expected order
    */
    @Test
    def void testOrderByAcceptance_06() {
        val container = Cypher2Relalg.processString('''
        UNWIND [true, false] AS bools
        RETURN bools
        ORDER BY bools
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_06")
    }

    /*
    Scenario: ORDER BY DESC should order booleans in the expected order
    */
    @Test
    def void testOrderByAcceptance_07() {
        val container = Cypher2Relalg.processString('''
        UNWIND [true, false] AS bools
        RETURN bools
        ORDER BY bools DESC
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_07")
    }

    /*
    Scenario: ORDER BY should order strings in the expected order
    */
    @Test
    def void testOrderByAcceptance_08() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['.*', '', ' ', 'one'] AS strings
        RETURN strings
        ORDER BY strings
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_08")
    }

    /*
    Scenario: ORDER BY DESC should order strings in the expected order
    */
    @Test
    def void testOrderByAcceptance_09() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['.*', '', ' ', 'one'] AS strings
        RETURN strings
        ORDER BY strings DESC
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_09")
    }

    /*
    Scenario: ORDER BY should order ints in the expected order
    */
    @Test
    def void testOrderByAcceptance_10() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1, 3, 2] AS ints
        RETURN ints
        ORDER BY ints
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_10")
    }

    /*
    Scenario: ORDER BY DESC should order ints in the expected order
    */
    @Test
    def void testOrderByAcceptance_11() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1, 3, 2] AS ints
        RETURN ints
        ORDER BY ints DESC
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_11")
    }

    /*
    Scenario: ORDER BY should order floats in the expected order
    */
    @Test
    def void testOrderByAcceptance_12() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1.5, 1.3, 999.99] AS floats
        RETURN floats
        ORDER BY floats
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_12")
    }

    /*
    Scenario: ORDER BY DESC should order floats in the expected order
    */
    @Test
    def void testOrderByAcceptance_13() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1.5, 1.3, 999.99] AS floats
        RETURN floats
        ORDER BY floats DESC
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_13")
    }

    /*
    Scenario: Handle ORDER BY with LIMIT 1
    And having executed:
      """
      CREATE (s:Person {name: 'Steven'}),
        (c:Person {name: 'Craig'})
      """
    */
    @Test
    def void testOrderByAcceptance_14() {
        val container = Cypher2Relalg.processString('''
        MATCH (p:Person)
        RETURN p.name AS name
        ORDER BY p.name
        LIMIT 1
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_14")
    }

    /*
    Scenario: ORDER BY with LIMIT 0 should not generate errors
    */
    @Test
    def void testOrderByAcceptance_15() {
        val container = Cypher2Relalg.processString('''
        MATCH (p:Person)
        RETURN p.name AS name
        ORDER BY p.name
        LIMIT 0
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_15")
    }

    /*
    Scenario: ORDER BY with negative parameter for LIMIT should not generate errors
    And parameters are:
      | limit | -1 |
    */
    @Test
    def void testOrderByAcceptance_16() {
        val container = Cypher2Relalg.processString('''
        MATCH (p:Person)
        RETURN p.name AS name
        ORDER BY p.name
        LIMIT $limit
        ''')
        container.inferBasicSchema
        container.convert("tck/OrderByAcceptance_16")
    }

}
