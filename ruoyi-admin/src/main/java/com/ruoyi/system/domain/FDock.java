package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 码头主对象 f_dock
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FDock extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 码头编号 */
    @Excel(name = "码头编号")
    private String dockCode;

    /** 码头名称 */
    @Excel(name = "码头名称")
    private String dockName;

    /** 厂区ID */
    @Excel(name = "厂区ID")
    private Long areaId;

    /** 厂区名称 */
    @Excel(name = "厂区名称")
    private String areaName;

    /** 叉车每托货卸货时长（分钟） */
    @Excel(name = "叉车每托货卸货时长", readConverterExp = "分=钟")
    private BigDecimal unloadingDuration;

    /** 叉车每托货装货时长（分钟） */
    @Excel(name = "叉车每托货装货时长", readConverterExp = "分=钟")
    private BigDecimal loadingDuration;

    /** 码头工作日设置（1-7表示周一到周日，逗号分隔） */
    @Excel(name = "码头工作日设置", readConverterExp = "1=-7表示周一到周日，逗号分隔")
    private String workDays;

    /** 码头坐标（经纬度） */
    @Excel(name = "码头坐标", readConverterExp = "经=纬度")
    private String coordinate;

    /** 工厂ID */
    @Excel(name = "工厂ID")
    private Long factoryId;

    /** 工厂名称 */
    @Excel(name = "工厂名称")
    private String factoryName;

    /** 部门ID */
    @Excel(name = "部门ID")
    private Long deptId;

    /** 本身对应部门id */
    @Excel(name = "本身对应部门id")
    private Long itselfDeptId;

    /** 状态：1-启用，0-禁用 */
    @Excel(name = "状态：1-启用，0-禁用")
    private Integer status;

    /** 排序号 */
    @Excel(name = "排序号")
    private Long sortOrder;

    /** 装卸点统计 */
    @Excel(name = "装卸点统计")
    private Long loadingPointCount;

    /** 停车点统计 */
    @Excel(name = "停车点统计")
    private Long parkingSpaceCount;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

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

    /** 上级部门id */
    @Excel(name = "上级部门id")
    private Long parentId;

    /** 是否需要叉车工作 1需要 0不需要 */
    @Excel(name = "是否需要叉车工作 1需要 0不需要")
    private Integer forkliftWork;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDockCode(String dockCode) 
    {
        this.dockCode = dockCode;
    }

    public String getDockCode() 
    {
        return dockCode;
    }
    public void setDockName(String dockName) 
    {
        this.dockName = dockName;
    }

    public String getDockName() 
    {
        return dockName;
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
    public void setUnloadingDuration(BigDecimal unloadingDuration) 
    {
        this.unloadingDuration = unloadingDuration;
    }

    public BigDecimal getUnloadingDuration() 
    {
        return unloadingDuration;
    }
    public void setLoadingDuration(BigDecimal loadingDuration) 
    {
        this.loadingDuration = loadingDuration;
    }

    public BigDecimal getLoadingDuration() 
    {
        return loadingDuration;
    }
    public void setWorkDays(String workDays) 
    {
        this.workDays = workDays;
    }

    public String getWorkDays() 
    {
        return workDays;
    }
    public void setCoordinate(String coordinate) 
    {
        this.coordinate = coordinate;
    }

    public String getCoordinate() 
    {
        return coordinate;
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
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setItselfDeptId(Long itselfDeptId) 
    {
        this.itselfDeptId = itselfDeptId;
    }

    public Long getItselfDeptId() 
    {
        return itselfDeptId;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setSortOrder(Long sortOrder) 
    {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder() 
    {
        return sortOrder;
    }
    public void setLoadingPointCount(Long loadingPointCount) 
    {
        this.loadingPointCount = loadingPointCount;
    }

    public Long getLoadingPointCount() 
    {
        return loadingPointCount;
    }
    public void setParkingSpaceCount(Long parkingSpaceCount) 
    {
        this.parkingSpaceCount = parkingSpaceCount;
    }

    public Long getParkingSpaceCount() 
    {
        return parkingSpaceCount;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
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
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setForkliftWork(Integer forkliftWork) 
    {
        this.forkliftWork = forkliftWork;
    }

    public Integer getForkliftWork() 
    {
        return forkliftWork;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("dockCode", getDockCode())
            .append("dockName", getDockName())
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("unloadingDuration", getUnloadingDuration())
            .append("loadingDuration", getLoadingDuration())
            .append("workDays", getWorkDays())
            .append("coordinate", getCoordinate())
            .append("factoryId", getFactoryId())
            .append("factoryName", getFactoryName())
            .append("deptId", getDeptId())
            .append("itselfDeptId", getItselfDeptId())
            .append("status", getStatus())
            .append("sortOrder", getSortOrder())
            .append("loadingPointCount", getLoadingPointCount())
            .append("parkingSpaceCount", getParkingSpaceCount())
            .append("description", getDescription())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("deleted", getDeleted())
            .append("parentId", getParentId())
            .append("forkliftWork", getForkliftWork())
            .toString();
    }
}
