package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FAppointmentTaskDock;

/**
 * 预约任务-码头明细Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface FAppointmentTaskDockMapper 
{
    /**
     * 查询预约任务-码头明细
     * 
     * @param id 预约任务-码头明细主键
     * @return 预约任务-码头明细
     */
    public FAppointmentTaskDock selectFAppointmentTaskDockById(Long id);

    /**
     * 查询预约任务-码头明细列表
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 预约任务-码头明细集合
     */
    public List<FAppointmentTaskDock> selectFAppointmentTaskDockList(FAppointmentTaskDock fAppointmentTaskDock);

    /**
     * 新增预约任务-码头明细
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 结果
     */
    public int insertFAppointmentTaskDock(FAppointmentTaskDock fAppointmentTaskDock);

    /**
     * 修改预约任务-码头明细
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 结果
     */
    public int updateFAppointmentTaskDock(FAppointmentTaskDock fAppointmentTaskDock);

    /**
     * 删除预约任务-码头明细
     * 
     * @param id 预约任务-码头明细主键
     * @return 结果
     */
    public int deleteFAppointmentTaskDockById(Long id);

    /**
     * 批量删除预约任务-码头明细
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFAppointmentTaskDockByIds(Long[] ids);
}
