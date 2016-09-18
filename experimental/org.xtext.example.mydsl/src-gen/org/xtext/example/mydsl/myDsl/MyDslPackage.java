/**
 * generated by Xtext 2.10.0
 */
package org.xtext.example.mydsl.myDsl;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see org.xtext.example.mydsl.myDsl.MyDslFactory
 * @model kind="package"
 * @generated
 */
public interface MyDslPackage extends EPackage
{
  /**
   * The package name.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNAME = "myDsl";

  /**
   * The package namespace URI.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNS_URI = "http://www.xtext.org/example/mydsl/MyDsl";

  /**
   * The package namespace name.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNS_PREFIX = "myDsl";

  /**
   * The singleton instance of the package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  MyDslPackage eINSTANCE = org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl.init();

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.CypherQueryImpl <em>Cypher Query</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.CypherQueryImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getCypherQuery()
   * @generated
   */
  int CYPHER_QUERY = 0;

  /**
   * The feature id for the '<em><b>Queries</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CYPHER_QUERY__QUERIES = 0;

  /**
   * The number of structural features of the '<em>Cypher Query</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CYPHER_QUERY_FEATURE_COUNT = 1;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.QueryImpl <em>Query</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.QueryImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getQuery()
   * @generated
   */
  int QUERY = 1;

  /**
   * The feature id for the '<em><b>Pattern</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int QUERY__PATTERN = 0;

  /**
   * The number of structural features of the '<em>Query</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int QUERY_FEATURE_COUNT = 1;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternImpl <em>Pattern</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.PatternImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPattern()
   * @generated
   */
  int PATTERN = 2;

  /**
   * The feature id for the '<em><b>Parts</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN__PARTS = 0;

  /**
   * The number of structural features of the '<em>Pattern</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_FEATURE_COUNT = 1;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternPartImpl <em>Pattern Part</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.PatternPartImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPatternPart()
   * @generated
   */
  int PATTERN_PART = 3;

  /**
   * The feature id for the '<em><b>Node</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_PART__NODE = 0;

  /**
   * The feature id for the '<em><b>Chain</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_PART__CHAIN = 1;

  /**
   * The number of structural features of the '<em>Pattern Part</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_PART_FEATURE_COUNT = 2;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.NodePatternImpl <em>Node Pattern</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.NodePatternImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getNodePattern()
   * @generated
   */
  int NODE_PATTERN = 4;

  /**
   * The feature id for the '<em><b>Variable</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NODE_PATTERN__VARIABLE = 0;

  /**
   * The feature id for the '<em><b>Label</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NODE_PATTERN__LABEL = 1;

  /**
   * The number of structural features of the '<em>Node Pattern</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NODE_PATTERN_FEATURE_COUNT = 2;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternElementChainImpl <em>Pattern Element Chain</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.PatternElementChainImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPatternElementChain()
   * @generated
   */
  int PATTERN_ELEMENT_CHAIN = 5;

  /**
   * The feature id for the '<em><b>Relationship Pattern</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_ELEMENT_CHAIN__RELATIONSHIP_PATTERN = 0;

  /**
   * The feature id for the '<em><b>Node Pattern</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_ELEMENT_CHAIN__NODE_PATTERN = 1;

  /**
   * The number of structural features of the '<em>Pattern Element Chain</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PATTERN_ELEMENT_CHAIN_FEATURE_COUNT = 2;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.RelationshipPatternImpl <em>Relationship Pattern</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.RelationshipPatternImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getRelationshipPattern()
   * @generated
   */
  int RELATIONSHIP_PATTERN = 6;

  /**
   * The number of structural features of the '<em>Relationship Pattern</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int RELATIONSHIP_PATTERN_FEATURE_COUNT = 0;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.RelationshipDetailImpl <em>Relationship Detail</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.RelationshipDetailImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getRelationshipDetail()
   * @generated
   */
  int RELATIONSHIP_DETAIL = 7;

  /**
   * The feature id for the '<em><b>Variable</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int RELATIONSHIP_DETAIL__VARIABLE = RELATIONSHIP_PATTERN_FEATURE_COUNT + 0;

  /**
   * The feature id for the '<em><b>Label</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int RELATIONSHIP_DETAIL__LABEL = RELATIONSHIP_PATTERN_FEATURE_COUNT + 1;

  /**
   * The number of structural features of the '<em>Relationship Detail</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int RELATIONSHIP_DETAIL_FEATURE_COUNT = RELATIONSHIP_PATTERN_FEATURE_COUNT + 2;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.VariableImpl <em>Variable</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.VariableImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getVariable()
   * @generated
   */
  int VARIABLE = 8;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int VARIABLE__NAME = 0;

  /**
   * The number of structural features of the '<em>Variable</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int VARIABLE_FEATURE_COUNT = 1;

  /**
   * The meta object id for the '{@link org.xtext.example.mydsl.myDsl.impl.LabelImpl <em>Label</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.example.mydsl.myDsl.impl.LabelImpl
   * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getLabel()
   * @generated
   */
  int LABEL = 9;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int LABEL__NAME = 0;

  /**
   * The number of structural features of the '<em>Label</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int LABEL_FEATURE_COUNT = 1;


  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.CypherQuery <em>Cypher Query</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Cypher Query</em>'.
   * @see org.xtext.example.mydsl.myDsl.CypherQuery
   * @generated
   */
  EClass getCypherQuery();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.example.mydsl.myDsl.CypherQuery#getQueries <em>Queries</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Queries</em>'.
   * @see org.xtext.example.mydsl.myDsl.CypherQuery#getQueries()
   * @see #getCypherQuery()
   * @generated
   */
  EReference getCypherQuery_Queries();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.Query <em>Query</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Query</em>'.
   * @see org.xtext.example.mydsl.myDsl.Query
   * @generated
   */
  EClass getQuery();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.Query#getPattern <em>Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.Query#getPattern()
   * @see #getQuery()
   * @generated
   */
  EReference getQuery_Pattern();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.Pattern <em>Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.Pattern
   * @generated
   */
  EClass getPattern();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.example.mydsl.myDsl.Pattern#getParts <em>Parts</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Parts</em>'.
   * @see org.xtext.example.mydsl.myDsl.Pattern#getParts()
   * @see #getPattern()
   * @generated
   */
  EReference getPattern_Parts();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.PatternPart <em>Pattern Part</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Pattern Part</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternPart
   * @generated
   */
  EClass getPatternPart();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.PatternPart#getNode <em>Node</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Node</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternPart#getNode()
   * @see #getPatternPart()
   * @generated
   */
  EReference getPatternPart_Node();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.example.mydsl.myDsl.PatternPart#getChain <em>Chain</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Chain</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternPart#getChain()
   * @see #getPatternPart()
   * @generated
   */
  EReference getPatternPart_Chain();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.NodePattern <em>Node Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Node Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.NodePattern
   * @generated
   */
  EClass getNodePattern();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.NodePattern#getVariable <em>Variable</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Variable</em>'.
   * @see org.xtext.example.mydsl.myDsl.NodePattern#getVariable()
   * @see #getNodePattern()
   * @generated
   */
  EReference getNodePattern_Variable();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.NodePattern#getLabel <em>Label</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Label</em>'.
   * @see org.xtext.example.mydsl.myDsl.NodePattern#getLabel()
   * @see #getNodePattern()
   * @generated
   */
  EReference getNodePattern_Label();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.PatternElementChain <em>Pattern Element Chain</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Pattern Element Chain</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternElementChain
   * @generated
   */
  EClass getPatternElementChain();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.PatternElementChain#getRelationshipPattern <em>Relationship Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Relationship Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternElementChain#getRelationshipPattern()
   * @see #getPatternElementChain()
   * @generated
   */
  EReference getPatternElementChain_RelationshipPattern();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.PatternElementChain#getNodePattern <em>Node Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Node Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.PatternElementChain#getNodePattern()
   * @see #getPatternElementChain()
   * @generated
   */
  EReference getPatternElementChain_NodePattern();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.RelationshipPattern <em>Relationship Pattern</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Relationship Pattern</em>'.
   * @see org.xtext.example.mydsl.myDsl.RelationshipPattern
   * @generated
   */
  EClass getRelationshipPattern();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.RelationshipDetail <em>Relationship Detail</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Relationship Detail</em>'.
   * @see org.xtext.example.mydsl.myDsl.RelationshipDetail
   * @generated
   */
  EClass getRelationshipDetail();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.RelationshipDetail#getVariable <em>Variable</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Variable</em>'.
   * @see org.xtext.example.mydsl.myDsl.RelationshipDetail#getVariable()
   * @see #getRelationshipDetail()
   * @generated
   */
  EReference getRelationshipDetail_Variable();

  /**
   * Returns the meta object for the containment reference '{@link org.xtext.example.mydsl.myDsl.RelationshipDetail#getLabel <em>Label</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference '<em>Label</em>'.
   * @see org.xtext.example.mydsl.myDsl.RelationshipDetail#getLabel()
   * @see #getRelationshipDetail()
   * @generated
   */
  EReference getRelationshipDetail_Label();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.Variable <em>Variable</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Variable</em>'.
   * @see org.xtext.example.mydsl.myDsl.Variable
   * @generated
   */
  EClass getVariable();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.example.mydsl.myDsl.Variable#getName <em>Name</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Name</em>'.
   * @see org.xtext.example.mydsl.myDsl.Variable#getName()
   * @see #getVariable()
   * @generated
   */
  EAttribute getVariable_Name();

  /**
   * Returns the meta object for class '{@link org.xtext.example.mydsl.myDsl.Label <em>Label</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Label</em>'.
   * @see org.xtext.example.mydsl.myDsl.Label
   * @generated
   */
  EClass getLabel();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.example.mydsl.myDsl.Label#getName <em>Name</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Name</em>'.
   * @see org.xtext.example.mydsl.myDsl.Label#getName()
   * @see #getLabel()
   * @generated
   */
  EAttribute getLabel_Name();

  /**
   * Returns the factory that creates the instances of the model.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the factory that creates the instances of the model.
   * @generated
   */
  MyDslFactory getMyDslFactory();

  /**
   * <!-- begin-user-doc -->
   * Defines literals for the meta objects that represent
   * <ul>
   *   <li>each class,</li>
   *   <li>each feature of each class,</li>
   *   <li>each enum,</li>
   *   <li>and each data type</li>
   * </ul>
   * <!-- end-user-doc -->
   * @generated
   */
  interface Literals
  {
    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.CypherQueryImpl <em>Cypher Query</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.CypherQueryImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getCypherQuery()
     * @generated
     */
    EClass CYPHER_QUERY = eINSTANCE.getCypherQuery();

    /**
     * The meta object literal for the '<em><b>Queries</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference CYPHER_QUERY__QUERIES = eINSTANCE.getCypherQuery_Queries();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.QueryImpl <em>Query</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.QueryImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getQuery()
     * @generated
     */
    EClass QUERY = eINSTANCE.getQuery();

    /**
     * The meta object literal for the '<em><b>Pattern</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference QUERY__PATTERN = eINSTANCE.getQuery_Pattern();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternImpl <em>Pattern</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.PatternImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPattern()
     * @generated
     */
    EClass PATTERN = eINSTANCE.getPattern();

    /**
     * The meta object literal for the '<em><b>Parts</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference PATTERN__PARTS = eINSTANCE.getPattern_Parts();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternPartImpl <em>Pattern Part</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.PatternPartImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPatternPart()
     * @generated
     */
    EClass PATTERN_PART = eINSTANCE.getPatternPart();

    /**
     * The meta object literal for the '<em><b>Node</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference PATTERN_PART__NODE = eINSTANCE.getPatternPart_Node();

    /**
     * The meta object literal for the '<em><b>Chain</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference PATTERN_PART__CHAIN = eINSTANCE.getPatternPart_Chain();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.NodePatternImpl <em>Node Pattern</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.NodePatternImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getNodePattern()
     * @generated
     */
    EClass NODE_PATTERN = eINSTANCE.getNodePattern();

    /**
     * The meta object literal for the '<em><b>Variable</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference NODE_PATTERN__VARIABLE = eINSTANCE.getNodePattern_Variable();

    /**
     * The meta object literal for the '<em><b>Label</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference NODE_PATTERN__LABEL = eINSTANCE.getNodePattern_Label();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.PatternElementChainImpl <em>Pattern Element Chain</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.PatternElementChainImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getPatternElementChain()
     * @generated
     */
    EClass PATTERN_ELEMENT_CHAIN = eINSTANCE.getPatternElementChain();

    /**
     * The meta object literal for the '<em><b>Relationship Pattern</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference PATTERN_ELEMENT_CHAIN__RELATIONSHIP_PATTERN = eINSTANCE.getPatternElementChain_RelationshipPattern();

    /**
     * The meta object literal for the '<em><b>Node Pattern</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference PATTERN_ELEMENT_CHAIN__NODE_PATTERN = eINSTANCE.getPatternElementChain_NodePattern();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.RelationshipPatternImpl <em>Relationship Pattern</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.RelationshipPatternImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getRelationshipPattern()
     * @generated
     */
    EClass RELATIONSHIP_PATTERN = eINSTANCE.getRelationshipPattern();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.RelationshipDetailImpl <em>Relationship Detail</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.RelationshipDetailImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getRelationshipDetail()
     * @generated
     */
    EClass RELATIONSHIP_DETAIL = eINSTANCE.getRelationshipDetail();

    /**
     * The meta object literal for the '<em><b>Variable</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference RELATIONSHIP_DETAIL__VARIABLE = eINSTANCE.getRelationshipDetail_Variable();

    /**
     * The meta object literal for the '<em><b>Label</b></em>' containment reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference RELATIONSHIP_DETAIL__LABEL = eINSTANCE.getRelationshipDetail_Label();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.VariableImpl <em>Variable</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.VariableImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getVariable()
     * @generated
     */
    EClass VARIABLE = eINSTANCE.getVariable();

    /**
     * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute VARIABLE__NAME = eINSTANCE.getVariable_Name();

    /**
     * The meta object literal for the '{@link org.xtext.example.mydsl.myDsl.impl.LabelImpl <em>Label</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.example.mydsl.myDsl.impl.LabelImpl
     * @see org.xtext.example.mydsl.myDsl.impl.MyDslPackageImpl#getLabel()
     * @generated
     */
    EClass LABEL = eINSTANCE.getLabel();

    /**
     * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute LABEL__NAME = eINSTANCE.getLabel_Name();

  }

} //MyDslPackage