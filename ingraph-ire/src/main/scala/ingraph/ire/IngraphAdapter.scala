package ingraph.ire

import com.tinkerpop.blueprints.util.wrappers.event.EventGraph
import hu.bme.mit.ire.Transaction
import ingraph.optimization.transformations.relalg2rete.Relalg2ReteTransformation
import ingraph.relalg.util.SchemaInferencer
import org.apache.tinkerpop.gremlin.structure.Graph
import org.apache.tinkerpop.gremlin.structure.io.IoCore
import org.apache.tinkerpop.gremlin.tinkergraph.structure.TinkerGraph
import relalg.{ProductionOperator, RelalgContainer}

class IngraphAdapter(plan: RelalgContainer) {
  private val rete = new Relalg2ReteTransformation
  private val inferencer = new SchemaInferencer
  private val sn = inferencer.addSchemaInformation(rete.transformToRete(plan))

  val engine = EngineFactory.createQueryEngine(sn.getRootExpression.asInstanceOf[ProductionOperator])

  private val listener = new IngraphGraphChangedListener(
    engine.vertexConverters.toMap, engine.edgeConverters.toMap, engine.inputLookup) with LongIdParser

  def readGraph(path: String, transaction: Transaction) {
    val graph = new EventGraph[Graph](TinkerGraph.open())
    graph.addListener(listener)
    listener.transaction = transaction
    val reader = graph.io(IoCore.graphml)
    reader.readGraph(path)
  }
}
