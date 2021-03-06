/**
 * generated by Xtext 2.10.0
 */
package ingraph.report.featuregrammar.feature;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Example</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link ingraph.report.featuregrammar.feature.Example#getHeading <em>Heading</em>}</li>
 *   <li>{@link ingraph.report.featuregrammar.feature.Example#getRows <em>Rows</em>}</li>
 * </ul>
 *
 * @see ingraph.report.featuregrammar.feature.FeaturePackage#getExample()
 * @model
 * @generated
 */
public interface Example extends EObject
{
  /**
   * Returns the value of the '<em><b>Heading</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Heading</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Heading</em>' containment reference.
   * @see #setHeading(ExampleRow)
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getExample_Heading()
   * @model containment="true"
   * @generated
   */
  ExampleRow getHeading();

  /**
   * Sets the value of the '{@link ingraph.report.featuregrammar.feature.Example#getHeading <em>Heading</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Heading</em>' containment reference.
   * @see #getHeading()
   * @generated
   */
  void setHeading(ExampleRow value);

  /**
   * Returns the value of the '<em><b>Rows</b></em>' containment reference list.
   * The list contents are of type {@link ingraph.report.featuregrammar.feature.ExampleRow}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Rows</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Rows</em>' containment reference list.
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getExample_Rows()
   * @model containment="true"
   * @generated
   */
  EList<ExampleRow> getRows();

} // Example
