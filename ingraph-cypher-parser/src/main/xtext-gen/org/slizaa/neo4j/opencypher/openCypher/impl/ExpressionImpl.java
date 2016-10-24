/**
 * generated by Xtext 2.10.0
 */
package org.slizaa.neo4j.opencypher.openCypher.impl;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentEList;
import org.eclipse.emf.ecore.util.InternalEList;

import org.slizaa.neo4j.opencypher.openCypher.Expression;
import org.slizaa.neo4j.opencypher.openCypher.Expression3Part;
import org.slizaa.neo4j.opencypher.openCypher.NodeLabel;
import org.slizaa.neo4j.opencypher.openCypher.OpenCypherPackage;
import org.slizaa.neo4j.opencypher.openCypher.PropertyLookup;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Expression</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.impl.ExpressionImpl#getOperator <em>Operator</em>}</li>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.impl.ExpressionImpl#getLeft <em>Left</em>}</li>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.impl.ExpressionImpl#getExpression3Parts <em>Expression3 Parts</em>}</li>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.impl.ExpressionImpl#getNodeLabelList <em>Node Label List</em>}</li>
 *   <li>{@link org.slizaa.neo4j.opencypher.openCypher.impl.ExpressionImpl#getPropertyLookup <em>Property Lookup</em>}</li>
 * </ul>
 *
 * @generated
 */
public class ExpressionImpl extends PropertyExpressionImpl implements Expression
{
  /**
   * The default value of the '{@link #getOperator() <em>Operator</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getOperator()
   * @generated
   * @ordered
   */
  protected static final String OPERATOR_EDEFAULT = null;

  /**
   * The cached value of the '{@link #getOperator() <em>Operator</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getOperator()
   * @generated
   * @ordered
   */
  protected String operator = OPERATOR_EDEFAULT;

  /**
   * The cached value of the '{@link #getLeft() <em>Left</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getLeft()
   * @generated
   * @ordered
   */
  protected Expression left;

  /**
   * The cached value of the '{@link #getExpression3Parts() <em>Expression3 Parts</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getExpression3Parts()
   * @generated
   * @ordered
   */
  protected EList<Expression3Part> expression3Parts;

  /**
   * The cached value of the '{@link #getNodeLabelList() <em>Node Label List</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getNodeLabelList()
   * @generated
   * @ordered
   */
  protected EList<NodeLabel> nodeLabelList;

  /**
   * The cached value of the '{@link #getPropertyLookup() <em>Property Lookup</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getPropertyLookup()
   * @generated
   * @ordered
   */
  protected EList<PropertyLookup> propertyLookup;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected ExpressionImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass()
  {
    return OpenCypherPackage.Literals.EXPRESSION;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public String getOperator()
  {
    return operator;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setOperator(String newOperator)
  {
    String oldOperator = operator;
    operator = newOperator;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, OpenCypherPackage.EXPRESSION__OPERATOR, oldOperator, operator));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Expression getLeft()
  {
    return left;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public NotificationChain basicSetLeft(Expression newLeft, NotificationChain msgs)
  {
    Expression oldLeft = left;
    left = newLeft;
    if (eNotificationRequired())
    {
      ENotificationImpl notification = new ENotificationImpl(this, Notification.SET, OpenCypherPackage.EXPRESSION__LEFT, oldLeft, newLeft);
      if (msgs == null) msgs = notification; else msgs.add(notification);
    }
    return msgs;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setLeft(Expression newLeft)
  {
    if (newLeft != left)
    {
      NotificationChain msgs = null;
      if (left != null)
        msgs = ((InternalEObject)left).eInverseRemove(this, EOPPOSITE_FEATURE_BASE - OpenCypherPackage.EXPRESSION__LEFT, null, msgs);
      if (newLeft != null)
        msgs = ((InternalEObject)newLeft).eInverseAdd(this, EOPPOSITE_FEATURE_BASE - OpenCypherPackage.EXPRESSION__LEFT, null, msgs);
      msgs = basicSetLeft(newLeft, msgs);
      if (msgs != null) msgs.dispatch();
    }
    else if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, OpenCypherPackage.EXPRESSION__LEFT, newLeft, newLeft));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<Expression3Part> getExpression3Parts()
  {
    if (expression3Parts == null)
    {
      expression3Parts = new EObjectContainmentEList<Expression3Part>(Expression3Part.class, this, OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS);
    }
    return expression3Parts;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<NodeLabel> getNodeLabelList()
  {
    if (nodeLabelList == null)
    {
      nodeLabelList = new EObjectContainmentEList<NodeLabel>(NodeLabel.class, this, OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST);
    }
    return nodeLabelList;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<PropertyLookup> getPropertyLookup()
  {
    if (propertyLookup == null)
    {
      propertyLookup = new EObjectContainmentEList<PropertyLookup>(PropertyLookup.class, this, OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP);
    }
    return propertyLookup;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs)
  {
    switch (featureID)
    {
      case OpenCypherPackage.EXPRESSION__LEFT:
        return basicSetLeft(null, msgs);
      case OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS:
        return ((InternalEList<?>)getExpression3Parts()).basicRemove(otherEnd, msgs);
      case OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST:
        return ((InternalEList<?>)getNodeLabelList()).basicRemove(otherEnd, msgs);
      case OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP:
        return ((InternalEList<?>)getPropertyLookup()).basicRemove(otherEnd, msgs);
    }
    return super.eInverseRemove(otherEnd, featureID, msgs);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object eGet(int featureID, boolean resolve, boolean coreType)
  {
    switch (featureID)
    {
      case OpenCypherPackage.EXPRESSION__OPERATOR:
        return getOperator();
      case OpenCypherPackage.EXPRESSION__LEFT:
        return getLeft();
      case OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS:
        return getExpression3Parts();
      case OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST:
        return getNodeLabelList();
      case OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP:
        return getPropertyLookup();
    }
    return super.eGet(featureID, resolve, coreType);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @SuppressWarnings("unchecked")
  @Override
  public void eSet(int featureID, Object newValue)
  {
    switch (featureID)
    {
      case OpenCypherPackage.EXPRESSION__OPERATOR:
        setOperator((String)newValue);
        return;
      case OpenCypherPackage.EXPRESSION__LEFT:
        setLeft((Expression)newValue);
        return;
      case OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS:
        getExpression3Parts().clear();
        getExpression3Parts().addAll((Collection<? extends Expression3Part>)newValue);
        return;
      case OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST:
        getNodeLabelList().clear();
        getNodeLabelList().addAll((Collection<? extends NodeLabel>)newValue);
        return;
      case OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP:
        getPropertyLookup().clear();
        getPropertyLookup().addAll((Collection<? extends PropertyLookup>)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eUnset(int featureID)
  {
    switch (featureID)
    {
      case OpenCypherPackage.EXPRESSION__OPERATOR:
        setOperator(OPERATOR_EDEFAULT);
        return;
      case OpenCypherPackage.EXPRESSION__LEFT:
        setLeft((Expression)null);
        return;
      case OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS:
        getExpression3Parts().clear();
        return;
      case OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST:
        getNodeLabelList().clear();
        return;
      case OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP:
        getPropertyLookup().clear();
        return;
    }
    super.eUnset(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean eIsSet(int featureID)
  {
    switch (featureID)
    {
      case OpenCypherPackage.EXPRESSION__OPERATOR:
        return OPERATOR_EDEFAULT == null ? operator != null : !OPERATOR_EDEFAULT.equals(operator);
      case OpenCypherPackage.EXPRESSION__LEFT:
        return left != null;
      case OpenCypherPackage.EXPRESSION__EXPRESSION3_PARTS:
        return expression3Parts != null && !expression3Parts.isEmpty();
      case OpenCypherPackage.EXPRESSION__NODE_LABEL_LIST:
        return nodeLabelList != null && !nodeLabelList.isEmpty();
      case OpenCypherPackage.EXPRESSION__PROPERTY_LOOKUP:
        return propertyLookup != null && !propertyLookup.isEmpty();
    }
    return super.eIsSet(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String toString()
  {
    if (eIsProxy()) return super.toString();

    StringBuffer result = new StringBuffer(super.toString());
    result.append(" (operator: ");
    result.append(operator);
    result.append(')');
    return result.toString();
  }

} //ExpressionImpl
