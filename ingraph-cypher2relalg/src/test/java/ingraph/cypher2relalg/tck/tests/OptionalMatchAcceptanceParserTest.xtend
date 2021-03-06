package ingraph.cypher2relalg.tck.tests

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.cypher2relalg.tck.FailingTests
import ingraph.cypher2relalg.tck.RegressionTests
import ingraph.cypherparser.CypherParser
import ingraph.cypherparser.CypherUtil
import ingraph.relalg.util.RelalgUtil
import org.junit.Test
import org.junit.experimental.categories.Category

class OptionalMatchAcceptanceParserTest {
    
    /*
    Scenario: Return null when no matches due to inline label predicate
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_01() {
        val cypher = CypherParser.parseString('''
        MATCH (n:Single)
        OPTIONAL MATCH (n)-[r]-(m:NonExistent)
        RETURN r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_01")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_01")
    }

    /*
    Scenario: Return null when no matches due to label predicate in WHERE
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_02() {
        val cypher = CypherParser.parseString('''
        MATCH (n:Single)
        OPTIONAL MATCH (n)-[r]-(m)
        WHERE m:NonExistent
        RETURN r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_02")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_02")
    }

    /*
    Scenario: Respect predicates on the OPTIONAL MATCH
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_03() {
        val cypher = CypherParser.parseString('''
        MATCH (n:Single)
        OPTIONAL MATCH (n)-[r]-(m)
        WHERE m.prop = 42
        RETURN m
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_03")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_03")
    }

    /*
    Scenario: Returning label predicate on null node
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_04() {
        val cypher = CypherParser.parseString('''
        MATCH (n:Single)
        OPTIONAL MATCH (n)-[r:TYPE]-(m)
        RETURN m:TYPE
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_04")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_04")
    }

    /*
    Scenario: MATCH after OPTIONAL MATCH
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_05() {
        val cypher = CypherParser.parseString('''
        MATCH (a:Single)
        OPTIONAL MATCH (a)-->(b:NonExistent)
        OPTIONAL MATCH (a)-->(c:NonExistent)
        WITH coalesce(b, c) AS x
        MATCH (x)-->(d)
        RETURN d
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_05")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_05")
    }

    /*
    Scenario: WITH after OPTIONAL MATCH
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_06() {
        val cypher = CypherParser.parseString('''
        OPTIONAL MATCH (a:A)
        WITH a AS a
        MATCH (b:B)
        RETURN a, b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_06")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_06")
    }

    /*
    Scenario: Named paths in optional matches
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_07() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A)
        OPTIONAL MATCH p = (a)-[:X]->(b)
        RETURN p
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_07")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_07")
    }

    /*
    Scenario: OPTIONAL MATCH and bound nodes
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_08() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:C)
        OPTIONAL MATCH (x)-->(b)
        RETURN x
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_08")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_08")
    }

    /*
    Scenario: OPTIONAL MATCH with labels on the optional end node
    And having executed:
      """
      CREATE (:X), (x:X), (y1:Y), (y2:Y:Z)
      CREATE (x)-[:REL]->(y1),
             (x)-[:REL]->(y2)
      """
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_09() {
        val cypher = CypherParser.parseString('''
        MATCH (a:X)
        OPTIONAL MATCH (a)-->(b:Y)
        RETURN b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_09")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_09")
    }

    /*
    Scenario: Named paths inside optional matches with node predicates
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_10() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:B)
        OPTIONAL MATCH p = (a)-[:X]->(b)
        RETURN p
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_10")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_10")
    }

    /*
    Scenario: Variable length optional relationships
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_11() {
        val cypher = CypherParser.parseString('''
        MATCH (a:Single)
        OPTIONAL MATCH (a)-[*]->(b)
        RETURN b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_11")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_11")
    }

    /*
    Scenario: Variable length optional relationships with length predicates
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_12() {
        val cypher = CypherParser.parseString('''
        MATCH (a:Single)
        OPTIONAL MATCH (a)-[*3..]-(b)
        RETURN b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_12")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_12")
    }

    /*
    Scenario: Optionally matching self-loops
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_13() {
        val cypher = CypherParser.parseString('''
        MATCH (a:B)
        OPTIONAL MATCH (a)-[r]-(a)
        RETURN r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_13")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_13")
    }

    /*
    Scenario: Optionally matching self-loops without matches
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_14() {
        val cypher = CypherParser.parseString('''
        MATCH (a)
        WHERE NOT (a:B)
        OPTIONAL MATCH (a)-[r]->(a)
        RETURN r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_14")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_14")
    }

    /*
    Scenario: Variable length optional relationships with bound nodes
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_15() {
        val cypher = CypherParser.parseString('''
        MATCH (a:Single), (x:C)
        OPTIONAL MATCH (a)-[*]->(x)
        RETURN x
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_15")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_15")
    }

    /*
    Scenario: Variable length optional relationships with bound nodes, no matches
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_16() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:B)
        OPTIONAL MATCH p = (a)-[*]->(b)
        RETURN p
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_16")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_16")
    }

    /*
    Scenario: Longer pattern with bound nodes
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_17() {
        val cypher = CypherParser.parseString('''
        MATCH (a:Single), (c:C)
        OPTIONAL MATCH (a)-->(b)-->(c)
        RETURN b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_17")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_17")
    }

    /*
    Scenario: Longer pattern with bound nodes without matches
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_18() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (c:C)
        OPTIONAL MATCH (a)-->(b)-->(c)
        RETURN b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_18")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_18")
    }

    /*
    Scenario: Handling correlated optional matches; first does not match implies second does not match
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_19() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:B)
        OPTIONAL MATCH (a)-->(x)
        OPTIONAL MATCH (x)-[r]->(b)
        RETURN x, r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_19")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_19")
    }

    /*
    Scenario: Handling optional matches between optionally matched entities
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_20() {
        val cypher = CypherParser.parseString('''
        OPTIONAL MATCH (a:NotThere)
        WITH a
        MATCH (b:B)
        WITH a, b
        OPTIONAL MATCH (b)-[r:NOR_THIS]->(a)
        RETURN a, b, r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_20")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_20")
    }

    /*
    Scenario: Handling optional matches between nulls
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_21() {
        val cypher = CypherParser.parseString('''
        OPTIONAL MATCH (a:NotThere)
        OPTIONAL MATCH (b:NotThere)
        WITH a, b
        OPTIONAL MATCH (b)-[r:NOR_THIS]->(a)
        RETURN a, b, r
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_21")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_21")
    }

    /*
    Scenario: OPTIONAL MATCH and `collect()`
    And having executed:
      """
      CREATE (:DoesExist {property: 42})
      CREATE (:DoesExist {property: 43})
      CREATE (:DoesExist {property: 44})
      """
    */
    @Test
    @Category(FailingTests)
    def void testOptionalMatchAcceptance_22() {
        val cypher = CypherParser.parseString('''
        OPTIONAL MATCH (f:DoesExist)
        OPTIONAL MATCH (n:DoesNotExist)
        RETURN collect(DISTINCT n.property) AS a, collect(DISTINCT f.property) AS b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/OptionalMatchAcceptance_22")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/OptionalMatchAcceptance_22")
    }

}
