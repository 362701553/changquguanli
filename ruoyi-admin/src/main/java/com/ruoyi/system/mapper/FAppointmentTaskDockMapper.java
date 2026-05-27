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

    /**
     * 获取当天最大装卸任务编码
     *
     * @param datePrefix 日期前缀(如 LT20260527)
     * @return 最大编码
     */
    public String selectMaxLoadingTaskCodeByDate(String datePrefix);

    /**
     * 获取指定码头当前最大排队序号
     *
     * @param dockId 码头ID
     * @return 最大排队序号
     */
    public Long selectMaxQueueNumberByDockId(Long dockId);

    /**
     * 查询指定码头下排队状态为"停车位排队"且排队序号最小的任务
     *
     * @param dockId 码头ID
     * @return 下一个排队的码头任务
     */
    public FAppointmentTaskDock selectNextQueuedDockTask(Long dockId);

    /**
     * 查询指定码头下排队状态为"厂外排队"且排队序号最小的任务
     *
     * @param dockId 码头ID
     * @return 下一个厂外排队的码头任务
     */
    public FAppointmentTaskDock selectNextOutsideQueuedDockTask(Long dockId);

    /**
     * 查询指定码头下所有停车位排队的任务，按排队序号升序
     *
     * @param dockId 码头ID
     * @return 停车位排队任务列表
     */
    public List<FAppointmentTaskDock> selectParkingQueuedList(Long dockId);

    /**
     * 查询指定码头下所有厂外排队的任务，按排队序号升序
     *
     * @param dockId 码头ID
     * @return 厂外排队任务列表
     */
    public List<FAppointmentTaskDock> selectOutsideQueuedList(Long dockId);
}
