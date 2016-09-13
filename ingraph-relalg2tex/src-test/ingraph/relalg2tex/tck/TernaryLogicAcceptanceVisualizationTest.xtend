package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.RelalgParser
import ingraph.relalg2tex.AlgebraTreeDrawer

class TernaryLogicAcceptanceVisualizationTest {

    val static AlgebraTreeDrawer drawer = new AlgebraTreeDrawer(true)
    
    /*
    Scenario: The inverse of a null is a null
    */
    @Test
    def void testTernaryLogicAcceptance_01() {
        val container = RelalgParser.parse('''
        RETURN NOT null AS value
        ''')
        drawer.serialize(container, "TernaryLogicAcceptance")
    }

    /*
    Scenario: A literal null IS null
    */
    @Test
    def void testTernaryLogicAcceptance_02() {
        val container = RelalgParser.parse('''
        RETURN null IS NULL AS value
        ''')
        drawer.serialize(container, "TernaryLogicAcceptance")
    }

    /*
    Scenario: A literal null is not IS NOT null
    */
    @Test
    def void testTernaryLogicAcceptance_03() {
        val container = RelalgParser.parse('''
        RETURN null IS NOT NULL AS value
        ''')
        drawer.serialize(container, "TernaryLogicAcceptance")
    }

    /*
    Scenario: It is unknown - i.e. null - if a null is equal to a null
    */
    @Test
    def void testTernaryLogicAcceptance_04() {
        val container = RelalgParser.parse('''
        RETURN null = null AS value
        ''')
        drawer.serialize(container, "TernaryLogicAcceptance")
    }

    /*
    Scenario: It is unknown - i.e. null - if a null is not equal to a null
    */
    @Test
    def void testTernaryLogicAcceptance_05() {
        val container = RelalgParser.parse('''
        RETURN null <> null AS value
        ''')
        drawer.serialize(container, "TernaryLogicAcceptance")
    }

}