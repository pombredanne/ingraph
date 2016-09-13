package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.RelalgParser
import ingraph.relalg2tex.RelAlgTreeDrawer

class JoinAcceptanceVisualizationTest {

    val static RelAlgTreeDrawer drawer = new RelAlgTreeDrawer(true)
    
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
    def void testJoinAcceptance_01() {
        val container = RelalgParser.parse('''
        MATCH (a:A), (b:B)
        WHERE a.id = b.id
        RETURN a, b
        ''')
        drawer.serialize(container, "JoinAcceptance_01")
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
    def void testJoinAcceptance_02() {
        val container = RelalgParser.parse('''
        MATCH (a:A), (b:B)
        WHERE a.id = b.id
        RETURN a, b
        ''')
        drawer.serialize(container, "JoinAcceptance_02")
    }

}
