package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 预约任务-检查对象 f_appointment_task_check
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FAppointmentTaskCheck extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 删除状态（未删除_0,已删除_1） */
    @Excel(name = "删除状态", readConverterExp = "未=删除_0,已删除_1")
    private Integer deleted;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 修改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    /** 预约任务ID */
    @Excel(name = "预约任务ID")
    private Long taskId;

    /** 预约任务编号 */
    @Excel(name = "预约任务编号")
    private String taskCode;

    /** checklistJson */
    @Excel(name = "checklistJson")
    private String checklistExt;

    /** 文件上传地址 */
    @Excel(name = "文件上传地址")
    private String fileUrl;

    /** cheklist类型（签入checkIn、签出checkOut） */
    @Excel(name = "cheklist类型", readConverterExp = "签=入checkIn、签出checkOut")
    private String checkType;

    /** 出门证编号 */
    @Excel(name = "出门证编号")
    private String outPermitNumber;

    /** 检查人 */
    @Excel(name = "检查人")
    private String checkBy;

    /** 检查时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkTime;

    /** 工厂ID */
    @Excel(name = "工厂ID")
    private Long factoryId;

    /** 厂区ID */
    @Excel(name = "厂区ID")
    private Long areaId;

    /** 是否合格 */
    @Excel(name = "是否合格")
    private String isQualified;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setDeleted(Integer deleted) 
    {
        this.deleted = deleted;
    }

    public Integer getDeleted() 
    {
        return deleted;
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
    public void setChecklistExt(String checklistExt) 
    {
        this.checklistExt = checklistExt;
    }

    public String getChecklistExt() 
    {
        return checklistExt;
    }
    public void setFileUrl(String fileUrl) 
    {
        this.fileUrl = fileUrl;
    }

    public String getFileUrl() 
    {
        return fileUrl;
    }
    public void setCheckType(String checkType) 
    {
        this.checkType = checkType;
    }

    public String getCheckType() 
    {
        return checkType;
    }
    public void setOutPermitNumber(String outPermitNumber) 
    {
        this.outPermitNumber = outPermitNumber;
    }

    public String getOutPermitNumber() 
    {
        return outPermitNumber;
    }
    public void setCheckBy(String checkBy) 
    {
        this.checkBy = checkBy;
    }

    public String getCheckBy() 
    {
        return checkBy;
    }
    public void setCheckTime(Date checkTime) 
    {
        this.checkTime = checkTime;
    }

    public Date getCheckTime() 
    {
        return checkTime;
    }
    public void setFactoryId(Long factoryId) 
    {
        this.factoryId = factoryId;
    }

    public Long getFactoryId() 
    {
        return factoryId;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setIsQualified(String isQualified) 
    {
        this.isQualified = isQualified;
    }

    public String getIsQualified() 
    {
        return isQualified;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deptId", getDeptId())
            .append("deleted", getDeleted())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("taskId", getTaskId())
            .append("taskCode", getTaskCode())
            .append("checklistExt", getChecklistExt())
            .append("fileUrl", getFileUrl())
            .append("remark", getRemark())
            .append("checkType", getCheckType())
            .append("outPermitNumber", getOutPermitNumber())
            .append("checkBy", getCheckBy())
            .append("checkTime", getCheckTime())
            .append("factoryId", getFactoryId())
            .append("areaId", getAreaId())
            .append("isQualified", getIsQualified())
            .toString();
    }
}
