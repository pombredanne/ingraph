/**
 * generated by Xtext 2.10.0
 */
package ingraph.report.feature;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>When Step</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link ingraph.report.feature.WhenStep#getTags <em>Tags</em>}</li>
 * </ul>
 *
 * @see ingraph.report.feature.FeaturePackage#getWhenStep()
 * @model
 * @generated
 */
public interface WhenStep extends Step
{
  /**
   * Returns the value of the '<em><b>Tags</b></em>' attribute list.
   * The list contents are of type {@link java.lang.String}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Tags</em>' attribute list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Tags</em>' attribute list.
   * @see ingraph.report.feature.FeaturePackage#getWhenStep_Tags()
   * @model unique="false"
   * @generated
   */
  EList<String> getTags();

} // WhenStep
