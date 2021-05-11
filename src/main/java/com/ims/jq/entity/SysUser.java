
package com.ims.jq.entity;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
    private String id;
    private String companyId;
    private Long orgId;
    private String loginName;
    private String no;
    private String name;
    private String email;
    private String phone;
    private String mobile;
    private String userType;
    private String photo;
    private String loginIp;
    private Date loginDate;
    private String loginFlag;
    private String createBy;
    private Date createDate;
    private String updateBy;
    private Date updateDate;
    private String remarks;
    private String delFlag;
    private Integer sort;
    private String posCode;
    private String token;
    private Float partyCost;
    private Integer gender;
    private Date birthday;
    private String education;
    private String residence;
    private String nation;
    private String isAdminRole;
    private String unitId;
    private String unitName;
    private SysOrgVO unitOrg;
    private String deptId;
    private String deptName;
    private SysOrgVO deptOrg;
    private String teamId;
    private String teamName;
    private SysOrgVO teamOrg;
    private String outUnitId;
    private String outUnitName;
    private SysOrgVO outUnitOrg;
    private PgPos mainPos;
    private String faceImgEncode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getPosCode() {
        return posCode;
    }

    public void setPosCode(String posCode) {
        this.posCode = posCode;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Float getPartyCost() {
        return partyCost;
    }

    public void setPartyCost(Float partyCost) {
        this.partyCost = partyCost;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getResidence() {
        return residence;
    }

    public void setResidence(String residence) {
        this.residence = residence;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getIsAdminRole() {
        return isAdminRole;
    }

    public void setIsAdminRole(String isAdminRole) {
        this.isAdminRole = isAdminRole;
    }

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getOutUnitId() {
        return outUnitId;
    }

    public void setOutUnitId(String outUnitId) {
        this.outUnitId = outUnitId;
    }

    public String getOutUnitName() {
        return outUnitName;
    }

    public void setOutUnitName(String outUnitName) {
        this.outUnitName = outUnitName;
    }

    public String getFaceImgEncode() {
        return faceImgEncode;
    }

    public void setFaceImgEncode(String faceImgEncode) {
        this.faceImgEncode = faceImgEncode;
    }

    public SysOrgVO getUnitOrg() {
        return unitOrg;
    }

    public void setUnitOrg(SysOrgVO unitOrg) {
        this.unitOrg = unitOrg;
    }

    public SysOrgVO getDeptOrg() {
        return deptOrg;
    }

    public void setDeptOrg(SysOrgVO deptOrg) {
        this.deptOrg = deptOrg;
    }

    public SysOrgVO getTeamOrg() {
        return teamOrg;
    }

    public void setTeamOrg(SysOrgVO teamOrg) {
        this.teamOrg = teamOrg;
    }

    public SysOrgVO getOutUnitOrg() {
        return outUnitOrg;
    }

    public void setOutUnitOrg(SysOrgVO outUnitOrg) {
        this.outUnitOrg = outUnitOrg;
    }

    public PgPos getMainPos() {
        return mainPos;
    }

    public void setMainPos(PgPos mainPos) {
        this.mainPos = mainPos;
    }
}
