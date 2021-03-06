package ingraph.report.generator.tests

import com.google.common.collect.ImmutableMap
import ingraph.report.generator.data.TestQuery
import ingraph.report.generator.util.NaturalOrderComparator
import java.io.File
import java.nio.charset.Charset
import java.util.Collections
import java.util.LinkedList
import java.util.Map
import org.apache.commons.io.FileUtils
import org.apache.commons.io.FilenameUtils

abstract class DirectoryTest extends IngraphReportTest {
	
	def toChapter(String directoryName, String chapterTitle) {
		val directoryPath = '''../queries/«directoryName»/'''
		val fileNames = FileUtils.listFiles(new File(directoryPath), #["cypher"], false).map[name].toList
		Collections.sort(fileNames, new NaturalOrderComparator());
	 
		val sectionTestQueries = new LinkedList<TestQuery>
		for (fileName : fileNames) {
			val queryName = FilenameUtils.removeExtension(fileName)
			val querySpecification = FileUtils.readFileToString(new File(directoryPath + fileName), Charset.forName("UTF-8"))
			val testQuery = TestQuery.builder.queryName(queryName).querySpecification(querySpecification).build
			sectionTestQueries.add(testQuery)
		}
		
		val Map<String, Iterable<TestQuery>> chapterQuerySpecifications = ImmutableMap.of("Queries", sectionTestQueries)
		printChapter(directoryName, chapterTitle, chapterQuerySpecifications)
	}
	
}
