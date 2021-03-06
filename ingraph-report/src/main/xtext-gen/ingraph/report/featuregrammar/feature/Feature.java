/**
 * generated by Xtext 2.10.0
 */
package ingraph.report.featuregrammar.feature;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Feature</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link ingraph.report.featuregrammar.feature.Feature#getTags <em>Tags</em>}</li>
 *   <li>{@link ingraph.report.featuregrammar.feature.Feature#getName <em>Name</em>}</li>
 *   <li>{@link ingraph.report.featuregrammar.feature.Feature#getElements <em>Elements</em>}</li>
 *   <li>{@link ingraph.report.featuregrammar.feature.Feature#getScenarios <em>Scenarios</em>}</li>
 * </ul>
 *
 * @see ingraph.report.featuregrammar.feature.FeaturePackage#getFeature()
 * @model
 * @generated
 */
public interface Feature extends EObject
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
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getFeature_Tags()
   * @model unique="false"
   * @generated
   */
  EList<String> getTags();

  /**
   * Returns the value of the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Name</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Name</em>' attribute.
   * @see #setName(String)
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getFeature_Name()
   * @model
   * @generated
   */
  String getName();

  /**
   * Sets the value of the '{@link ingraph.report.featuregrammar.feature.Feature#getName <em>Name</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Name</em>' attribute.
   * @see #getName()
   * @generated
   */
  void setName(String value);

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
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getFeature_Elements()
   * @model containment="true"
   * @generated
   */
  EList<NarrativeElement> getElements();

  /**
   * Returns the value of the '<em><b>Scenarios</b></em>' containment reference list.
   * The list contents are of type {@link ingraph.report.featuregrammar.feature.AbstractScenario}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Scenarios</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Scenarios</em>' containment reference list.
   * @see ingraph.report.featuregrammar.feature.FeaturePackage#getFeature_Scenarios()
   * @model containment="true"
   * @generated
   */
  EList<AbstractScenario> getScenarios();

} // Feature
