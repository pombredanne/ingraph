package ingraph.cypher2relalg.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2RelAlg
import ingraph.cypherparser.CypherParser
import ingraph.cypherparser.CypherUtil

class LargeIntegerEqualityParserTest {
    
    /*
    Scenario: Does not lose precision
    */
    @Test
    def void testLargeIntegerEquality_01() {
        val cypher = CypherParser.parseString('''
        MATCH (p:Label)
        RETURN p.id
        ''')
        CypherUtil.save(cypher, "../cypxmi/LargeIntegerEquality_01")
        Cypher2RelAlg.processCypher(cypher)
    }

    /*
    Scenario: Handling inlined equality of large integer
    */
    @Test
    def void testLargeIntegerEquality_02() {
        val cypher = CypherParser.parseString('''
        MATCH (p:Label {id: 4611686018427387905})
        RETURN p.id
        ''')
        CypherUtil.save(cypher, "../cypxmi/LargeIntegerEquality_02")
        Cypher2RelAlg.processCypher(cypher)
    }

    /*
    Scenario: Handling explicit equality of large integer
    */
    @Test
    def void testLargeIntegerEquality_03() {
        val cypher = CypherParser.parseString('''
        MATCH (p:Label)
        WHERE p.id = 4611686018427387905
        RETURN p.id
        ''')
        CypherUtil.save(cypher, "../cypxmi/LargeIntegerEquality_03")
        Cypher2RelAlg.processCypher(cypher)
    }

    /*
    Scenario: Handling inlined equality of large integer, non-equal values
    */
    @Test
    def void testLargeIntegerEquality_04() {
        val cypher = CypherParser.parseString('''
        MATCH (p:Label {id : 4611686018427387900})
        RETURN p.id
        ''')
        CypherUtil.save(cypher, "../cypxmi/LargeIntegerEquality_04")
        Cypher2RelAlg.processCypher(cypher)
    }

    /*
    Scenario: Handling explicit equality of large integer, non-equal values
    */
    @Test
    def void testLargeIntegerEquality_05() {
        val cypher = CypherParser.parseString('''
        MATCH (p:Label)
        WHERE p.id = 4611686018427387900
        RETURN p.id
        ''')
        CypherUtil.save(cypher, "../cypxmi/LargeIntegerEquality_05")
        Cypher2RelAlg.processCypher(cypher)
    }

}
