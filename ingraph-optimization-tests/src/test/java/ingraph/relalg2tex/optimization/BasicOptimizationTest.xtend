package ingraph.relalg2tex.optimization

import ingraph.optimization.transformations.reteoptimization.ReteOptimization
import ingraph.relalg.util.RelalgUtil
import ingraph.relalg2tex.converters.relalgconverters.Relalg2TexTreeConverter
import org.junit.Test

class BasicOptimizationTest {

	val extension Relalg2TexTreeConverter converter = new Relalg2TexTreeConverter
	val extension ReteOptimization optimization = new ReteOptimization
	val extension TestModelFactory testModelFactory = new TestModelFactory

	@Test
	def void test1() {
		// arrange
		val ctr = testModel1
		RelalgUtil.save(ctr, "testModel1")
		println(ctr.convert)

		// act
		ctr.performSimpleOptimization
		println(ctr.convert)
	}

	@Test
	def void test2() {
		// arrange
		val ctr = testModel2
		println(ctr.convert)

		// act
		ctr.performSimpleOptimization
		println(ctr.convert)
	}

	@Test
	def void test3() {
		// arrange
		val ctr = testModel3
		println(ctr.convert)

		// act
		ctr.performSimpleOptimization
		println(ctr.convert)
	}

}
