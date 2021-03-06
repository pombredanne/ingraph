package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class ReturnAcceptanceVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: Allow addition
    Given an empty graph
    And having executed:
      """
      CREATE ({id: 1337, version: 99})
      """
    */
    @Test
    def void testReturnAcceptance_01() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WHERE a.id = 1337
        RETURN a.version + 5
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_01")
    }

    /*
    Scenario: Limit to two hits
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'}),
        ({name: 'D'}),
        ({name: 'E'})
      """
    */
    @Test
    def void testReturnAcceptance_02() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n
        LIMIT 2
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_02")
    }

    /*
    Scenario: Start the result from the second row
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'}),
        ({name: 'D'}),
        ({name: 'E'})
      """
    */
    @Test
    def void testReturnAcceptance_03() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n
        ORDER BY n.name ASC
        SKIP 2
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_03")
    }

    /*
    Scenario: Start the result from the second row by param
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'}),
        ({name: 'D'}),
        ({name: 'E'})
      """
    And parameters are:
      | skipAmount | 2 |
    */
    @Test
    def void testReturnAcceptance_04() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n
        ORDER BY n.name ASC
        SKIP $skipAmount
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_04")
    }

    /*
    Scenario: Get rows in the middle
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'}),
        ({name: 'D'}),
        ({name: 'E'})
      """
    */
    @Test
    def void testReturnAcceptance_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n
        ORDER BY n.name ASC
        SKIP 2
        LIMIT 2
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_05")
    }

    /*
    Scenario: Get rows in the middle by param
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'}),
        ({name: 'D'}),
        ({name: 'E'})
      """
    And parameters are:
      | s | 2 |
      | l | 2 |
    */
    @Test
    def void testReturnAcceptance_06() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n
        ORDER BY n.name ASC
        SKIP $s
        LIMIT $l
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_06")
    }

    /*
    Scenario: Sort on aggregated function
    Given an empty graph
    And having executed:
      """
      CREATE ({division: 'A', age: 22}),
        ({division: 'B', age: 33}),
        ({division: 'B', age: 44}),
        ({division: 'C', age: 55})
      """
    */
    @Test
    def void testReturnAcceptance_07() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        RETURN n.division, max(n.age)
        ORDER BY max(n.age)
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_07")
    }

    /*
    Scenario: Support sort and distinct
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
        ({name: 'B'}),
        ({name: 'C'})
      """
    */
    @Test
    def void testReturnAcceptance_08() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN DISTINCT a
        ORDER BY a.name
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_08")
    }

    /*
    Scenario: Support column renaming
    Given an empty graph
    And having executed:
      """
      CREATE (:Singleton)
      """
    */
    @Test
    def void testReturnAcceptance_09() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN a AS ColumnName
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_09")
    }

    /*
    Scenario: Support ordering by a property after being distinct-ified
    Given an empty graph
    And having executed:
      """
      CREATE (:A)-[:T]->(:B)
      """
    */
    @Test
    def void testReturnAcceptance_10() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)-->(b)
        RETURN DISTINCT b
        ORDER BY b.name
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_10")
    }

    /*
    Scenario: Arithmetic precedence test
    Given any graph
    */
    @Test
    def void testReturnAcceptance_11() {
        val container = Cypher2Relalg.processString('''
        RETURN 12 / 4 * 3 - 2 * 4
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_11")
    }

    /*
    Scenario: Arithmetic precedence with parenthesis test
    Given any graph
    */
    @Test
    def void testReturnAcceptance_12() {
        val container = Cypher2Relalg.processString('''
        RETURN 12 / 4 * (3 - 2 * 4)
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_12")
    }

    /*
    Scenario: Count star should count everything in scope
    Given an empty graph
    And having executed:
      """
      CREATE (:L1), (:L2), (:L3)
      """
    */
    @Test
    def void testReturnAcceptance_13() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        RETURN a, count(*)
        ORDER BY count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_13")
    }

    /*
    Scenario: Absolute function
    Given any graph
    */
    @Test
    def void testReturnAcceptance_14() {
        val container = Cypher2Relalg.processString('''
        RETURN abs(-1)
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_14")
    }

    /*
    Scenario: Return collection size
    Given any graph
    */
    @Test
    def void testReturnAcceptance_15() {
        val container = Cypher2Relalg.processString('''
        RETURN size([1, 2, 3]) AS n
        ''')
        container.inferBasicSchema
        container.convert("tck/ReturnAcceptance_15")
    }

}
