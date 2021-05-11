//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.ims.jq.entity;

import java.io.Serializable;
import java.util.Date;

public class SysOrg implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long parentId;

    private String parentIds;

    private String name;

    private Integer sort;

    private String areaId;

    private String code;

    private String orgCode;

    private String status;

    private String businessType;

    private String type;

    private String grade;

    private String address;

    private String zipCode;

    private String master;

    private String phone;

    private String fax;

    private String email;

    private String useable;

    private String primaryPerson;

    private String addr;

    private String lng;

    private String lat;

    private String siteId;

    private String deputyPerson;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private String shortName;

    private String classId;

    private String classId2;

    private String star;

    private String mapName;

    private String isBm;

    private String isMarket;

    private String nativeNo;

    private String isExtOrg;

    public SysOrg() {
    }

    public Long getId() {
        return this.id;
    }

    public Long getParentId() {
        return this.parentId;
    }

    public String getParentIds() {
        return this.parentIds;
    }

    public String getName() {
        return this.name;
    }

    public Integer getSort() {
        return this.sort;
    }

    public String getAreaId() {
        return this.areaId;
    }

    public String getCode() {
        return this.code;
    }

    public String getOrgCode() {
        return this.orgCode;
    }

    public String getStatus() {
        return this.status;
    }

    public String getBusinessType() {
        return this.businessType;
    }

    public String getType() {
        return this.type;
    }

    public String getGrade() {
        return this.grade;
    }

    public String getAddress() {
        return this.address;
    }

    public String getZipCode() {
        return this.zipCode;
    }

    public String getMaster() {
        return this.master;
    }

    public String getPhone() {
        return this.phone;
    }

    public String getFax() {
        return this.fax;
    }

    public String getEmail() {
        return this.email;
    }

    public String getUseable() {
        return this.useable;
    }

    public String getPrimaryPerson() {
        return this.primaryPerson;
    }

    public String getAddr() {
        return this.addr;
    }

    public String getLng() {
        return this.lng;
    }

    public String getLat() {
        return this.lat;
    }

    public String getSiteId() {
        return this.siteId;
    }

    public String getDeputyPerson() {
        return this.deputyPerson;
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

    public String getShortName() {
        return this.shortName;
    }

    public String getClassId() {
        return this.classId;
    }

    public String getClassId2() {
        return this.classId2;
    }

    public String getStar() {
        return this.star;
    }

    public String getMapName() {
        return this.mapName;
    }

    public String getIsBm() {
        return this.isBm;
    }

    public String getIsMarket() {
        return this.isMarket;
    }

    public String getNativeNo() {
        return this.nativeNo;
    }

    public String getIsExtOrg() {
        return this.isExtOrg;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public void setParentId(final Long parentId) {
        this.parentId = parentId;
    }

    public void setParentIds(final String parentIds) {
        this.parentIds = parentIds;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public void setSort(final Integer sort) {
        this.sort = sort;
    }

    public void setAreaId(final String areaId) {
        this.areaId = areaId;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public void setOrgCode(final String orgCode) {
        this.orgCode = orgCode;
    }

    public void setStatus(final String status) {
        this.status = status;
    }

    public void setBusinessType(final String businessType) {
        this.businessType = businessType;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public void setGrade(final String grade) {
        this.grade = grade;
    }

    public void setAddress(final String address) {
        this.address = address;
    }

    public void setZipCode(final String zipCode) {
        this.zipCode = zipCode;
    }

    public void setMaster(final String master) {
        this.master = master;
    }

    public void setPhone(final String phone) {
        this.phone = phone;
    }

    public void setFax(final String fax) {
        this.fax = fax;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public void setUseable(final String useable) {
        this.useable = useable;
    }

    public void setPrimaryPerson(final String primaryPerson) {
        this.primaryPerson = primaryPerson;
    }

    public void setAddr(final String addr) {
        this.addr = addr;
    }

    public void setLng(final String lng) {
        this.lng = lng;
    }

    public void setLat(final String lat) {
        this.lat = lat;
    }

    public void setSiteId(final String siteId) {
        this.siteId = siteId;
    }

    public void setDeputyPerson(final String deputyPerson) {
        this.deputyPerson = deputyPerson;
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

    public void setShortName(final String shortName) {
        this.shortName = shortName;
    }

    public void setClassId(final String classId) {
        this.classId = classId;
    }

    public void setClassId2(final String classId2) {
        this.classId2 = classId2;
    }

    public void setStar(final String star) {
        this.star = star;
    }

    public void setMapName(final String mapName) {
        this.mapName = mapName;
    }

    public void setIsBm(final String isBm) {
        this.isBm = isBm;
    }

    public void setIsMarket(final String isMarket) {
        this.isMarket = isMarket;
    }

    public void setNativeNo(final String nativeNo) {
        this.nativeNo = nativeNo;
    }

    public void setIsExtOrg(final String isExtOrg) {
        this.isExtOrg = isExtOrg;
    }

    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof SysOrg)) {
            return false;
        } else {
            SysOrg other = (SysOrg)o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label491: {
                    Object this$id = this.getId();
                    Object other$id = other.getId();
                    if (this$id == null) {
                        if (other$id == null) {
                            break label491;
                        }
                    } else if (this$id.equals(other$id)) {
                        break label491;
                    }

                    return false;
                }

                Object this$parentId = this.getParentId();
                Object other$parentId = other.getParentId();
                if (this$parentId == null) {
                    if (other$parentId != null) {
                        return false;
                    }
                } else if (!this$parentId.equals(other$parentId)) {
                    return false;
                }

                Object this$parentIds = this.getParentIds();
                Object other$parentIds = other.getParentIds();
                if (this$parentIds == null) {
                    if (other$parentIds != null) {
                        return false;
                    }
                } else if (!this$parentIds.equals(other$parentIds)) {
                    return false;
                }

                label470: {
                    Object this$name = this.getName();
                    Object other$name = other.getName();
                    if (this$name == null) {
                        if (other$name == null) {
                            break label470;
                        }
                    } else if (this$name.equals(other$name)) {
                        break label470;
                    }

                    return false;
                }

                label463: {
                    Object this$sort = this.getSort();
                    Object other$sort = other.getSort();
                    if (this$sort == null) {
                        if (other$sort == null) {
                            break label463;
                        }
                    } else if (this$sort.equals(other$sort)) {
                        break label463;
                    }

                    return false;
                }

                label456: {
                    Object this$areaId = this.getAreaId();
                    Object other$areaId = other.getAreaId();
                    if (this$areaId == null) {
                        if (other$areaId == null) {
                            break label456;
                        }
                    } else if (this$areaId.equals(other$areaId)) {
                        break label456;
                    }

                    return false;
                }

                Object this$code = this.getCode();
                Object other$code = other.getCode();
                if (this$code == null) {
                    if (other$code != null) {
                        return false;
                    }
                } else if (!this$code.equals(other$code)) {
                    return false;
                }

                label442: {
                    Object this$orgCode = this.getOrgCode();
                    Object other$orgCode = other.getOrgCode();
                    if (this$orgCode == null) {
                        if (other$orgCode == null) {
                            break label442;
                        }
                    } else if (this$orgCode.equals(other$orgCode)) {
                        break label442;
                    }

                    return false;
                }

                Object this$status = this.getStatus();
                Object other$status = other.getStatus();
                if (this$status == null) {
                    if (other$status != null) {
                        return false;
                    }
                } else if (!this$status.equals(other$status)) {
                    return false;
                }

                label428: {
                    Object this$businessType = this.getBusinessType();
                    Object other$businessType = other.getBusinessType();
                    if (this$businessType == null) {
                        if (other$businessType == null) {
                            break label428;
                        }
                    } else if (this$businessType.equals(other$businessType)) {
                        break label428;
                    }

                    return false;
                }

                Object this$type = this.getType();
                Object other$type = other.getType();
                if (this$type == null) {
                    if (other$type != null) {
                        return false;
                    }
                } else if (!this$type.equals(other$type)) {
                    return false;
                }

                Object this$grade = this.getGrade();
                Object other$grade = other.getGrade();
                if (this$grade == null) {
                    if (other$grade != null) {
                        return false;
                    }
                } else if (!this$grade.equals(other$grade)) {
                    return false;
                }

                label407: {
                    Object this$address = this.getAddress();
                    Object other$address = other.getAddress();
                    if (this$address == null) {
                        if (other$address == null) {
                            break label407;
                        }
                    } else if (this$address.equals(other$address)) {
                        break label407;
                    }

                    return false;
                }

                label400: {
                    Object this$zipCode = this.getZipCode();
                    Object other$zipCode = other.getZipCode();
                    if (this$zipCode == null) {
                        if (other$zipCode == null) {
                            break label400;
                        }
                    } else if (this$zipCode.equals(other$zipCode)) {
                        break label400;
                    }

                    return false;
                }

                Object this$master = this.getMaster();
                Object other$master = other.getMaster();
                if (this$master == null) {
                    if (other$master != null) {
                        return false;
                    }
                } else if (!this$master.equals(other$master)) {
                    return false;
                }

                Object this$phone = this.getPhone();
                Object other$phone = other.getPhone();
                if (this$phone == null) {
                    if (other$phone != null) {
                        return false;
                    }
                } else if (!this$phone.equals(other$phone)) {
                    return false;
                }

                label379: {
                    Object this$fax = this.getFax();
                    Object other$fax = other.getFax();
                    if (this$fax == null) {
                        if (other$fax == null) {
                            break label379;
                        }
                    } else if (this$fax.equals(other$fax)) {
                        break label379;
                    }

                    return false;
                }

                Object this$email = this.getEmail();
                Object other$email = other.getEmail();
                if (this$email == null) {
                    if (other$email != null) {
                        return false;
                    }
                } else if (!this$email.equals(other$email)) {
                    return false;
                }

                Object this$useable = this.getUseable();
                Object other$useable = other.getUseable();
                if (this$useable == null) {
                    if (other$useable != null) {
                        return false;
                    }
                } else if (!this$useable.equals(other$useable)) {
                    return false;
                }

                label358: {
                    Object this$primaryPerson = this.getPrimaryPerson();
                    Object other$primaryPerson = other.getPrimaryPerson();
                    if (this$primaryPerson == null) {
                        if (other$primaryPerson == null) {
                            break label358;
                        }
                    } else if (this$primaryPerson.equals(other$primaryPerson)) {
                        break label358;
                    }

                    return false;
                }

                label351: {
                    Object this$addr = this.getAddr();
                    Object other$addr = other.getAddr();
                    if (this$addr == null) {
                        if (other$addr == null) {
                            break label351;
                        }
                    } else if (this$addr.equals(other$addr)) {
                        break label351;
                    }

                    return false;
                }

                label344: {
                    Object this$lng = this.getLng();
                    Object other$lng = other.getLng();
                    if (this$lng == null) {
                        if (other$lng == null) {
                            break label344;
                        }
                    } else if (this$lng.equals(other$lng)) {
                        break label344;
                    }

                    return false;
                }

                Object this$lat = this.getLat();
                Object other$lat = other.getLat();
                if (this$lat == null) {
                    if (other$lat != null) {
                        return false;
                    }
                } else if (!this$lat.equals(other$lat)) {
                    return false;
                }

                label330: {
                    Object this$siteId = this.getSiteId();
                    Object other$siteId = other.getSiteId();
                    if (this$siteId == null) {
                        if (other$siteId == null) {
                            break label330;
                        }
                    } else if (this$siteId.equals(other$siteId)) {
                        break label330;
                    }

                    return false;
                }

                Object this$deputyPerson = this.getDeputyPerson();
                Object other$deputyPerson = other.getDeputyPerson();
                if (this$deputyPerson == null) {
                    if (other$deputyPerson != null) {
                        return false;
                    }
                } else if (!this$deputyPerson.equals(other$deputyPerson)) {
                    return false;
                }

                label316: {
                    Object this$createBy = this.getCreateBy();
                    Object other$createBy = other.getCreateBy();
                    if (this$createBy == null) {
                        if (other$createBy == null) {
                            break label316;
                        }
                    } else if (this$createBy.equals(other$createBy)) {
                        break label316;
                    }

                    return false;
                }

                Object this$createDate = this.getCreateDate();
                Object other$createDate = other.getCreateDate();
                if (this$createDate == null) {
                    if (other$createDate != null) {
                        return false;
                    }
                } else if (!this$createDate.equals(other$createDate)) {
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

                label295: {
                    Object this$updateDate = this.getUpdateDate();
                    Object other$updateDate = other.getUpdateDate();
                    if (this$updateDate == null) {
                        if (other$updateDate == null) {
                            break label295;
                        }
                    } else if (this$updateDate.equals(other$updateDate)) {
                        break label295;
                    }

                    return false;
                }

                label288: {
                    Object this$remarks = this.getRemarks();
                    Object other$remarks = other.getRemarks();
                    if (this$remarks == null) {
                        if (other$remarks == null) {
                            break label288;
                        }
                    } else if (this$remarks.equals(other$remarks)) {
                        break label288;
                    }

                    return false;
                }

                Object this$delFlag = this.getDelFlag();
                Object other$delFlag = other.getDelFlag();
                if (this$delFlag == null) {
                    if (other$delFlag != null) {
                        return false;
                    }
                } else if (!this$delFlag.equals(other$delFlag)) {
                    return false;
                }

                Object this$shortName = this.getShortName();
                Object other$shortName = other.getShortName();
                if (this$shortName == null) {
                    if (other$shortName != null) {
                        return false;
                    }
                } else if (!this$shortName.equals(other$shortName)) {
                    return false;
                }

                label267: {
                    Object this$classId = this.getClassId();
                    Object other$classId = other.getClassId();
                    if (this$classId == null) {
                        if (other$classId == null) {
                            break label267;
                        }
                    } else if (this$classId.equals(other$classId)) {
                        break label267;
                    }

                    return false;
                }

                Object this$classId2 = this.getClassId2();
                Object other$classId2 = other.getClassId2();
                if (this$classId2 == null) {
                    if (other$classId2 != null) {
                        return false;
                    }
                } else if (!this$classId2.equals(other$classId2)) {
                    return false;
                }

                Object this$star = this.getStar();
                Object other$star = other.getStar();
                if (this$star == null) {
                    if (other$star != null) {
                        return false;
                    }
                } else if (!this$star.equals(other$star)) {
                    return false;
                }

                label246: {
                    Object this$mapName = this.getMapName();
                    Object other$mapName = other.getMapName();
                    if (this$mapName == null) {
                        if (other$mapName == null) {
                            break label246;
                        }
                    } else if (this$mapName.equals(other$mapName)) {
                        break label246;
                    }

                    return false;
                }

                label239: {
                    Object this$isBm = this.getIsBm();
                    Object other$isBm = other.getIsBm();
                    if (this$isBm == null) {
                        if (other$isBm == null) {
                            break label239;
                        }
                    } else if (this$isBm.equals(other$isBm)) {
                        break label239;
                    }

                    return false;
                }

                label232: {
                    Object this$isMarket = this.getIsMarket();
                    Object other$isMarket = other.getIsMarket();
                    if (this$isMarket == null) {
                        if (other$isMarket == null) {
                            break label232;
                        }
                    } else if (this$isMarket.equals(other$isMarket)) {
                        break label232;
                    }

                    return false;
                }

                Object this$nativeNo = this.getNativeNo();
                Object other$nativeNo = other.getNativeNo();
                if (this$nativeNo == null) {
                    if (other$nativeNo != null) {
                        return false;
                    }
                } else if (!this$nativeNo.equals(other$nativeNo)) {
                    return false;
                }

                Object this$isExtOrg = this.getIsExtOrg();
                Object other$isExtOrg = other.getIsExtOrg();
                if (this$isExtOrg == null) {
                    if (other$isExtOrg != null) {
                        return false;
                    }
                } else if (!this$isExtOrg.equals(other$isExtOrg)) {
                    return false;
                }

                return true;
            }
        }
    }

    protected boolean canEqual(final Object other) {
        return other instanceof SysOrg;
    }

    @Override
    public String toString() {
        return "SysOrg{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", parentIds='" + parentIds + '\'' +
                ", name='" + name + '\'' +
                ", sort=" + sort +
                ", areaId='" + areaId + '\'' +
                ", code='" + code + '\'' +
                ", orgCode='" + orgCode + '\'' +
                ", status='" + status + '\'' +
                ", businessType='" + businessType + '\'' +
                ", type='" + type + '\'' +
                ", grade='" + grade + '\'' +
                ", address='" + address + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", master='" + master + '\'' +
                ", phone='" + phone + '\'' +
                ", fax='" + fax + '\'' +
                ", email='" + email + '\'' +
                ", useable='" + useable + '\'' +
                ", primaryPerson='" + primaryPerson + '\'' +
                ", addr='" + addr + '\'' +
                ", lng='" + lng + '\'' +
                ", lat='" + lat + '\'' +
                ", siteId='" + siteId + '\'' +
                ", deputyPerson='" + deputyPerson + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createDate=" + createDate +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate=" + updateDate +
                ", remarks='" + remarks + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", shortName='" + shortName + '\'' +
                ", classId='" + classId + '\'' +
                ", classId2='" + classId2 + '\'' +
                ", star='" + star + '\'' +
                ", mapName='" + mapName + '\'' +
                ", isBm='" + isBm + '\'' +
                ", isMarket='" + isMarket + '\'' +
                ", nativeNo='" + nativeNo + '\'' +
                ", isExtOrg='" + isExtOrg + '\'' +
                '}';
    }
}
