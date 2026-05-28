package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 叉车-司机关联对象 f_forklift_driver
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public class FForkliftDriver extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String myRowId;

    /** 叉车司机ID */
    @Excel(name = "叉车司机ID")
    private Long driverId;

    /** 叉车ID */
    @Excel(name = "叉车ID")
    private Long forkliftId;

    /** 叉车编号 */
    @Excel(name = "叉车编号")
    private String forkliftCode;

    /** 叉车司机姓名 */
    @Excel(name = "叉车司机姓名")
    private String driverName;

    /** 状态（启用、禁用） */
    @Excel(name = "状态", readConverterExp = "启=用、禁用")
    private String status;

    public void setMyRowId(String myRowId) 
    {
        this.myRowId = myRowId;
    }

    public String getMyRowId() 
    {
        return myRowId;
    }
    public void setDriverId(Long driverId) 
    {
        this.driverId = driverId;
    }

    public Long getDriverId() 
    {
        return driverId;
    }
    public void setForkliftId(Long forkliftId) 
    {
        this.forkliftId = forkliftId;
    }

    public Long getForkliftId() 
    {
        return forkliftId;
    }
    public void setForkliftCode(String forkliftCode) 
    {
        this.forkliftCode = forkliftCode;
    }

    public String getForkliftCode() 
    {
        return forkliftCode;
    }
    public void setDriverName(String driverName) 
    {
        this.driverName = driverName;
    }

    public String getDriverName() 
    {
        return driverName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("myRowId", getMyRowId())
            .append("driverId", getDriverId())
            .append("forkliftId", getForkliftId())
            .append("forkliftCode", getForkliftCode())
            .append("driverName", getDriverName())
            .append("status", getStatus())
            .toString();
    }
}
