package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆司机主对象 f_driver_vehicle
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FDriverVehicle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 司机姓名 */
    @Excel(name = "司机姓名")
    private String driverName;

    /** 名 */
    @Excel(name = "名")
    private String firstName;

    /** 姓 */
    @Excel(name = "姓")
    private String lastName;

    /** 国家 */
    @Excel(name = "国家")
    private String country;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 身份证后四位 */
    @Excel(name = "身份证后四位")
    private String idCardLastFour;

    /** 账号（默认联系电话） */
    @Excel(name = "账号", readConverterExp = "默=认联系电话")
    private String account;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 删除状态：0-未删除，1-已删除 */
    @Excel(name = "删除状态：0-未删除，1-已删除")
    private Integer deleted;

    /** 是否自动审核 1自动 0手动 */
    @Excel(name = "是否自动审核 1自动 0手动")
    private Integer isAutoReview;

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
    public void setFirstName(String firstName) 
    {
        this.firstName = firstName;
    }

    public String getFirstName() 
    {
        return firstName;
    }
    public void setLastName(String lastName) 
    {
        this.lastName = lastName;
    }

    public String getLastName() 
    {
        return lastName;
    }
    public void setCountry(String country) 
    {
        this.country = country;
    }

    public String getCountry() 
    {
        return country;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setIdCardLastFour(String idCardLastFour) 
    {
        this.idCardLastFour = idCardLastFour;
    }

    public String getIdCardLastFour() 
    {
        return idCardLastFour;
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
    public void setDeleted(Integer deleted) 
    {
        this.deleted = deleted;
    }

    public Integer getDeleted() 
    {
        return deleted;
    }
    public void setIsAutoReview(Integer isAutoReview) 
    {
        this.isAutoReview = isAutoReview;
    }

    public Integer getIsAutoReview() 
    {
        return isAutoReview;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("driverName", getDriverName())
            .append("firstName", getFirstName())
            .append("lastName", getLastName())
            .append("country", getCountry())
            .append("phone", getPhone())
            .append("idCardLastFour", getIdCardLastFour())
            .append("account", getAccount())
            .append("password", getPassword())
            .append("userId", getUserId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleted", getDeleted())
            .append("isAutoReview", getIsAutoReview())
            .toString();
    }
}
