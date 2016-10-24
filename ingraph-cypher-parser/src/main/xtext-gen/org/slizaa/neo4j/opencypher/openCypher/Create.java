/**
 * generated by Xtext 2.10.0
 */
package org.slizaa.neo4j.opencypher.openCypher;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Create</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.Create#isUnique <em>Unique</em>}</li>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.Create#getPattern <em>Pattern</em>}</li>
 * </ul>
 *
 * @see org.slizaa.neo4j.opencypher.openCypher.OpenCypherPackage#getCreate()
 * @model
 * @generated
 */
public interface Create extends Clause
{
  /**
   * Returns the value of the '<em><b>Unique</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Unique</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Unique</em>' attribute.
   * @see #setUnique(boolean)
   * @see org.slizaa.neo4j.opencypher.openCypher.OpenCypherPackage#getCreate_Unique()
   * @model
   * @generated
   */
  boolean isUnique();

  /**
   * Sets the value of the '{@link org.slizaa.neo4j.opencypher.openCypher.Create#isUnique <em>Unique</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Unique</em>' attribute.
   * @see #isUnique()
   * @generated
   */
  void setUnique(boolean value);

  /**
   * Returns the value of the '<em><b>Pattern</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Pattern</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Pattern</em>' containment reference.
   * @see #setPattern(Pattern)
   * @see org.slizaa.neo4j.opencypher.openCypher.OpenCypherPackage#getCreate_Pattern()
   * @model containment="true"
   * @generated
   */
  Pattern getPattern();

  /**
   * Sets the value of the '{@link org.slizaa.neo4j.opencypher.openCypher.Create#getPattern <em>Pattern</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Pattern</em>' containment reference.
   * @see #getPattern()
   * @generated
   */
  void setPattern(Pattern value);

} // Create
