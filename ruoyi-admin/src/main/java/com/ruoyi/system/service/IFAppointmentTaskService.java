package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.common.core.domain.AjaxResult;

/**
 * 预约任务Service接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface IFAppointmentTaskService 
{
    /**
     * 查询预约任务
     * 
     * @param id 预约任务主键
     * @return 预约任务
     */
    public FAppointmentTask selectFAppointmentTaskById(Long id);

    /**
     * 查询预约任务列表
     * 
     * @param fAppointmentTask 预约任务
     * @return 预约任务集合
     */
    public List<FAppointmentTask> selectFAppointmentTaskList(FAppointmentTask fAppointmentTask);

    /**
     * 新增预约任务
     * 
     * @param fAppointmentTask 预约任务
     * @return 结果
     */
    public int insertFAppointmentTask(FAppointmentTask fAppointmentTask);

    /**
     * 修改预约任务
     * 
     * @param fAppointmentTask 预约任务
     * @return 结果
     */
    public int updateFAppointmentTask(FAppointmentTask fAppointmentTask);

    /**
     * 批量删除预约任务
     * 
     * @param ids 需要删除的预约任务主键集合
     * @return 结果
     */
    public int deleteFAppointmentTaskByIds(Long[] ids);

    /**
     * 删除预约任务信息
     *
     * @param id 预约任务主键
     * @return 结果
     */
    public int deleteFAppointmentTaskById(Long id);

    /**
     * 新增预约任务（含码头明细和随行人员）
     *
     * @param fAppointmentTask 预约任务（包含 dockIds 列表和 companions 列表）
     * @return 结果
     */
    public AjaxResult insertFAppointmentTaskWithDocks(FAppointmentTask fAppointmentTask);

    /**
     * 绑定定位设备并签到排队
     *
     * @param taskId 任务ID
     * @param deviceId 定位设备ID
     * @return 结果
     */
    public AjaxResult checkin(Long taskId, Long deviceId);

    /**
     * 开始作业
     *
     * @param dockTaskId 码头任务ID
     * @return 结果
     */
    public AjaxResult startWork(Long dockTaskId);

    /**
     * 点位释放
     *
     * @param dockTaskId 码头任务ID
     * @return 结果
     */
    public AjaxResult releasePoint(Long dockTaskId);

    /**
     * 签出
     *
     * @param taskId 任务ID
     * @return 结果
     */
    public AjaxResult checkout(Long taskId);

    /**
     * 指派叉车司机
     *
     * @param dockTaskId 码头任务ID
     * @param driverId 叉车司机ID
     * @return 结果
     */
    public AjaxResult assignForkliftDriver(Long dockTaskId, Long driverId);

    /**
     * 获取全局排队队列（按优先级排序）
     */
    public List<FAppointmentTask> getGlobalQueueList();

    /**
     * 叫号
     *
     * @param taskId 任务ID
     * @param dockId 分配的码头ID
     * @param dispatcherId 发货员ID
     * @param dispatcherName 发货员名称
     * @return 结果
     */
    public AjaxResult callNumber(Long taskId, Long dockId, Long dispatcherId, String dispatcherName);

    /**
     * 司机确认入厂
     *
     * @param taskId 任务ID
     * @return 结果
     */
    public AjaxResult confirmEntry(Long taskId);

    /**
     * 过号处理
     *
     * @param taskId 任务ID
     * @return 结果
     */
    public AjaxResult missNumber(Long taskId);

    /**
     * 批量处理超时叫号
     */
    public AjaxResult processTimedOutCalls();
}
