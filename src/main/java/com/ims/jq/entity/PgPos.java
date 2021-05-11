//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.ims.jq.entity;
import java.io.Serializable;
import java.util.Date;


public class PgPos implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;

    private String name;

    private Long seqNo;

    private String code;

    private Long orgId;

    private String orgName;

    private Long specId;

    private String specName;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private Long companyId;

    private Long deptId;

    public PgPos() {
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public Long getSeqNo() {
        return this.seqNo;
    }

    public String getCode() {
        return this.code;
    }

    public Long getOrgId() {
        return this.orgId;
    }

    public String getOrgName() {
        return this.orgName;
    }

    public Long getSpecId() {
        return this.specId;
    }

    public String getSpecName() {
        return this.specName;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public String getRemarks() {
        return this.remarks;
    }

    public String getDelFlag() {
        return this.delFlag;
    }

    public Long getCompanyId() {
        return this.companyId;
    }

    public Long getDeptId() {
        return this.deptId;
    }

    public void setId(final String id) {
        this.id = id;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public void setSeqNo(final Long seqNo) {
        this.seqNo = seqNo;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public void setOrgId(final Long orgId) {
        this.orgId = orgId;
    }

    public void setOrgName(final String orgName) {
        this.orgName = orgName;
    }

    public void setSpecId(final Long specId) {
        this.specId = specId;
    }

    public void setSpecName(final String specName) {
        this.specName = specName;
    }

    public void setCreateBy(final String createBy) {
        this.createBy = createBy;
    }

    public void setCreateDate(final Date createDate) {
        this.createDate = createDate;
    }

    public void setUpdateBy(final String updateBy) {
        this.updateBy = updateBy;
    }

    public void setUpdateDate(final Date updateDate) {
        this.updateDate = updateDate;
    }

    public void setRemarks(final String remarks) {
        this.remarks = remarks;
    }

    public void setDelFlag(final String delFlag) {
        this.delFlag = delFlag;
    }

    public void setCompanyId(final Long companyId) {
        this.companyId = companyId;
    }

    public void setDeptId(final Long deptId) {
        this.deptId = deptId;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof PgPos)) {
            return false;
        } else {
            PgPos other = (PgPos) o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label203:
                {
                    Object this$id = this.getId();
                    Object other$id = other.getId();
                    if (this$id == null) {
                        if (other$id == null) {
                            break label203;
                        }
                    } else if (this$id.equals(other$id)) {
                        break label203;
                    }

                    return false;
                }

                Object this$name = this.getName();
                Object other$name = other.getName();
                if (this$name == null) {
                    if (other$name != null) {
                        return false;
                    }
                } else if (!this$name.equals(other$name)) {
                    return false;
                }

                Object this$seqNo = this.getSeqNo();
                Object other$seqNo = other.getSeqNo();
                if (this$seqNo == null) {
                    if (other$seqNo != null) {
                        return false;
                    }
                } else if (!this$seqNo.equals(other$seqNo)) {
                    return false;
                }

                label182:
                {
                    Object this$code = this.getCode();
                    Object other$code = other.getCode();
                    if (this$code == null) {
                        if (other$code == null) {
                            break label182;
                        }
                    } else if (this$code.equals(other$code)) {
                        break label182;
                    }

                    return false;
                }

                label175:
                {
                    Object this$orgId = this.getOrgId();
                    Object other$orgId = other.getOrgId();
                    if (this$orgId == null) {
                        if (other$orgId == null) {
                            break label175;
                        }
                    } else if (this$orgId.equals(other$orgId)) {
                        break label175;
                    }

                    return false;
                }

                label168:
                {
                    Object this$orgName = this.getOrgName();
                    Object other$orgName = other.getOrgName();
                    if (this$orgName == null) {
                        if (other$orgName == null) {
                            break label168;
                        }
                    } else if (this$orgName.equals(other$orgName)) {
                        break label168;
                    }

                    return false;
                }

                Object this$specId = this.getSpecId();
                Object other$specId = other.getSpecId();
                if (this$specId == null) {
                    if (other$specId != null) {
                        return false;
                    }
                } else if (!this$specId.equals(other$specId)) {
                    return false;
                }

                label154:
                {
                    Object this$specName = this.getSpecName();
                    Object other$specName = other.getSpecName();
                    if (this$specName == null) {
                        if (other$specName == null) {
                            break label154;
                        }
                    } else if (this$specName.equals(other$specName)) {
                        break label154;
                    }

                    return false;
                }

                Object this$createBy = this.getCreateBy();
                Object other$createBy = other.getCreateBy();
                if (this$createBy == null) {
                    if (other$createBy != null) {
                        return false;
                    }
                } else if (!this$createBy.equals(other$createBy)) {
                    return false;
                }

                label140:
                {
                    Object this$createDate = this.getCreateDate();
                    Object other$createDate = other.getCreateDate();
                    if (this$createDate == null) {
                        if (other$createDate == null) {
                            break label140;
                        }
                    } else if (this$createDate.equals(other$createDate)) {
                        break label140;
                    }

                    return false;
                }

                Object this$updateBy = this.getUpdateBy();
                Object other$updateBy = other.getUpdateBy();
                if (this$updateBy == null) {
                    if (other$updateBy != null) {
                        return false;
                    }
                } else if (!this$updateBy.equals(other$updateBy)) {
                    return false;
                }

                Object this$updateDate = this.getUpdateDate();
                Object other$updateDate = other.getUpdateDate();
                if (this$updateDate == null) {
                    if (other$updateDate != null) {
                        return false;
                    }
                } else if (!this$updateDate.equals(other$updateDate)) {
                    return false;
                }

                label119:
                {
                    Object this$remarks = this.getRemarks();
                    Object other$remarks = other.getRemarks();
                    if (this$remarks == null) {
                        if (other$remarks == null) {
                            break label119;
                        }
                    } else if (this$remarks.equals(other$remarks)) {
                        break label119;
                    }

                    return false;
                }

                label112:
                {
                    Object this$delFlag = this.getDelFlag();
                    Object other$delFlag = other.getDelFlag();
                    if (this$delFlag == null) {
                        if (other$delFlag == null) {
                            break label112;
                        }
                    } else if (this$delFlag.equals(other$delFlag)) {
                        break label112;
                    }

                    return false;
                }

                Object this$companyId = this.getCompanyId();
                Object other$companyId = other.getCompanyId();
                if (this$companyId == null) {
                    if (other$companyId != null) {
                        return false;
                    }
                } else if (!this$companyId.equals(other$companyId)) {
                    return false;
                }

                Object this$deptId = this.getDeptId();
                Object other$deptId = other.getDeptId();
                if (this$deptId == null) {
                    if (other$deptId != null) {
                        return false;
                    }
                } else if (!this$deptId.equals(other$deptId)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof PgPos;
    }

    public String toString() {
        return "PgPos(id=" + this.getId() + ", name=" + this.getName() + ", seqNo=" + this.getSeqNo() + ", code=" + this.getCode() + ", orgId=" + this.getOrgId() + ", orgName=" + this.getOrgName() + ", specId=" + this.getSpecId() + ", specName=" + this.getSpecName() + ", createBy=" + this.getCreateBy() + ", createDate=" + this.getCreateDate() + ", updateBy=" + this.getUpdateBy() + ", updateDate=" + this.getUpdateDate() + ", remarks=" + this.getRemarks() + ", delFlag=" + this.getDelFlag() + ", companyId=" + this.getCompanyId() + ", deptId=" + this.getDeptId() + ")";
    }
}
