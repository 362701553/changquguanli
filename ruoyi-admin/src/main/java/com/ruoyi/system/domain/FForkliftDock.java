package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 叉车-码头关联对象 f_forklift_dock
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
public class FForkliftDock extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String myRowId;

    /** 叉车ID */
    @Excel(name = "叉车ID")
    private Long forkliftId;

    /** 码头ID */
    @Excel(name = "码头ID")
    private Long dockId;

    /** 码头名称 */
    @Excel(name = "码头名称")
    private String dockName;

    /** 叉车编码 */
    @Excel(name = "叉车编码")
    private String forkliftCode;

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
    public void setForkliftId(Long forkliftId) 
    {
        this.forkliftId = forkliftId;
    }

    public Long getForkliftId() 
    {
        return forkliftId;
    }
    public void setDockId(Long dockId) 
    {
        this.dockId = dockId;
    }

    public Long getDockId() 
    {
        return dockId;
    }
    public void setDockName(String dockName) 
    {
        this.dockName = dockName;
    }

    public String getDockName() 
    {
        return dockName;
    }
    public void setForkliftCode(String forkliftCode) 
    {
        this.forkliftCode = forkliftCode;
    }

    public String getForkliftCode() 
    {
        return forkliftCode;
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
            .append("forkliftId", getForkliftId())
            .append("dockId", getDockId())
            .append("dockName", getDockName())
            .append("forkliftCode", getForkliftCode())
            .append("status", getStatus())
            .toString();
    }
}
