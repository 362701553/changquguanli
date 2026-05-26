package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FAppointmentTaskCheck;

/**
 * 预约任务-检查Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface FAppointmentTaskCheckMapper 
{
    /**
     * 查询预约任务-检查
     * 
     * @param id 预约任务-检查主键
     * @return 预约任务-检查
     */
    public FAppointmentTaskCheck selectFAppointmentTaskCheckById(Long id);

    /**
     * 查询预约任务-检查列表
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 预约任务-检查集合
     */
    public List<FAppointmentTaskCheck> selectFAppointmentTaskCheckList(FAppointmentTaskCheck fAppointmentTaskCheck);

    /**
     * 新增预约任务-检查
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 结果
     */
    public int insertFAppointmentTaskCheck(FAppointmentTaskCheck fAppointmentTaskCheck);

    /**
     * 修改预约任务-检查
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 结果
     */
    public int updateFAppointmentTaskCheck(FAppointmentTaskCheck fAppointmentTaskCheck);

    /**
     * 删除预约任务-检查
     * 
     * @param id 预约任务-检查主键
     * @return 结果
     */
    public int deleteFAppointmentTaskCheckById(Long id);

    /**
     * 批量删除预约任务-检查
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFAppointmentTaskCheckByIds(Long[] ids);
}
