package ingraph.relalg2tex.tck

import org.junit.Test

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter

class TypeConversionFunctionsVisualizationTest {

    extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
    extension BasicSchemaInferencer inferencer = new BasicSchemaInferencer
    
    /*
    Scenario: `toBoolean()` on valid literal string
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_01() {
        val container = Cypher2Relalg.processString('''
        RETURN toBoolean('true') AS b
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_01")
    }

    /*
    Scenario: `toBoolean()` on booleans
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_02() {
        val container = Cypher2Relalg.processString('''
        UNWIND [true, false] AS b
        RETURN toBoolean(b) AS b
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_02")
    }

    /*
    Scenario: `toBoolean()` on variables with valid string values
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_03() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['true', 'false'] AS s
        RETURN toBoolean(s) AS b
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_03")
    }

    /*
    Scenario: `toBoolean()` on invalid strings
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_04() {
        val container = Cypher2Relalg.processString('''
        UNWIND [null, '', ' tru ', 'f alse'] AS things
        RETURN toBoolean(things) AS b
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_04")
    }

    /*
    Scenario: `toInteger()`
    Given an empty graph
    And having executed:
      """
      CREATE (:Person {age: '42'})
      """
    */
    @Test
    def void testTypeConversionFunctions_05() {
        val container = Cypher2Relalg.processString('''
        MATCH (p:Person { age: '42' })
        WITH *
        MATCH (n)
        RETURN toInteger(n.age) AS age
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_05")
    }

    /*
    Scenario: `toInteger()` on float
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_06() {
        val container = Cypher2Relalg.processString('''
        WITH 82.9 AS weight
        RETURN toInteger(weight)
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_06")
    }

    /*
    Scenario: `toInteger()` returning null on non-numerical string
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_07() {
        val container = Cypher2Relalg.processString('''
        WITH 'foo' AS foo_string, '' AS empty_string
        RETURN toInteger(foo_string) AS foo, toInteger(empty_string) AS empty
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_07")
    }

    /*
    Scenario: `toInteger()` handling mixed number types
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_08() {
        val container = Cypher2Relalg.processString('''
        WITH [2, 2.9] AS numbers
        RETURN [n IN numbers | toInteger(n)] AS int_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_08")
    }

    /*
    Scenario: `toInteger()` handling Any type
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_09() {
        val container = Cypher2Relalg.processString('''
        WITH [2, 2.9, '1.7'] AS things
        RETURN [n IN things | toInteger(n)] AS int_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_09")
    }

    /*
    Scenario: `toInteger()` on a list of strings
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_10() {
        val container = Cypher2Relalg.processString('''
        WITH ['2', '2.9', 'foo'] AS numbers
        RETURN [n IN numbers | toInteger(n)] AS int_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_10")
    }

    /*
    Scenario: `toInteger()` on a complex-typed expression
    Given any graph
    And parameters are:
      | param | 1 |
    */
    @Test
    def void testTypeConversionFunctions_11() {
        val container = Cypher2Relalg.processString('''
        RETURN toInteger(1 - {param}) AS result
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_11")
    }

    /*
    Scenario: `toFloat()`
    Given an empty graph
    And having executed:
      """
      CREATE (:Movie {rating: 4})
      """
    */
    @Test
    def void testTypeConversionFunctions_12() {
        val container = Cypher2Relalg.processString('''
        MATCH (m:Movie { rating: 4 })
        WITH *
        MATCH (n)
        RETURN toFloat(n.rating) AS float
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_12")
    }

    /*
    Scenario: `toFloat()` on mixed number types
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_13() {
        val container = Cypher2Relalg.processString('''
        WITH [3.4, 3] AS numbers
        RETURN [n IN numbers | toFloat(n)] AS float_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_13")
    }

    /*
    Scenario: `toFloat()` returning null on non-numerical string
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_14() {
        val container = Cypher2Relalg.processString('''
        WITH 'foo' AS foo_string, '' AS empty_string
        RETURN toFloat(foo_string) AS foo, toFloat(empty_string) AS empty
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_14")
    }

    /*
    Scenario: `toFloat()` handling Any type
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_15() {
        val container = Cypher2Relalg.processString('''
        WITH [3.4, 3, '5'] AS numbers
        RETURN [n IN numbers | toFloat(n)] AS float_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_15")
    }

    /*
    Scenario: `toFloat()` on a list of strings
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_16() {
        val container = Cypher2Relalg.processString('''
        WITH ['1', '2', 'foo'] AS numbers
        RETURN [n IN numbers | toFloat(n)] AS float_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_16")
    }

    /*
    Scenario: `toString()`
    Given an empty graph
    And having executed:
      """
      CREATE (:Movie {rating: 4})
      """
    */
    @Test
    def void testTypeConversionFunctions_17() {
        val container = Cypher2Relalg.processString('''
        MATCH (m:Movie { rating: 4 })
        WITH *
        MATCH (n)
        RETURN toString(n.rating)
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_17")
    }

    /*
    Scenario: `toString()` handling boolean properties
    Given an empty graph
    And having executed:
      """
      CREATE (:Movie {watched: true})
      """
    */
    @Test
    def void testTypeConversionFunctions_18() {
        val container = Cypher2Relalg.processString('''
        MATCH (m:Movie)
        RETURN toString(m.watched)
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_18")
    }

    /*
    Scenario: `toString()` handling inlined boolean
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_19() {
        val container = Cypher2Relalg.processString('''
        RETURN toString(1 < 0) AS bool
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_19")
    }

    /*
    Scenario: `toString()` handling boolean literal
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_20() {
        val container = Cypher2Relalg.processString('''
        RETURN toString(true) AS bool
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_20")
    }

    /*
    Scenario: `toString()` should work on Any type
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_21() {
        val container = Cypher2Relalg.processString('''
        RETURN [x IN [1, 2.3, true, 'apa'] | toString(x) ] AS list
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_21")
    }

    /*
    Scenario: `toString()` on a list of integers
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_22() {
        val container = Cypher2Relalg.processString('''
        WITH [1, 2, 3] AS numbers
        RETURN [n IN numbers | toString(n)] AS string_numbers
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_22")
    }

    /*
    Scenario: `toString()` should accept potentially correct types 1
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_23() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['male', 'female', null] AS gen
        RETURN coalesce(toString(gen), 'x') AS result
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_23")
    }

    /*
    Scenario: `toString()` should accept potentially correct types 2
    Given any graph
    */
    @Test
    def void testTypeConversionFunctions_24() {
        val container = Cypher2Relalg.processString('''
        UNWIND ['male', 'female', null] AS gen
        RETURN toString(coalesce(gen, 'x')) AS result
        ''')
        container.inferBasicSchema
        container.convert("tck/TypeConversionFunctions_24")
    }

}
