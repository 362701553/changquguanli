package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 叉车主对象 f_forklift
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public class FForklift extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 叉车ID */
    private Long id;

    /** 叉车编号（系统生成） */
    @Excel(name = "叉车编号", readConverterExp = "系=统生成")
    private String forkliftCode;

    /** 叉车名称 */
    @Excel(name = "叉车名称")
    private String forkliftName;

    /** 叉车类型（字典：forklift_type） */
    @Excel(name = "叉车类型", readConverterExp = "字=典：forklift_type")
    private String forkliftType;

    /** 运营状态（0-空闲 1-作业中 2-停用） */
    @Excel(name = "运营状态", readConverterExp = "0=-空闲,1=-作业中,2=-停用")
    private String workStatus;

    /** 工厂ID */
    @Excel(name = "工厂ID")
    private Long factoryId;

    /** 工厂名称 */
    @Excel(name = "工厂名称")
    private String factoryName;

    /** 厂区ID */
    @Excel(name = "厂区ID")
    private Long areaId;

    /** 厂区名称 */
    @Excel(name = "厂区名称")
    private String areaName;

    /** 部门ID */
    @Excel(name = "部门ID")
    private Long deptId;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    /** 删除状态：0-未删除，1-已删除 */
    @Excel(name = "删除状态：0-未删除，1-已删除")
    private Integer deleted;

    /** 使用人 */
    @Excel(name = "使用人")
    private String useing;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setForkliftCode(String forkliftCode) 
    {
        this.forkliftCode = forkliftCode;
    }

    public String getForkliftCode() 
    {
        return forkliftCode;
    }
    public void setForkliftName(String forkliftName) 
    {
        this.forkliftName = forkliftName;
    }

    public String getForkliftName() 
    {
        return forkliftName;
    }
    public void setForkliftType(String forkliftType) 
    {
        this.forkliftType = forkliftType;
    }

    public String getForkliftType() 
    {
        return forkliftType;
    }
    public void setWorkStatus(String workStatus) 
    {
        this.workStatus = workStatus;
    }

    public String getWorkStatus() 
    {
        return workStatus;
    }
    public void setFactoryId(Long factoryId) 
    {
        this.factoryId = factoryId;
    }

    public Long getFactoryId() 
    {
        return factoryId;
    }
    public void setFactoryName(String factoryName) 
    {
        this.factoryName = factoryName;
    }

    public String getFactoryName() 
    {
        return factoryName;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setUpdateDate(Date updateDate) 
    {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() 
    {
        return updateDate;
    }
    public void setDeleted(Integer deleted) 
    {
        this.deleted = deleted;
    }

    public Integer getDeleted() 
    {
        return deleted;
    }
    public void setUseing(String useing) 
    {
        this.useing = useing;
    }

    public String getUseing() 
    {
        return useing;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("forkliftCode", getForkliftCode())
            .append("forkliftName", getForkliftName())
            .append("forkliftType", getForkliftType())
            .append("workStatus", getWorkStatus())
            .append("factoryId", getFactoryId())
            .append("factoryName", getFactoryName())
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("deptId", getDeptId())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("deleted", getDeleted())
            .append("useing", getUseing())
            .toString();
    }
}
