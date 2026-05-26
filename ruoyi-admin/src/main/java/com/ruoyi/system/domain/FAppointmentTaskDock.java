package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 预约任务-码头明细对象 f_appointment_task_dock
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FAppointmentTaskDock extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 主表id */
    @Excel(name = "主表id")
    private Long taskId;

    /** 行号 */
    @Excel(name = "行号")
    private Long lineNo;

    /** 预约码头ID */
    @Excel(name = "预约码头ID")
    private Long dockId;

    /** 预约码头名称 */
    @Excel(name = "预约码头名称")
    private String dockName;

    /** 预约码头编码 */
    @Excel(name = "预约码头编码")
    private String dockCode;

    /** 码头预约开始 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "码头预约开始", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dockStart;

    /** 码头预约结束 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "码头预约结束", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dockEnd;

    /** 装卸点ID */
    @Excel(name = "装卸点ID")
    private Long loadingPointId;

    /** 装卸点编号 */
    @Excel(name = "装卸点编号")
    private String loadingPointCode;

    /** 装卸点名称 */
    @Excel(name = "装卸点名称")
    private String loadingPointName;

    /** 叉车司机ID(主要) */
    @Excel(name = "叉车司机ID(主要)")
    private Long forkliftDriverId;

    /** 叉车司机姓名 */
    @Excel(name = "叉车司机姓名")
    private String forkliftDriverName;

    /** 叉车编号 */
    @Excel(name = "叉车编号")
    private String forkliftNo;

    /** 叉车其他人员 */
    @Excel(name = "叉车其他人员")
    private String forkliftExtra;

    /** 装卸托数 */
    @Excel(name = "装卸托数")
    private Long loadingQty;

    /** 装卸开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "装卸开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loadingStart;

    /** 装卸完成时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "装卸完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loadingFinish;

    /** 装卸点释放时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "装卸点释放时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date pointReleaseTime;

    /** 到达码头时间(撞栏) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "到达码头时间(撞栏)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date arriveTime;

    /** 驶离码头时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "驶离码头时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date leaveTime;

    /** 作业状态 */
    @Excel(name = "作业状态")
    private String workStatus;

    /** 所属公司ID */
    @Excel(name = "所属公司ID")
    private Long factoryId;

    /** 所属公司名称 */
    @Excel(name = "所属公司名称")
    private String factoryName;

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

    /** 时间明细ID */
    @Excel(name = "时间明细ID")
    private Long planTimeDetailId;

    /** 排队序号 */
    @Excel(name = "排队序号")
    private Long queueNumber;

    /** 预计等待时间 */
    @Excel(name = "预计等待时间")
    private BigDecimal expectWaitTime;

    /** 排队状态（厂外排队、停车位排队、装卸点排队、已完成） */
    @Excel(name = "排队状态", readConverterExp = "厂=外排队、停车位排队、装卸点排队、已完成")
    private String queueStatus;

    /** 是否作业完成插队 */
    @Excel(name = "是否作业完成插队")
    private String isWorkedJump;

    /** 码头顺序 */
    @Excel(name = "码头顺序")
    private Long dockSort;

    /** 停车位ID */
    @Excel(name = "停车位ID")
    private Long parkingId;

    /** 车型 */
    @Excel(name = "车型")
    private String carModel;

    /** 停车位编码 */
    @Excel(name = "停车位编码")
    private String parkingCode;

    /** 装卸任务编码 */
    @Excel(name = "装卸任务编码")
    private String loadingTaskCode;

    /** 装卸类型 */
    @Excel(name = "装卸类型")
    private String loadingType;

    /** 厂区ID */
    @Excel(name = "厂区ID")
    private Long factoryAreaId;

    /** 厂区名称 */
    @Excel(name = "厂区名称")
    private String factoryAreaName;

    /** 厂区部门ID */
    @Excel(name = "厂区部门ID")
    private Long areaDeptId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }
    public void setLineNo(Long lineNo) 
    {
        this.lineNo = lineNo;
    }

    public Long getLineNo() 
    {
        return lineNo;
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
    public void setDockCode(String dockCode) 
    {
        this.dockCode = dockCode;
    }

    public String getDockCode() 
    {
        return dockCode;
    }
    public void setDockStart(Date dockStart) 
    {
        this.dockStart = dockStart;
    }

    public Date getDockStart() 
    {
        return dockStart;
    }
    public void setDockEnd(Date dockEnd) 
    {
        this.dockEnd = dockEnd;
    }

    public Date getDockEnd() 
    {
        return dockEnd;
    }
    public void setLoadingPointId(Long loadingPointId) 
    {
        this.loadingPointId = loadingPointId;
    }

    public Long getLoadingPointId() 
    {
        return loadingPointId;
    }
    public void setLoadingPointCode(String loadingPointCode) 
    {
        this.loadingPointCode = loadingPointCode;
    }

    public String getLoadingPointCode() 
    {
        return loadingPointCode;
    }
    public void setLoadingPointName(String loadingPointName) 
    {
        this.loadingPointName = loadingPointName;
    }

    public String getLoadingPointName() 
    {
        return loadingPointName;
    }
    public void setForkliftDriverId(Long forkliftDriverId) 
    {
        this.forkliftDriverId = forkliftDriverId;
    }

    public Long getForkliftDriverId() 
    {
        return forkliftDriverId;
    }
    public void setForkliftDriverName(String forkliftDriverName) 
    {
        this.forkliftDriverName = forkliftDriverName;
    }

    public String getForkliftDriverName() 
    {
        return forkliftDriverName;
    }
    public void setForkliftNo(String forkliftNo) 
    {
        this.forkliftNo = forkliftNo;
    }

    public String getForkliftNo() 
    {
        return forkliftNo;
    }
    public void setForkliftExtra(String forkliftExtra) 
    {
        this.forkliftExtra = forkliftExtra;
    }

    public String getForkliftExtra() 
    {
        return forkliftExtra;
    }
    public void setLoadingQty(Long loadingQty) 
    {
        this.loadingQty = loadingQty;
    }

    public Long getLoadingQty() 
    {
        return loadingQty;
    }
    public void setLoadingStart(Date loadingStart) 
    {
        this.loadingStart = loadingStart;
    }

    public Date getLoadingStart() 
    {
        return loadingStart;
    }
    public void setLoadingFinish(Date loadingFinish) 
    {
        this.loadingFinish = loadingFinish;
    }

    public Date getLoadingFinish() 
    {
        return loadingFinish;
    }
    public void setPointReleaseTime(Date pointReleaseTime) 
    {
        this.pointReleaseTime = pointReleaseTime;
    }

    public Date getPointReleaseTime() 
    {
        return pointReleaseTime;
    }
    public void setArriveTime(Date arriveTime) 
    {
        this.arriveTime = arriveTime;
    }

    public Date getArriveTime() 
    {
        return arriveTime;
    }
    public void setLeaveTime(Date leaveTime) 
    {
        this.leaveTime = leaveTime;
    }

    public Date getLeaveTime() 
    {
        return leaveTime;
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
    public void setPlanTimeDetailId(Long planTimeDetailId) 
    {
        this.planTimeDetailId = planTimeDetailId;
    }

    public Long getPlanTimeDetailId() 
    {
        return planTimeDetailId;
    }
    public void setQueueNumber(Long queueNumber) 
    {
        this.queueNumber = queueNumber;
    }

    public Long getQueueNumber() 
    {
        return queueNumber;
    }
    public void setExpectWaitTime(BigDecimal expectWaitTime) 
    {
        this.expectWaitTime = expectWaitTime;
    }

    public BigDecimal getExpectWaitTime() 
    {
        return expectWaitTime;
    }
    public void setQueueStatus(String queueStatus) 
    {
        this.queueStatus = queueStatus;
    }

    public String getQueueStatus() 
    {
        return queueStatus;
    }
    public void setIsWorkedJump(String isWorkedJump) 
    {
        this.isWorkedJump = isWorkedJump;
    }

    public String getIsWorkedJump() 
    {
        return isWorkedJump;
    }
    public void setDockSort(Long dockSort) 
    {
        this.dockSort = dockSort;
    }

    public Long getDockSort() 
    {
        return dockSort;
    }
    public void setParkingId(Long parkingId) 
    {
        this.parkingId = parkingId;
    }

    public Long getParkingId() 
    {
        return parkingId;
    }
    public void setCarModel(String carModel) 
    {
        this.carModel = carModel;
    }

    public String getCarModel() 
    {
        return carModel;
    }
    public void setParkingCode(String parkingCode) 
    {
        this.parkingCode = parkingCode;
    }

    public String getParkingCode() 
    {
        return parkingCode;
    }
    public void setLoadingTaskCode(String loadingTaskCode) 
    {
        this.loadingTaskCode = loadingTaskCode;
    }

    public String getLoadingTaskCode() 
    {
        return loadingTaskCode;
    }
    public void setLoadingType(String loadingType) 
    {
        this.loadingType = loadingType;
    }

    public String getLoadingType() 
    {
        return loadingType;
    }
    public void setFactoryAreaId(Long factoryAreaId) 
    {
        this.factoryAreaId = factoryAreaId;
    }

    public Long getFactoryAreaId() 
    {
        return factoryAreaId;
    }
    public void setFactoryAreaName(String factoryAreaName) 
    {
        this.factoryAreaName = factoryAreaName;
    }

    public String getFactoryAreaName() 
    {
        return factoryAreaName;
    }
    public void setAreaDeptId(Long areaDeptId) 
    {
        this.areaDeptId = areaDeptId;
    }

    public Long getAreaDeptId() 
    {
        return areaDeptId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("taskId", getTaskId())
            .append("lineNo", getLineNo())
            .append("dockId", getDockId())
            .append("dockName", getDockName())
            .append("dockCode", getDockCode())
            .append("dockStart", getDockStart())
            .append("dockEnd", getDockEnd())
            .append("loadingPointId", getLoadingPointId())
            .append("loadingPointCode", getLoadingPointCode())
            .append("loadingPointName", getLoadingPointName())
            .append("forkliftDriverId", getForkliftDriverId())
            .append("forkliftDriverName", getForkliftDriverName())
            .append("forkliftNo", getForkliftNo())
            .append("forkliftExtra", getForkliftExtra())
            .append("loadingQty", getLoadingQty())
            .append("loadingStart", getLoadingStart())
            .append("loadingFinish", getLoadingFinish())
            .append("pointReleaseTime", getPointReleaseTime())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("workStatus", getWorkStatus())
            .append("factoryId", getFactoryId())
            .append("factoryName", getFactoryName())
            .append("deptId", getDeptId())
            .append("deleted", getDeleted())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("planTimeDetailId", getPlanTimeDetailId())
            .append("queueNumber", getQueueNumber())
            .append("expectWaitTime", getExpectWaitTime())
            .append("queueStatus", getQueueStatus())
            .append("isWorkedJump", getIsWorkedJump())
            .append("dockSort", getDockSort())
            .append("parkingId", getParkingId())
            .append("carModel", getCarModel())
            .append("parkingCode", getParkingCode())
            .append("loadingTaskCode", getLoadingTaskCode())
            .append("loadingType", getLoadingType())
            .append("factoryAreaId", getFactoryAreaId())
            .append("factoryAreaName", getFactoryAreaName())
            .append("areaDeptId", getAreaDeptId())
            .toString();
    }
}
