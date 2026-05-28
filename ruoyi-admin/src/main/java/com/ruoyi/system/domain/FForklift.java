package com.ruoyi.system.domain;

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
    @Excel(name = "叉车编号")
    private String forkliftCode;

    /** 叉车名称 */
    @Excel(name = "叉车名称")
    private String forkliftName;

    /** 叉车类型（字典：forklift_type） */
    @Excel(name = "叉车类型")
    private String forkliftType;

    /** 运营状态（0-空闲 1-占用） */
    @Excel(name = "运营状态", readConverterExp = "0=空闲,1=占用")
    private String workStatus;

    /** 删除状态：0-未删除，1-已删除 */
    private Integer deleted;

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

    public void setDeleted(Integer deleted)
    {
        this.deleted = deleted;
    }

    public Integer getDeleted()
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("forkliftCode", getForkliftCode())
            .append("forkliftName", getForkliftName())
            .append("forkliftType", getForkliftType())
            .append("workStatus", getWorkStatus())
            .append("deleted", getDeleted())
            .toString();
    }
}
