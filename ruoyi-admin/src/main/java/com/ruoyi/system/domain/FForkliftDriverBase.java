package com.ruoyi.system.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 叉车司机信息对象 f_forklift_driver_base
 *
 * @author ruoyi
 * @date 2026-05-28
 */
public class FForkliftDriverBase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 司机姓名 */
    @Excel(name = "司机姓名")
    private String driverName;

    /** 司机联系电话 */
    @Excel(name = "司机联系电话")
    private String driverPhone;

    /** 状态（0-启用 1-禁用） */
    @Excel(name = "状态", readConverterExp = "0=启用,1=禁用")
    private String driverStatus;

    /** 删除状态：0-未删除，1-已删除 */
    private Integer deleted;

    /** 账号（默认联系电话） */
    private String account;

    /** 密码 */
    private String password;

    /** 用户ID */
    private Long userId;

    /** 作业状态（0-待作业 1-作业中） */
    @Excel(name = "作业状态", readConverterExp = "0=待作业,1=作业中")
    private String workStatus;

    /** 关联叉车ID列表（前端传入） */
    private List<Long> forkliftIds;

    /** 关联叉车编号拼接（列表展示用） */
    private String forkliftCodes;

    /** 关联叉车列表（详情展示用） */
    private List<FForkliftDriver> forkliftList;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setDriverName(String driverName)
    {
        this.driverName = driverName;
    }

    public String getDriverName()
    {
        return driverName;
    }

    public void setDriverPhone(String driverPhone)
    {
        this.driverPhone = driverPhone;
    }

    public String getDriverPhone()
    {
        return driverPhone;
    }

    public void setDriverStatus(String driverStatus)
    {
        this.driverStatus = driverStatus;
    }

    public String getDriverStatus()
    {
        return driverStatus;
    }

    public void setDeleted(Integer deleted)
    {
        this.deleted = deleted;
    }

    public Integer getDeleted()
    {
        return deleted;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public String getAccount()
    {
        return account;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getPassword()
    {
        return password;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    public void setWorkStatus(String workStatus)
    {
        this.workStatus = workStatus;
    }

    public String getWorkStatus()
    {
        return workStatus;
    }

    public List<Long> getForkliftIds()
    {
        return forkliftIds;
    }

    public void setForkliftIds(List<Long> forkliftIds)
    {
        this.forkliftIds = forkliftIds;
    }

    public String getForkliftCodes()
    {
        return forkliftCodes;
    }

    public void setForkliftCodes(String forkliftCodes)
    {
        this.forkliftCodes = forkliftCodes;
    }

    public List<FForkliftDriver> getForkliftList()
    {
        return forkliftList;
    }

    public void setForkliftList(List<FForkliftDriver> forkliftList)
    {
        this.forkliftList = forkliftList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("driverName", getDriverName())
            .append("driverPhone", getDriverPhone())
            .append("driverStatus", getDriverStatus())
            .append("deleted", getDeleted())
            .append("account", getAccount())
            .append("userId", getUserId())
            .append("forkliftIds", getForkliftIds())
            .append("forkliftCodes", getForkliftCodes())
            .toString();
    }
}
