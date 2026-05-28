package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 预约任务对象 f_appointment_task
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public class FAppointmentTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

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

    /** 预约任务编号 */
    @Excel(name = "预约任务编号")
    private String taskCode;

    /** 预约厂区 */
    @Excel(name = "预约厂区")
    private Long factoryAreaId;

    /** 预约厂区名称 */
    @Excel(name = "预约厂区名称")
    private String factoryAreaName;

    /** 业务大类编号 */
    @Excel(name = "业务大类编号")
    private String categoryMainCode;

    /** 业务子类编号 */
    @Excel(name = "业务子类编号")
    private String categorySubCode;

    /** 业务大类名称 */
    @Excel(name = "业务大类名称")
    private String categoryName;

    /** 业务子类名称 */
    @Excel(name = "业务子类名称")
    private String categorySubName;

    /** 业务对接人ID */
    @Excel(name = "业务对接人ID")
    private String businessLiaisonById;

    /** 业务对接人名称 */
    @Excel(name = "业务对接人名称")
    private String businessLiaisonByRel;

    /** 业务对接人 */
    @Excel(name = "业务对接人")
    private String businessLiaisonBy;

    /** 服务商ID */
    @Excel(name = "服务商ID")
    private Long serviceProviderId;

    /** 服务商名称 */
    @Excel(name = "服务商名称")
    private String serviceProviderName;

    /** 车辆ID */
    @Excel(name = "车辆ID")
    private Long carId;

    /** 车牌号 */
    @Excel(name = "车牌号")
    private String carNo;

    /** 运输托数 */
    @Excel(name = "运输托数")
    private BigDecimal transportPallets;

    /** 外来车辆司机ID */
    @Excel(name = "外来车辆司机ID")
    private Long outDriverId;

    /** 外来车辆司机姓名 */
    @Excel(name = "外来车辆司机姓名")
    private String outDriverName;

    /** 外来车辆司机电话 */
    @Excel(name = "外来车辆司机电话")
    private String outDriverPhone;

    /** 任务状态 */
    @Excel(name = "任务状态")
    private String taskStatus;

    /** 预计排队等待时间 */
    @Excel(name = "预计排队等待时间")
    private BigDecimal expectWaitTime;

    /** 签到大门ID */
    @Excel(name = "签到大门ID")
    private Long checkinGateId;

    /** 签到大门名称 */
    @Excel(name = "签到大门名称")
    private String checkinGateName;

    /** 计划签入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划签入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planCheckinTime;

    /** 实际签入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际签入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date actualCheckinTime;

    /** 计划签出时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "计划签出时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date planCheckoutTime;

    /** 实际签出时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际签出时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date actualCheckoutTime;

    /** 签出大门ID */
    @Excel(name = "签出大门ID")
    private Long checkoutGateId;

    /** 签出大门名称 */
    @Excel(name = "签出大门名称")
    private String checkoutGateName;

    /** 预约时段开始 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预约时段开始", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date appointmentStart;

    /** 预约时段结束 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "预约时段结束", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date appointmentEnd;

    /** 预约提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预约提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date appointmentTime;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private String auditStatus;

    /** 审核人 */
    @Excel(name = "审核人")
    private String auditor;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date auditTime;

    /** 驳回原因 */
    @Excel(name = "驳回原因")
    private String auditRejectReason;

    /** 是否允许插队 */
    @Excel(name = "是否允许插队")
    private String allowJump;

    /** 插队原因 */
    @Excel(name = "插队原因")
    private String jumpReason;

    /** 插队操作人 */
    @Excel(name = "插队操作人")
    private String jumpOperator;

    /** 插队操作时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "插队操作时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date jumpTime;

    /** 出门证编号 */
    @Excel(name = "出门证编号")
    private String exitNo;

    /** 预约大门ID */
    @Excel(name = "预约大门ID")
    private Long gateId;

    /** 预约大门名称 */
    @Excel(name = "预约大门名称")
    private String gateName;

    /** 预计到厂时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计到厂时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expectDriverArriveTime;

    /** 定位设备ID */
    @Excel(name = "定位设备ID")
    private Long deviceId;

    /** 设备序列号 */
    @Excel(name = "设备序列号")
    private String deviceSn;

    /** 绑定状态 */
    @Excel(name = "绑定状态")
    private String bindDeviceStatus;

    /** 起始点 */
    @Excel(name = "起始点")
    private String startPoint;

    /** 目的地 */
    @Excel(name = "目的地")
    private String destinationPoint;

    /** 时间明细ID */
    @Excel(name = "时间明细ID")
    private Long planTimeDetailId;

    /** 当前排队码头ID */
    @Excel(name = "当前排队码头ID")
    private Long currentDockId;

    /** 当前排队码头名称 */
    @Excel(name = "当前排队码头名称")
    private String currentDockName;

    /** 绑定时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "绑定时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bindTime;

    /** 是否应急（0否 1是） */
    @Excel(name = "是否应急", readConverterExp = "0=否,1=是")
    private String isEmergency;

    /** 是否强制结束 */
    @Excel(name = "是否强制结束")
    private String isForceStop;

    /** 审核备注 */
    @Excel(name = "审核备注")
    private String reviewNotes;

    /** 选中的码头ID列表（非持久化，仅用于新增传参） */
    private List<Long> dockIds;

    /** 随行人员列表（非持久化，仅用于新增传参） */
    private List<FAppointmentTaskCompanion> companions;

    public List<Long> getDockIds() {
        return dockIds;
    }

    public void setDockIds(List<Long> dockIds) {
        this.dockIds = dockIds;
    }

    public List<FAppointmentTaskCompanion> getCompanions() {
        return companions;
    }

    public void setCompanions(List<FAppointmentTaskCompanion> companions) {
        this.companions = companions;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setTaskCode(String taskCode) 
    {
        this.taskCode = taskCode;
    }

    public String getTaskCode() 
    {
        return taskCode;
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
    public void setCategoryMainCode(String categoryMainCode) 
    {
        this.categoryMainCode = categoryMainCode;
    }

    public String getCategoryMainCode() 
    {
        return categoryMainCode;
    }
    public void setCategorySubCode(String categorySubCode) 
    {
        this.categorySubCode = categorySubCode;
    }

    public String getCategorySubCode() 
    {
        return categorySubCode;
    }
    public void setCategoryName(String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }
    public void setCategorySubName(String categorySubName) 
    {
        this.categorySubName = categorySubName;
    }

    public String getCategorySubName() 
    {
        return categorySubName;
    }
    public void setBusinessLiaisonById(String businessLiaisonById) 
    {
        this.businessLiaisonById = businessLiaisonById;
    }

    public String getBusinessLiaisonById() 
    {
        return businessLiaisonById;
    }
    public void setBusinessLiaisonByRel(String businessLiaisonByRel) 
    {
        this.businessLiaisonByRel = businessLiaisonByRel;
    }

    public String getBusinessLiaisonByRel() 
    {
        return businessLiaisonByRel;
    }
    public void setBusinessLiaisonBy(String businessLiaisonBy) 
    {
        this.businessLiaisonBy = businessLiaisonBy;
    }

    public String getBusinessLiaisonBy() 
    {
        return businessLiaisonBy;
    }
    public void setServiceProviderId(Long serviceProviderId) 
    {
        this.serviceProviderId = serviceProviderId;
    }

    public Long getServiceProviderId() 
    {
        return serviceProviderId;
    }
    public void setServiceProviderName(String serviceProviderName) 
    {
        this.serviceProviderName = serviceProviderName;
    }

    public String getServiceProviderName() 
    {
        return serviceProviderName;
    }
    public void setCarId(Long carId) 
    {
        this.carId = carId;
    }

    public Long getCarId() 
    {
        return carId;
    }
    public void setCarNo(String carNo) 
    {
        this.carNo = carNo;
    }

    public String getCarNo() 
    {
        return carNo;
    }
    public void setTransportPallets(BigDecimal transportPallets) 
    {
        this.transportPallets = transportPallets;
    }

    public BigDecimal getTransportPallets() 
    {
        return transportPallets;
    }
    public void setOutDriverId(Long outDriverId) 
    {
        this.outDriverId = outDriverId;
    }

    public Long getOutDriverId() 
    {
        return outDriverId;
    }
    public void setOutDriverName(String outDriverName) 
    {
        this.outDriverName = outDriverName;
    }

    public String getOutDriverName() 
    {
        return outDriverName;
    }
    public void setOutDriverPhone(String outDriverPhone) 
    {
        this.outDriverPhone = outDriverPhone;
    }

    public String getOutDriverPhone() 
    {
        return outDriverPhone;
    }
    public void setTaskStatus(String taskStatus) 
    {
        this.taskStatus = taskStatus;
    }

    public String getTaskStatus() 
    {
        return taskStatus;
    }
    public void setExpectWaitTime(BigDecimal expectWaitTime) 
    {
        this.expectWaitTime = expectWaitTime;
    }

    public BigDecimal getExpectWaitTime() 
    {
        return expectWaitTime;
    }
    public void setCheckinGateId(Long checkinGateId) 
    {
        this.checkinGateId = checkinGateId;
    }

    public Long getCheckinGateId() 
    {
        return checkinGateId;
    }
    public void setCheckinGateName(String checkinGateName) 
    {
        this.checkinGateName = checkinGateName;
    }

    public String getCheckinGateName() 
    {
        return checkinGateName;
    }
    public void setPlanCheckinTime(Date planCheckinTime) 
    {
        this.planCheckinTime = planCheckinTime;
    }

    public Date getPlanCheckinTime() 
    {
        return planCheckinTime;
    }
    public void setActualCheckinTime(Date actualCheckinTime) 
    {
        this.actualCheckinTime = actualCheckinTime;
    }

    public Date getActualCheckinTime() 
    {
        return actualCheckinTime;
    }
    public void setPlanCheckoutTime(Date planCheckoutTime) 
    {
        this.planCheckoutTime = planCheckoutTime;
    }

    public Date getPlanCheckoutTime() 
    {
        return planCheckoutTime;
    }
    public void setActualCheckoutTime(Date actualCheckoutTime) 
    {
        this.actualCheckoutTime = actualCheckoutTime;
    }

    public Date getActualCheckoutTime() 
    {
        return actualCheckoutTime;
    }
    public void setCheckoutGateId(Long checkoutGateId) 
    {
        this.checkoutGateId = checkoutGateId;
    }

    public Long getCheckoutGateId() 
    {
        return checkoutGateId;
    }
    public void setCheckoutGateName(String checkoutGateName) 
    {
        this.checkoutGateName = checkoutGateName;
    }

    public String getCheckoutGateName() 
    {
        return checkoutGateName;
    }
    public void setAppointmentStart(Date appointmentStart) 
    {
        this.appointmentStart = appointmentStart;
    }

    public Date getAppointmentStart() 
    {
        return appointmentStart;
    }
    public void setAppointmentEnd(Date appointmentEnd) 
    {
        this.appointmentEnd = appointmentEnd;
    }

    public Date getAppointmentEnd() 
    {
        return appointmentEnd;
    }
    public void setAppointmentTime(Date appointmentTime) 
    {
        this.appointmentTime = appointmentTime;
    }

    public Date getAppointmentTime() 
    {
        return appointmentTime;
    }
    public void setAuditStatus(String auditStatus) 
    {
        this.auditStatus = auditStatus;
    }

    public String getAuditStatus() 
    {
        return auditStatus;
    }
    public void setAuditor(String auditor) 
    {
        this.auditor = auditor;
    }

    public String getAuditor() 
    {
        return auditor;
    }
    public void setAuditTime(Date auditTime) 
    {
        this.auditTime = auditTime;
    }

    public Date getAuditTime() 
    {
        return auditTime;
    }
    public void setAuditRejectReason(String auditRejectReason) 
    {
        this.auditRejectReason = auditRejectReason;
    }

    public String getAuditRejectReason() 
    {
        return auditRejectReason;
    }
    public void setAllowJump(String allowJump) 
    {
        this.allowJump = allowJump;
    }

    public String getAllowJump() 
    {
        return allowJump;
    }
    public void setJumpReason(String jumpReason) 
    {
        this.jumpReason = jumpReason;
    }

    public String getJumpReason() 
    {
        return jumpReason;
    }
    public void setJumpOperator(String jumpOperator) 
    {
        this.jumpOperator = jumpOperator;
    }

    public String getJumpOperator() 
    {
        return jumpOperator;
    }
    public void setJumpTime(Date jumpTime) 
    {
        this.jumpTime = jumpTime;
    }

    public Date getJumpTime() 
    {
        return jumpTime;
    }
    public void setExitNo(String exitNo) 
    {
        this.exitNo = exitNo;
    }

    public String getExitNo() 
    {
        return exitNo;
    }
    public void setGateId(Long gateId) 
    {
        this.gateId = gateId;
    }

    public Long getGateId() 
    {
        return gateId;
    }
    public void setGateName(String gateName) 
    {
        this.gateName = gateName;
    }

    public String getGateName() 
    {
        return gateName;
    }
    public void setExpectDriverArriveTime(Date expectDriverArriveTime) 
    {
        this.expectDriverArriveTime = expectDriverArriveTime;
    }

    public Date getExpectDriverArriveTime() 
    {
        return expectDriverArriveTime;
    }
    public void setDeviceId(Long deviceId) 
    {
        this.deviceId = deviceId;
    }

    public Long getDeviceId() 
    {
        return deviceId;
    }
    public void setDeviceSn(String deviceSn) 
    {
        this.deviceSn = deviceSn;
    }

    public String getDeviceSn() 
    {
        return deviceSn;
    }
    public void setBindDeviceStatus(String bindDeviceStatus) 
    {
        this.bindDeviceStatus = bindDeviceStatus;
    }

    public String getBindDeviceStatus() 
    {
        return bindDeviceStatus;
    }
    public void setStartPoint(String startPoint) 
    {
        this.startPoint = startPoint;
    }

    public String getStartPoint() 
    {
        return startPoint;
    }
    public void setDestinationPoint(String destinationPoint) 
    {
        this.destinationPoint = destinationPoint;
    }

    public String getDestinationPoint() 
    {
        return destinationPoint;
    }
    public void setPlanTimeDetailId(Long planTimeDetailId) 
    {
        this.planTimeDetailId = planTimeDetailId;
    }

    public Long getPlanTimeDetailId() 
    {
        return planTimeDetailId;
    }
    public void setCurrentDockId(Long currentDockId) 
    {
        this.currentDockId = currentDockId;
    }

    public Long getCurrentDockId() 
    {
        return currentDockId;
    }
    public void setCurrentDockName(String currentDockName) 
    {
        this.currentDockName = currentDockName;
    }

    public String getCurrentDockName() 
    {
        return currentDockName;
    }
    public void setBindTime(Date bindTime) 
    {
        this.bindTime = bindTime;
    }

    public Date getBindTime() 
    {
        return bindTime;
    }
    public void setIsEmergency(String isEmergency) 
    {
        this.isEmergency = isEmergency;
    }

    public String getIsEmergency() 
    {
        return isEmergency;
    }
    public void setIsForceStop(String isForceStop) 
    {
        this.isForceStop = isForceStop;
    }

    public String getIsForceStop() 
    {
        return isForceStop;
    }
    public void setReviewNotes(String reviewNotes) 
    {
        this.reviewNotes = reviewNotes;
    }

    public String getReviewNotes() 
    {
        return reviewNotes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("factoryId", getFactoryId())
            .append("factoryName", getFactoryName())
            .append("deptId", getDeptId())
            .append("deleted", getDeleted())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateDate())
            .append("taskCode", getTaskCode())
            .append("factoryAreaId", getFactoryAreaId())
            .append("factoryAreaName", getFactoryAreaName())
            .append("categoryMainCode", getCategoryMainCode())
            .append("categorySubCode", getCategorySubCode())
            .append("categoryName", getCategoryName())
            .append("categorySubName", getCategorySubName())
            .append("businessLiaisonById", getBusinessLiaisonById())
            .append("businessLiaisonByRel", getBusinessLiaisonByRel())
            .append("businessLiaisonBy", getBusinessLiaisonBy())
            .append("serviceProviderId", getServiceProviderId())
            .append("serviceProviderName", getServiceProviderName())
            .append("carId", getCarId())
            .append("carNo", getCarNo())
            .append("transportPallets", getTransportPallets())
            .append("outDriverId", getOutDriverId())
            .append("outDriverName", getOutDriverName())
            .append("outDriverPhone", getOutDriverPhone())
            .append("taskStatus", getTaskStatus())
            .append("expectWaitTime", getExpectWaitTime())
            .append("checkinGateId", getCheckinGateId())
            .append("checkinGateName", getCheckinGateName())
            .append("planCheckinTime", getPlanCheckinTime())
            .append("actualCheckinTime", getActualCheckinTime())
            .append("planCheckoutTime", getPlanCheckoutTime())
            .append("actualCheckoutTime", getActualCheckoutTime())
            .append("checkoutGateId", getCheckoutGateId())
            .append("checkoutGateName", getCheckoutGateName())
            .append("appointmentStart", getAppointmentStart())
            .append("appointmentEnd", getAppointmentEnd())
            .append("appointmentTime", getAppointmentTime())
            .append("auditStatus", getAuditStatus())
            .append("auditor", getAuditor())
            .append("auditTime", getAuditTime())
            .append("auditRejectReason", getAuditRejectReason())
            .append("allowJump", getAllowJump())
            .append("jumpReason", getJumpReason())
            .append("jumpOperator", getJumpOperator())
            .append("jumpTime", getJumpTime())
            .append("exitNo", getExitNo())
            .append("gateId", getGateId())
            .append("gateName", getGateName())
            .append("expectDriverArriveTime", getExpectDriverArriveTime())
            .append("deviceId", getDeviceId())
            .append("deviceSn", getDeviceSn())
            .append("bindDeviceStatus", getBindDeviceStatus())
            .append("startPoint", getStartPoint())
            .append("destinationPoint", getDestinationPoint())
            .append("planTimeDetailId", getPlanTimeDetailId())
            .append("currentDockId", getCurrentDockId())
            .append("currentDockName", getCurrentDockName())
            .append("bindTime", getBindTime())
            .append("isEmergency", getIsEmergency())
            .append("isForceStop", getIsForceStop())
            .append("remark", getRemark())
            .append("reviewNotes", getReviewNotes())
            .toString();
    }
}
