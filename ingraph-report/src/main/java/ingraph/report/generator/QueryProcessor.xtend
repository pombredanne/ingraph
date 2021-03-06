package ingraph.report.generator

import ingraph.cypher2relalg.Cypher2Relalg
import ingraph.optimization.transformations.relalg2rete.Relalg2ReteTransformation
import ingraph.relalg.inferencers.BasicSchemaInferencer
import ingraph.relalg.inferencers.ExtraVariableInferencer
import ingraph.relalg.inferencers.FullSchemaInferencer
import ingraph.relalg2tex.config.RelalgConverterConfig
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexExpressionConverter
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter
import ingraph.report.generator.data.TestQuery
import ingraph.report.generator.util.TechReportEscaper
import java.util.ArrayList
import java.util.List
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.xtend.lib.annotations.Accessors
import relalg.RelalgContainer

class QueryProcessor {
	
	extension Relalg2ReteTransformation Relalg2ReteTransformation = new Relalg2ReteTransformation
	extension BasicSchemaInferencer basicSchemaInferencer = new BasicSchemaInferencer
	extension ExtraVariableInferencer extraVariableInferencer = new ExtraVariableInferencer
	extension FullSchemaInferencer fullSchemaInferencer = new FullSchemaInferencer
	extension TechReportEscaper escaper = new TechReportEscaper

	protected val treeSerializerConfig = RelalgConverterConfig.builder.includeCommonVariables(true).build
	protected val treeSerializer = new Relalg2TexTreeConverter(treeSerializerConfig)
	protected val expressionConverter = new Relalg2TexExpressionConverter

	@Accessors(PUBLIC_GETTER) var totalQueries = 0
	@Accessors(PUBLIC_GETTER) var compilingQueries = 0
	@Accessors(PUBLIC_GETTER) var List<CharSequence> subsections = new ArrayList

	def void processQueries(Iterable<TestQuery> testQueries) {
		for (testQuery : testQueries) {
			toSubsection(testQuery)
		}
	}

	def void toSubsection(TestQuery testQuery) {
		totalQueries++
		var RelalgContainer container = null
		try {
			container = Cypher2Relalg.processString(testQuery.querySpecification)
			compilingQueries++
		} catch (Exception e) {
			e.printStackTrace
		}
		subsections.add(subsection(container, testQuery.queryName, testQuery.querySpecification, testQuery.regressionTest))
	}

	def subsection(RelalgContainer container, String name, String listing, boolean regressionTest) {
		'''
		\subsection[«name.escape»]{«name.escape»«IF (regressionTest)» \textcolor{gray}{[regression test]}«ENDIF»}

		\subsubsection*«"Query specification".toHeader(name)»

		\begin{lstlisting}
		«listing»
		\end{lstlisting}

		«IF container === null»
		\subsubsection*{Cannot parse query}
		Cannot parse query. This is probably a limitation in our current parser and not an error in the query specification.

		«ELSE»
		\subsubsection*«"Relational algebra expression for search-based evaluation".toHeader(name)»

		«val expression = container.expression»
		«IF expression === null»
			Cannot visualize expression.
		«ELSE»
			\begin{align*}
			\begin{autobreak}
			r = «expression»
			\end{autobreak}
			\end{align*}
		«ENDIF»

		\subsubsection*«"Relational algebra tree for search-based evaluation".toHeader(name)»

		«val searchTree = container.visualizeTree»
		«IF searchTree === null»
			Cannot visualize tree.
		«ELSE»
			\begin{center}
			\begin{adjustbox}{max width=\textwidth}
			«searchTree»
			\end{adjustbox}
			\end{center}
		«ENDIF»

		\subsubsection*«"Incremental relational algebra tree".toHeader(name)»

		«val incrementalTree = container.visualizeWithTransformations»
		«IF incrementalTree === null»
			Cannot visualize incremental tree.
		«ELSE»
			\begin{center}
			\begin{adjustbox}{max width=\textwidth}
			«incrementalTree»
			\end{adjustbox}
			\end{center}
		«ENDIF»

		«ENDIF»
		'''
	}
	
	def toHeader(String title, String queryName) {
		'''{«title» \textcolor{gray}{(«queryName.escape»)}}'''
	}

	def expression(RelalgContainer container) {
		try {
			val expressionContainer = EcoreUtil.copy(container)
			expressionContainer.inferBasicSchema
			expressionConverter.convert(expressionContainer).toString
		} catch (Exception e) {
			e.printStackTrace
			null
		}
	}

	def visualizeTree(RelalgContainer container) {
		try {
			val treeContainer = EcoreUtil.copy(container)
			treeContainer.inferBasicSchema
			treeSerializer.convert(treeContainer)
		} catch (Exception e) {
			e.printStackTrace
			null
		}
	}

	def visualizeWithTransformations(RelalgContainer container) {
		try {
			val incrementalContainer = EcoreUtil.copy(container)
			incrementalContainer.transformToRete
			incrementalContainer.inferBasicSchema
			incrementalContainer.inferExtraVariables
			incrementalContainer.inferFullSchema
			treeSerializer.convert(incrementalContainer)
		} catch (Exception e) {
			e.printStackTrace
			null
		}
	}


}