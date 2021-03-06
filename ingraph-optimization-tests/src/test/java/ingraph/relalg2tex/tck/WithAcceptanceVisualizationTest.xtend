package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class WithAcceptanceVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: Passing on pattern nodes
    Given an empty graph
    And having executed:
      """
      CREATE (:A)-[:REL]->(:B)
      """
    */
    @Test
    def void testWithAcceptance_01() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:A)
        WITH a
        MATCH (a)-->(b)
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_01")
    }

    /*
    Scenario: ORDER BY and LIMIT can be used
    Given an empty graph
    And having executed:
      """
      CREATE (a:A), (), (), (),
             (a)-[:REL]->()
      """
    */
    @Test
    def void testWithAcceptance_02() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:A)
        WITH a
        ORDER BY a.name
        LIMIT 1
        MATCH (a)-->(b)
        RETURN a
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_02")
    }

    /*
    Scenario: No dependencies between the query parts
    Given an empty graph
    And having executed:
      """
      CREATE (:A), (:B)
      """
    */
    @Test
    def void testWithAcceptance_03() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH a
        MATCH (b)
        RETURN a, b
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_03")
    }

    /*
    Scenario: Aliasing
    Given an empty graph
    And having executed:
      """
      CREATE (:Begin {prop: 42}),
             (:End {prop: 42}),
             (:End {prop: 3})
      """
    */
    @Test
    def void testWithAcceptance_04() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:Begin)
        WITH a.prop AS property
        MATCH (b:End)
        WHERE property = b.prop
        RETURN b
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_04")
    }

    /*
    Scenario: Handle dependencies across WITH
    Given an empty graph
    And having executed:
      """
      CREATE (a:End {prop: 42, id: 0}),
             (:End {prop: 3}),
             (:Begin {prop: a.id})
      """
    */
    @Test
    def void testWithAcceptance_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:Begin)
        WITH a.prop AS property
        LIMIT 1
        MATCH (b)
        WHERE b.id = property
        RETURN b
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_05")
    }

    /*
    Scenario: Handle dependencies across WITH with SKIP
    Given an empty graph
    And having executed:
      """
      CREATE (a {prop: 'A', key: 0, id: 0}),
             ({prop: 'B', key: a.id, id: 1}),
             ({prop: 'C', key: 0, id: 2})
      """
    */
    @Test
    def void testWithAcceptance_06() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH a.prop AS property, a.key AS idToUse
        ORDER BY property
        SKIP 1
        MATCH (b)
        WHERE b.id = idToUse
        RETURN DISTINCT b
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_06")
    }

    /*
    Scenario: WHERE after WITH should filter results
    Given an empty graph
    And having executed:
      """
      CREATE ({name: 'A'}),
             ({name: 'B'}),
             ({name: 'C'})
      """
    */
    @Test
    def void testWithAcceptance_07() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH a
        WHERE a.name = 'B'
        RETURN a
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_07")
    }

    /*
    Scenario: WHERE after WITH can filter on top of an aggregation
    Given an empty graph
    And having executed:
      """
      CREATE (a {name: 'A'}),
             (b {name: 'B'})
      CREATE (a)-[:REL]->(),
             (a)-[:REL]->(),
             (a)-[:REL]->(),
             (b)-[:REL]->()
      """
    */
    @Test
    def void testWithAcceptance_08() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)-->()
        WITH a, count(*) AS relCount
        WHERE relCount > 1
        RETURN a
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_08")
    }

    /*
    Scenario: ORDER BY on an aggregating key
    Given an empty graph
    And having executed:
      """
      CREATE ({bar: 'A'}),
             ({bar: 'A'}),
             ({bar: 'B'})
      """
    */
    @Test
    def void testWithAcceptance_09() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH a.bar AS bars, count(*) AS relCount
        ORDER BY a.bar
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_09")
    }

    /*
    Scenario: ORDER BY a DISTINCT column
    Given an empty graph
    And having executed:
      """
      CREATE ({bar: 'A'}),
             ({bar: 'A'}),
             ({bar: 'B'})
      """
    */
    @Test
    def void testWithAcceptance_10() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH DISTINCT a.bar AS bars
        ORDER BY a.bar
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_10")
    }

    /*
    Scenario: WHERE on a DISTINCT column
    Given an empty graph
    And having executed:
      """
      CREATE ({bar: 'A'}),
             ({bar: 'A'}),
             ({bar: 'B'})
      """
    */
    @Test
    def void testWithAcceptance_11() {
        val container = Cypher2Relalg.processString('''
        MATCH (a)
        WITH DISTINCT a.bar AS bars
        WHERE a.bar = 'B'
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_11")
    }

    /*
    Scenario: A simple pattern with one bound endpoint
    Given an empty graph
    And having executed:
      """
      CREATE (:A)-[:REL]->(:B)
      """
    */
    @Test
    def void testWithAcceptance_12() {
        val container = Cypher2Relalg.processString('''
        MATCH (a:A)-[r:REL]->(b:B)
        WITH a AS b, b AS tmp, r AS r
        WITH b AS a, r
        LIMIT 1
        MATCH (a)-[r]->(b)
        RETURN a, r, b
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_12")
    }

    /*
    Scenario: Null handling
    Given an empty graph
    */
    @Test
    def void testWithAcceptance_13() {
        val container = Cypher2Relalg.processString('''
        OPTIONAL MATCH (a:Start)
        WITH a
        MATCH (a)-->(b)
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_13")
    }

    /*
    Scenario: Nested maps
    Given an empty graph
    */
    @Test
    def void testWithAcceptance_14() {
        val container = Cypher2Relalg.processString('''
        WITH {foo: {bar: 'baz'}} AS nestedMap
        RETURN nestedMap.foo.bar
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_14")
    }

    /*
    Scenario: Connected components succeeding WITH
    Given an empty graph
    And having executed:
      """
      CREATE (:A)-[:REL]->(:X)
      CREATE (:B)
      """
    */
    @Test
    def void testWithAcceptance_15() {
        val container = Cypher2Relalg.processString('''
        MATCH (n:A)
        WITH n
        LIMIT 1
        MATCH (m:B), (n)-->(x:X)
        RETURN *
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_15")
    }

    /*
    Scenario: Single WITH using a predicate and aggregation
    Given an empty graph
    And having executed:
      """
      CREATE ({prop: 43}), ({prop: 42})
      """
    */
    @Test
    def void testWithAcceptance_16() {
        val container = Cypher2Relalg.processString('''
        MATCH (n)
        WITH n
        WHERE n.prop = 42
        RETURN count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_16")
    }

    /*
    Scenario: Multiple WITHs using a predicate and aggregation
    Given an empty graph
    And having executed:
      """
      CREATE (a {name: 'David'}),
             (b {name: 'Other'}),
             (c {name: 'NotOther'}),
             (d {name: 'NotOther2'}),
             (a)-[:REL]->(b),
             (a)-[:REL]->(c),
             (a)-[:REL]->(d),
             (b)-[:REL]->(),
             (b)-[:REL]->(),
             (c)-[:REL]->(),
             (c)-[:REL]->(),
             (d)-[:REL]->()
      """
    */
    @Test
    def void testWithAcceptance_17() {
        val container = Cypher2Relalg.processString('''
        MATCH (david {name: 'David'})--(otherPerson)-->()
        WITH otherPerson, count(*) AS foaf
        WHERE foaf > 1
        WITH otherPerson
        WHERE otherPerson.name <> 'NotOther'
        RETURN count(*)
        ''')
        container.inferBasicSchema
        container.convert("tck/WithAcceptance_17")
    }

}
