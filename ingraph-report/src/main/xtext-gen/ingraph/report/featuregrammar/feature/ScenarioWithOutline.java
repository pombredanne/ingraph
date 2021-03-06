/**
 * generated by Xtext 2.10.0
 */
package ingraph.report.featuregrammar.feature;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Scenario With Outline</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link ingraph.report.featuregrammar.feature.ScenarioWithOutline#getElements <em>Elements</em>}</li>
 *   <li>{@link ingraph.report.featuregrammar.feature.ScenarioWithOutline#getExample <em>Example</em>}</li>
 * </ul>
 *
 * @see ingraph.report.featuregrammar.feature.FeaturePackage#getScenarioWithOutline()
 * @model
 * @generated
 */
public interface ScenarioWithOutline extends AbstractScenario
{
  /**
   * Returns the value of the '<em><b>Elements</b></em>' containment reference list.
   * The list contents are of type {@link ingraph.report.featuregrammar.feature.NarrativeElement}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Elements</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Elements</em>' containment reference list.
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getScenarioWithOutline_Elements()
   * @model containment="true"
   * @generated
   */
  EList<NarrativeElement> getElements();

  /**
   * Returns the value of the '<em><b>Example</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Example</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Example</em>' containment reference.
   * @see #setExample(Example)
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getScenarioWithOutline_Example()
   * @model containment="true"
   * @generated
   */
  Example getExample();

  /**
   * Sets the value of the '{@link ingraph.report.featuregrammar.feature.ScenarioWithOutline#getExample <em>Example</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Example</em>' containment reference.
   * @see #getExample()
   * @generated
   */
  void setExample(Example value);

} // ScenarioWithOutline
