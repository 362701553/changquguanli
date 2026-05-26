package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FAppointmentTask;

/**
 * 预约任务Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface FAppointmentTaskMapper 
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
     * 删除预约任务
     * 
     * @param id 预约任务主键
     * @return 结果
     */
    public int deleteFAppointmentTaskById(Long id);

    /**
     * 批量删除预约任务
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFAppointmentTaskByIds(Long[] ids);
}
