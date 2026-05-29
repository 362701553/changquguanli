package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 定位设备管理对象 f_location_device
 * 
 * @author ruoyi
 * @date 2026-05-29
 */
public class FLocationDevice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 设备序列号（唯一） */
    @Excel(name = "设备序列号", readConverterExp = "唯=一")
    private String deviceSn;

    /** RFID标签号 */
    @Excel(name = "RFID标签号")
    private String rfidTag;

    /** 设备使用状态：idle-空闲中，using-使用中，scrapped-已报废 */
    @Excel(name = "设备使用状态：idle-空闲中，using-使用中，scrapped-已报废")
    private String deviceStatus;

    /** 状态：1-启用，0-禁用 */
    @Excel(name = "状态：1-启用，0-禁用")
    private Integer status;

    /** 报废原因 */
    @Excel(name = "报废原因")
    private String scrapReason;

    /** RFID绑定状态：unbound-未绑定，bound-已绑定 */
    @Excel(name = "RFID绑定状态：unbound-未绑定，bound-已绑定")
    private String rfidBindStatus;

    /** 设备类别ID */
    @Excel(name = "设备类别ID")
    private Long deviceCategoryId;

    /** 设备类别 */
    @Excel(name = "设备类别")
    private String deviceCategory;

    /** 设备电量（0-100） */
    @Excel(name = "设备电量", readConverterExp = "0=-100")
    private Long batteryLevel;

    /** 频率 */
    @Excel(name = "频率")
    private Long frequency;

    /** 电量状态：normal-正常，low-低电量，critical-严重低电 */
    @Excel(name = "电量状态：normal-正常，low-低电量，critical-严重低电")
    private String batteryStatus;

    /** 最后电量更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后电量更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastBatteryUpdate;

    /** 产品序列号 */
    @Excel(name = "产品序列号")
    private String productSn;

    /** 产品型号 */
    @Excel(name = "产品型号")
    private String productModel;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    /** 所在区域 */
    @Excel(name = "所在区域")
    private String areaLocation;

    /** 所在库位 */
    @Excel(name = "所在库位")
    private String storageLocation;

    /** 所属部门ID */
    @Excel(name = "所属部门ID")
    private Long deptId;

    /** 所属部门名称 */
    @Excel(name = "所属部门名称")
    private String deptName;

    /** 公司id（工厂） */
    @Excel(name = "公司id", readConverterExp = "工=厂")
    private String factoryId;

    /** 公司代码（工厂） */
    @Excel(name = "公司代码", readConverterExp = "工=厂")
    private String factoryCode;

    /** 公司名称（工厂名称） */
    @Excel(name = "公司名称", readConverterExp = "工=厂名称")
    private String factoryName;

    /** 厂区ID */
    @Excel(name = "厂区ID")
    private Long areaId;

    /** 厂区名称 */
    @Excel(name = "厂区名称")
    private String areaName;

    /** 备注1 */
    @Excel(name = "备注1")
    private String remark1;

    /** 备注2 */
    @Excel(name = "备注2")
    private String remark2;

    /** 备注3 */
    @Excel(name = "备注3")
    private String remark3;

    /** 删除状态：0-未删除，1-已删除 */
    @Excel(name = "删除状态：0-未删除，1-已删除")
    private Integer deleted;

    /** 当前被哪个预约任务id占用 */
    @Excel(name = "当前被哪个预约任务id占用")
    private Long taskId;

    /** 任务编码 */
    @Excel(name = "任务编码")
    private String taskCode;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDeviceSn(String deviceSn) 
    {
        this.deviceSn = deviceSn;
    }

    public String getDeviceSn() 
    {
        return deviceSn;
    }
    public void setRfidTag(String rfidTag) 
    {
        this.rfidTag = rfidTag;
    }

    public String getRfidTag() 
    {
        return rfidTag;
    }
    public void setDeviceStatus(String deviceStatus) 
    {
        this.deviceStatus = deviceStatus;
    }

    public String getDeviceStatus() 
    {
        return deviceStatus;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setScrapReason(String scrapReason) 
    {
        this.scrapReason = scrapReason;
    }

    public String getScrapReason() 
    {
        return scrapReason;
    }
    public void setRfidBindStatus(String rfidBindStatus) 
    {
        this.rfidBindStatus = rfidBindStatus;
    }

    public String getRfidBindStatus() 
    {
        return rfidBindStatus;
    }
    public void setDeviceCategoryId(Long deviceCategoryId) 
    {
        this.deviceCategoryId = deviceCategoryId;
    }

    public Long getDeviceCategoryId() 
    {
        return deviceCategoryId;
    }
    public void setDeviceCategory(String deviceCategory) 
    {
        this.deviceCategory = deviceCategory;
    }

    public String getDeviceCategory() 
    {
        return deviceCategory;
    }
    public void setBatteryLevel(Long batteryLevel) 
    {
        this.batteryLevel = batteryLevel;
    }

    public Long getBatteryLevel() 
    {
        return batteryLevel;
    }
    public void setFrequency(Long frequency) 
    {
        this.frequency = frequency;
    }

    public Long getFrequency() 
    {
        return frequency;
    }
    public void setBatteryStatus(String batteryStatus) 
    {
        this.batteryStatus = batteryStatus;
    }

    public String getBatteryStatus() 
    {
        return batteryStatus;
    }
    public void setLastBatteryUpdate(Date lastBatteryUpdate) 
    {
        this.lastBatteryUpdate = lastBatteryUpdate;
    }

    public Date getLastBatteryUpdate() 
    {
        return lastBatteryUpdate;
    }
    public void setProductSn(String productSn) 
    {
        this.productSn = productSn;
    }

    public String getProductSn() 
    {
        return productSn;
    }
    public void setProductModel(String productModel) 
    {
        this.productModel = productModel;
    }

    public String getProductModel() 
    {
        return productModel;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setAreaLocation(String areaLocation) 
    {
        this.areaLocation = areaLocation;
    }

    public String getAreaLocation() 
    {
        return areaLocation;
    }
    public void setStorageLocation(String storageLocation) 
    {
        this.storageLocation = storageLocation;
    }

    public String getStorageLocation() 
    {
        return storageLocation;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setFactoryId(String factoryId) 
    {
        this.factoryId = factoryId;
    }

    public String getFactoryId() 
    {
        return factoryId;
    }
    public void setFactoryCode(String factoryCode) 
    {
        this.factoryCode = factoryCode;
    }

    public String getFactoryCode() 
    {
        return factoryCode;
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
    public void setRemark1(String remark1) 
    {
        this.remark1 = remark1;
    }

    public String getRemark1() 
    {
        return remark1;
    }
    public void setRemark2(String remark2) 
    {
        this.remark2 = remark2;
    }

    public String getRemark2() 
    {
        return remark2;
    }
    public void setRemark3(String remark3) 
    {
        this.remark3 = remark3;
    }

    public String getRemark3() 
    {
        return remark3;
    }
    public void setDeleted(Integer deleted) 
    {
        this.deleted = deleted;
    }

    public Integer getDeleted() 
    {
        return deleted;
    }
    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }
    public void setTaskCode(String taskCode) 
    {
        this.taskCode = taskCode;
    }

    public String getTaskCode() 
    {
        return taskCode;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deviceSn", getDeviceSn())
            .append("rfidTag", getRfidTag())
            .append("deviceStatus", getDeviceStatus())
            .append("status", getStatus())
            .append("scrapReason", getScrapReason())
            .append("rfidBindStatus", getRfidBindStatus())
            .append("deviceCategoryId", getDeviceCategoryId())
            .append("deviceCategory", getDeviceCategory())
            .append("batteryLevel", getBatteryLevel())
            .append("frequency", getFrequency())
            .append("batteryStatus", getBatteryStatus())
            .append("lastBatteryUpdate", getLastBatteryUpdate())
            .append("productSn", getProductSn())
            .append("productModel", getProductModel())
            .append("productName", getProductName())
            .append("areaLocation", getAreaLocation())
            .append("storageLocation", getStorageLocation())
            .append("deptId", getDeptId())
            .append("deptName", getDeptName())
            .append("factoryId", getFactoryId())
            .append("factoryCode", getFactoryCode())
            .append("factoryName", getFactoryName())
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("remark1", getRemark1())
            .append("remark2", getRemark2())
            .append("remark3", getRemark3())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .append("taskId", getTaskId())
            .append("taskCode", getTaskCode())
            .toString();
    }
}
