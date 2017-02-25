package ingraph.cypher2relalg.tck.tests

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.cypher2relalg.tck.FailingTests
import ingraph.cypher2relalg.tck.RegressionTests
import ingraph.cypherparser.CypherParser
import ingraph.cypherparser.CypherUtil
import org.junit.Test
import org.junit.experimental.categories.Category

class FunctionsAcceptanceParserTest {
		
		/*
		Scenario: Run coalesce
		Given an empty graph
		And having executed:
			"""
			CREATE ({name: 'Emil Eifrem', title: 'CEO'}), ({name: 'Nobody'})
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_01() {
				val cypher = CypherParser.parseString('''
				MATCH (a)
				RETURN coalesce(a.title, a.name)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_01")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: Functions should return null if they get path containing unbound
		Given any graph
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_02() {
				val cypher = CypherParser.parseString('''
				WITH null AS a
				OPTIONAL MATCH p = (a)-[r]->()
				RETURN length(nodes(p)), type(r), nodes(p), relationships(p)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_02")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `split()`
		Given any graph
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_03() {
				val cypher = CypherParser.parseString('''
				UNWIND split('one1two', '1') AS item
				RETURN count(item) AS item
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_03")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `properties()` on a node
		Given an empty graph
		And having executed:
			"""
			CREATE (n:Person {name: 'Popeye', level: 9001})
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_04() {
				val cypher = CypherParser.parseString('''
				MATCH (p:Person)
				RETURN properties(p) AS m
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_04")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `properties()` on a relationship
		Given an empty graph
		And having executed:
			"""
			CREATE (n)-[:R {name: 'Popeye', level: 9001}]->(n)
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_05() {
				val cypher = CypherParser.parseString('''
				MATCH ()-[r:R]->()
				RETURN properties(r) AS m
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_05")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `properties()` on a map
		Given any graph
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_06() {
				val cypher = CypherParser.parseString('''
				RETURN properties({name: 'Popeye', level: 9001}) AS m
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_06")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `properties()` on null
		Given any graph
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_07() {
				val cypher = CypherParser.parseString('''
				RETURN properties(null)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_07")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `reverse()`
		Given any graph
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_08() {
				val cypher = CypherParser.parseString('''
				RETURN reverse('raksO')
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_08")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `exists()` with dynamic property lookup
		Given an empty graph
		And having executed:
			"""
			CREATE (:Person {prop: 'foo'}),
						 (:Person)
			"""
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_09() {
				val cypher = CypherParser.parseString('''
				MATCH (n:Person)
				WHERE exists(n['prop'])
				RETURN n
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_09")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `percentileDisc()` failing in more involved query
		Given an empty graph
		And having executed:
			"""
			UNWIND range(0, 10) AS i
			CREATE (s:S)
			WITH s, i
			UNWIND range(0, i) AS j
			CREATE (s)-[:REL]->()
			"""
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_10() {
				val cypher = CypherParser.parseString('''
				MATCH (n:S)
				WITH n, size([(n)-->() | 1]) AS deg
				WHERE deg > 2
				WITH deg
				LIMIT 100
				RETURN percentileDisc(0.90, deg), deg
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_10")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `type()`
		Given an empty graph
		And having executed:
			"""
			CREATE ()-[:T]->()
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_11() {
				val cypher = CypherParser.parseString('''
				MATCH ()-[r]->()
				RETURN type(r)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_11")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `type()` on two relationships
		Given an empty graph
		And having executed:
			"""
			CREATE ()-[:T1]->()-[:T2]->()
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_12() {
				val cypher = CypherParser.parseString('''
				MATCH ()-[r1]->()-[r2]->()
				RETURN type(r1), type(r2)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_12")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `type()` on null relationship
		Given an empty graph
		And having executed:
			"""
			CREATE ()
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_13() {
				val cypher = CypherParser.parseString('''
				MATCH (a)
				OPTIONAL MATCH (a)-[r:NOT_THERE]->()
				RETURN type(r)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_13")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `type()` on mixed null and non-null relationships
		Given an empty graph
		And having executed:
			"""
			CREATE ()-[:T]->()
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_14() {
				val cypher = CypherParser.parseString('''
				MATCH (a)
				OPTIONAL MATCH (a)-[r:T]->()
				RETURN type(r)
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_14")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `type()` handling Any type
		Given an empty graph
		And having executed:
			"""
			CREATE ()-[:T]->()
			"""
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_15() {
				val cypher = CypherParser.parseString('''
				MATCH (a)-[r]->()
				WITH [r, 1] AS list
				RETURN type(list[0])
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_15")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `labels()` should accept type Any
		Given an empty graph
		And having executed:
			"""
			CREATE (:Foo), (:Foo:Bar)
			"""
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_16() {
				val cypher = CypherParser.parseString('''
				MATCH (a)
				WITH [a, 1] AS list
				RETURN labels(list[0]) AS l
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_16")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `labels()` should accept type Any
		Given an empty graph
		And having executed:
			"""
			CREATE (:Foo), (:Foo:Bar)
			"""
		*/
		@Test
		@Category(FailingTests)
		def void testFunctionsAcceptance_17() {
				val cypher = CypherParser.parseString('''
				MATCH (a)
				WITH [a, 1] AS list
				RETURN labels(list[1]) AS l
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_17")
				Cypher2Relalg.processCypher(cypher)
		}

		/*
		Scenario: `exists()` is case insensitive
		Given an empty graph
		And having executed:
			"""
			CREATE (a:X {prop: 42}), (:X)
			"""
		*/
		@Test
		@Category(RegressionTests)
		def void testFunctionsAcceptance_18() {
				val cypher = CypherParser.parseString('''
				MATCH (n:X)
				RETURN n, EXIsTS(n.prop) AS b
				''')
				CypherUtil.save(cypher, "../ingraph-cypxmi/tck/FunctionsAcceptance_18")
				Cypher2Relalg.processCypher(cypher)
		}

}
