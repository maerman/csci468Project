/*
 * Copyright (c) 2010, Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software
 * except in compliance with the terms of the license at:
 * http://developer.sun.com/berkeley_license.html
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author tgiunipero
 */
@Embeddable
public class OrderedProductPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "customer_order_id")
    private int customerOrderId;
    @Basic(optional = false)
    @Column(name = "product_id")
    private int productId;

    public OrderedProductPK() {
    }

    public OrderedProductPK(int customerOrderId, int productId) {
        this.customerOrderId = customerOrderId;
        this.productId = productId;
    }

    public int getCustomerOrderId() {
        return customerOrderId;
    }

    public void setCustomerOrderId(int customerOrderId) {
        this.customerOrderId = customerOrderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) customerOrderId;
        hash += (int) productId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderedProductPK)) {
            return false;
        }
        OrderedProductPK other = (OrderedProductPK) object;
        if (this.customerOrderId != other.customerOrderId) {
            return false;
        }
        if (this.productId != other.productId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderedProductPK[customerOrderId=" + customerOrderId + ", productId=" + productId + "]";
    }

}