package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 码头等待停车位明细对象 f_dock_parking_space
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FDockParkingSpace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 码头ID */
    @Excel(name = "码头ID")
    private Long dockId;

    /** 码头编号 */
    @Excel(name = "码头编号")
    private String dockCode;

    /** 码头名称 */
    @Excel(name = "码头名称")
    private String dockName;

    /** 车位编号 */
    @Excel(name = "车位编号")
    private String parkingSpaceCode;

    /** 适用车型（多选，逗号分隔） */
    @Excel(name = "适用车型", readConverterExp = "多=选，逗号分隔")
    private String vehicleTypes;

    /** 状态：1-启用，0-禁用 */
    @Excel(name = "状态：1-启用，0-禁用")
    private Integer status;

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

    /** 是否占用（0-否，1-是） */
    @Excel(name = "是否占用", readConverterExp = "0=-否，1-是")
    private String isOccupy;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDockId(Long dockId) 
    {
        this.dockId = dockId;
    }

    public Long getDockId() 
    {
        return dockId;
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
    public void setParkingSpaceCode(String parkingSpaceCode) 
    {
        this.parkingSpaceCode = parkingSpaceCode;
    }

    public String getParkingSpaceCode() 
    {
        return parkingSpaceCode;
    }
    public void setVehicleTypes(String vehicleTypes) 
    {
        this.vehicleTypes = vehicleTypes;
    }

    public String getVehicleTypes() 
    {
        return vehicleTypes;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
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
    public void setIsOccupy(String isOccupy) 
    {
        this.isOccupy = isOccupy;
    }

    public String getIsOccupy() 
    {
        return isOccupy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("dockId", getDockId())
            .append("dockCode", getDockCode())
            .append("dockName", getDockName())
            .append("parkingSpaceCode", getParkingSpaceCode())
            .append("vehicleTypes", getVehicleTypes())
            .append("status", getStatus())
            .append("factoryId", getFactoryId())
            .append("factoryName", getFactoryName())
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("deptId", getDeptId())
            .append("description", getDescription())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("deleted", getDeleted())
            .append("isOccupy", getIsOccupy())
            .toString();
    }
}
