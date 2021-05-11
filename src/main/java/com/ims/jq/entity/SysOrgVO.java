//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.ims.jq.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import java.util.ArrayList;
import java.util.List;

public class SysOrgVO extends SysOrg implements INode {
    private static final long serialVersionUID = 1L;
    @JsonSerialize(
            using = ToStringSerializer.class
    )
    private Long parentId;
    @JsonInclude(Include.NON_EMPTY)
    private List<INode> children;
    @JsonInclude(Include.NON_EMPTY)
    private Boolean hasChildren;
    private String parentName;
    private String baseQuerySql;

    public List<INode> getChildren() {
        if (this.children == null) {
            this.children = new ArrayList();
        }

        return this.children;
    }

    public SysOrgVO() {
    }

    public Long getParentId() {
        return this.parentId;
    }

    public Boolean getHasChildren() {
        return this.hasChildren;
    }

    public String getParentName() {
        return this.parentName;
    }

    public String getBaseQuerySql() {
        return this.baseQuerySql;
    }

    public void setParentId(final Long parentId) {
        this.parentId = parentId;
    }

    public void setChildren(final List<INode> children) {
        this.children = children;
    }

    public void setHasChildren(final Boolean hasChildren) {
        this.hasChildren = hasChildren;
    }

    public void setParentName(final String parentName) {
        this.parentName = parentName;
    }

    public void setBaseQuerySql(final String baseQuerySql) {
        this.baseQuerySql = baseQuerySql;
    }

    public String toString() {
        return "SysOrgVO(parentId=" + this.getParentId() + ", children=" + this.getChildren() + ", hasChildren=" + this.getHasChildren() + ", parentName=" + this.getParentName() + ", baseQuerySql=" + this.getBaseQuerySql() + ")";
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof SysOrgVO)) {
            return false;
        } else {
            SysOrgVO other = (SysOrgVO) o;
            if (!other.canEqual(this)) {
                return false;
            } else if (!super.equals(o)) {
                return false;
            } else {
                label73:
                {
                    Object this$parentId = this.getParentId();
                    Object other$parentId = other.getParentId();
                    if (this$parentId == null) {
                        if (other$parentId == null) {
                            break label73;
                        }
                    } else if (this$parentId.equals(other$parentId)) {
                        break label73;
                    }

                    return false;
                }

                Object this$children = this.getChildren();
                Object other$children = other.getChildren();
                if (this$children == null) {
                    if (other$children != null) {
                        return false;
                    }
                } else if (!this$children.equals(other$children)) {
                    return false;
                }

                label59:
                {
                    Object this$hasChildren = this.getHasChildren();
                    Object other$hasChildren = other.getHasChildren();
                    if (this$hasChildren == null) {
                        if (other$hasChildren == null) {
                            break label59;
                        }
                    } else if (this$hasChildren.equals(other$hasChildren)) {
                        break label59;
                    }

                    return false;
                }

                Object this$parentName = this.getParentName();
                Object other$parentName = other.getParentName();
                if (this$parentName == null) {
                    if (other$parentName != null) {
                        return false;
                    }
                } else if (!this$parentName.equals(other$parentName)) {
                    return false;
                }

                Object this$baseQuerySql = this.getBaseQuerySql();
                Object other$baseQuerySql = other.getBaseQuerySql();
                if (this$baseQuerySql == null) {
                    if (other$baseQuerySql != null) {
                        return false;
                    }
                } else if (!this$baseQuerySql.equals(other$baseQuerySql)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof SysOrgVO;
    }

}
