package com.ruoyi.system.mapper;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 查询指定日期前缀的最大任务编号
     *
     * @param datePrefix 日期前缀（如 TASK20260527）
     * @return 最大任务编号
     */
    public String selectMaxTaskCodeByDate(String datePrefix);

    public List<FAppointmentTask> selectConflictingTask(@Param("outDriverId") Long outDriverId,
                                                        @Param("appointmentStart") Date appointmentStart,
                                                        @Param("appointmentEnd") Date appointmentEnd);

    /**
     * 查询全局排队队列（按优先级排序）
     */
    public List<FAppointmentTask> selectGlobalQueueList();

    /**
     * 查询叫号超时的任务（超过5分钟未确认入厂）
     */
    public List<FAppointmentTask> selectTimedOutCallingTasks();
}
