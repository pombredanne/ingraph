package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class UnwindAcceptanceVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: Unwinding a list
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_01() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1, 2, 3] AS x
        RETURN x
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_01")
    }

    /*
    Scenario: Unwinding a range
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_02() {
        val container = Cypher2Relalg.processString('''
        UNWIND range(1, 3) AS x
        RETURN x
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_02")
    }

    /*
    Scenario: Unwinding a concatenation of lists
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_03() {
        val container = Cypher2Relalg.processString('''
        WITH [1, 2, 3] AS first, [4, 5, 6] AS second
        UNWIND (first + second) AS x
        RETURN x
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_03")
    }

    /*
    Scenario: Unwinding a collected unwound expression
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_04() {
        val container = Cypher2Relalg.processString('''
        UNWIND RANGE(1, 2) AS row
        WITH collect(row) AS rows
        UNWIND rows AS x
        RETURN x
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_04")
    }

    /*
    Scenario: Unwinding a collected expression
    Given an empty graph
    And having executed:
      """
      CREATE ({id: 1}), ({id: 2})
      """
    */
    @Test
    def void testUnwindAcceptance_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (row)
        WITH collect(row) AS rows
        UNWIND rows AS node
        RETURN node.id
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_05")
    }

    /*
    Scenario: Double unwinding a list of lists
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_07() {
        val container = Cypher2Relalg.processString('''
        WITH [[1, 2, 3], [4, 5, 6]] AS lol
        UNWIND lol AS x
        UNWIND x AS y
        RETURN y
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_07")
    }

    /*
    Scenario: Unwinding the empty list
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_08() {
        val container = Cypher2Relalg.processString('''
        UNWIND [] AS empty
        RETURN empty
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_08")
    }

    /*
    Scenario: Unwinding null
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_09() {
        val container = Cypher2Relalg.processString('''
        UNWIND null AS nil
        RETURN nil
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_09")
    }

    /*
    Scenario: Unwinding list with duplicates
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_10() {
        val container = Cypher2Relalg.processString('''
        UNWIND [1, 1, 2, 2, 3, 3, 4, 4, 5, 5] AS duplicate
        RETURN duplicate
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_10")
    }

    /*
    Scenario: Unwind does not prune context
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_11() {
        val container = Cypher2Relalg.processString('''
        WITH [1, 2, 3] AS list
        UNWIND list AS x
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_11")
    }

    /*
    Scenario: Unwind does not remove variables from scope
    Given an empty graph
    And having executed:
      """
      CREATE (s:S),
        (n),
        (e:E),
        (s)-[:X]->(e),
        (s)-[:Y]->(e),
        (n)-[:Y]->(e)
      """
    */
    @Test
    def void testUnwindAcceptance_12() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:S)-[:X]->(b1)
        WITH a, collect(b1) AS bees
        UNWIND bees AS b2
        MATCH (a)-[:Y]->(b2)
        RETURN a, b2
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_12")
    }

    /*
    Scenario: Multiple unwinds after each other
    Given any graph
    */
    @Test
    def void testUnwindAcceptance_13() {
        val container = Cypher2Relalg.processString('''
        WITH [1, 2] AS xs, [3, 4] AS ys, [5, 6] AS zs
        UNWIND xs AS x
        UNWIND ys AS y
        UNWIND zs AS z
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/UnwindAcceptance_13")
    }

}
