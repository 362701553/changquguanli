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
     * 新增预约任务（含码头明细）
     *
     * @param fAppointmentTask 预约任务（包含 dockIds 列表）
     * @return 结果
     */
    public int insertFAppointmentTaskWithDocks(FAppointmentTask fAppointmentTask);

    /**
     * 签到排队
     *
     * @param taskId 任务ID
     * @return 结果
     */
    public AjaxResult checkin(Long taskId);
}
