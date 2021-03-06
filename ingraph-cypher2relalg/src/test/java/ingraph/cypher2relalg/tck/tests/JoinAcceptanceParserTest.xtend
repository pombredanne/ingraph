package ingraph.cypher2relalg.tck.tests

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.cypher2relalg.tck.FailingTests
import ingraph.cypher2relalg.tck.RegressionTests
import ingraph.cypherparser.CypherParser
import ingraph.cypherparser.CypherUtil
import ingraph.relalg.util.RelalgUtil
import org.junit.Test
import org.junit.experimental.categories.Category

class JoinAcceptanceParserTest {
    
    /*
    Scenario: Find friends of others
    Given an empty graph
    And having executed:
      """
      CREATE (:A {id: 1}),
             (:A {id: 2}),
             (:B {id: 2}),
             (:B {id: 3})
      """
    */
    @Test
    @Category(FailingTests)
    def void testJoinAcceptance_01() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:B)
        WHERE a.id = b.id
        RETURN a, b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/JoinAcceptance_01")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/JoinAcceptance_01")
    }

    /*
    Scenario: Should only join when matching
    Given an empty graph
    And having executed:
      """
      UNWIND range(0, 1000) AS i
      CREATE (:A {id: i})
      MERGE (:B {id: i % 10})
      """
    */
    @Test
    @Category(FailingTests)
    def void testJoinAcceptance_02() {
        val cypher = CypherParser.parseString('''
        MATCH (a:A), (b:B)
        WHERE a.id = b.id
        RETURN a, b
        ''')
        CypherUtil.save(cypher, "cypher-asts/tck/JoinAcceptance_02")
        val container = Cypher2Relalg.processCypher(cypher)
        RelalgUtil.save(container, "relalg-models/tck/JoinAcceptance_02")
    }

}
