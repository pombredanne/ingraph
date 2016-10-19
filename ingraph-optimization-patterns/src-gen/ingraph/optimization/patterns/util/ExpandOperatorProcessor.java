/**
 * Generated from platform:/resource/ingraph-optimization-patterns/src/ingraph/optimization/patterns/Optimization.vql
 */
package ingraph.optimization.patterns.util;

import ingraph.optimization.patterns.ExpandOperatorMatch;
import org.eclipse.viatra.query.runtime.api.IMatchProcessor;
import relalg.ExpandOperator;

/**
 * A match processor tailored for the ingraph.optimization.patterns.expandOperator pattern.
 * 
 * Clients should derive an (anonymous) class that implements the abstract process().
 * 
 */
@SuppressWarnings("all")
public abstract class ExpandOperatorProcessor implements IMatchProcessor<ExpandOperatorMatch> {
  /**
   * Defines the action that is to be executed on each match.
   * @param pExpandOperator the value of pattern parameter expandOperator in the currently processed match
   * 
   */
  public abstract void process(final ExpandOperator pExpandOperator);
  
  @Override
  public void process(final ExpandOperatorMatch match) {
    process(match.getExpandOperator());
  }
}
