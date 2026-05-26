package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FAppointmentTaskMapper;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.system.service.IFAppointmentTaskService;

/**
 * 预约任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FAppointmentTaskServiceImpl implements IFAppointmentTaskService 
{
    @Autowired
    private FAppointmentTaskMapper fAppointmentTaskMapper;

    /**
     * 查询预约任务
     * 
     * @param id 预约任务主键
     * @return 预约任务
     */
    @Override
    public FAppointmentTask selectFAppointmentTaskById(Long id)
    {
        return fAppointmentTaskMapper.selectFAppointmentTaskById(id);
    }

    /**
     * 查询预约任务列表
     * 
     * @param fAppointmentTask 预约任务
     * @return 预约任务
     */
    @Override
    public List<FAppointmentTask> selectFAppointmentTaskList(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.selectFAppointmentTaskList(fAppointmentTask);
    }

    /**
     * 新增预约任务
     * 
     * @param fAppointmentTask 预约任务
     * @return 结果
     */
    @Override
    public int insertFAppointmentTask(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.insertFAppointmentTask(fAppointmentTask);
    }

    /**
     * 修改预约任务
     * 
     * @param fAppointmentTask 预约任务
     * @return 结果
     */
    @Override
    public int updateFAppointmentTask(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.updateFAppointmentTask(fAppointmentTask);
    }

    /**
     * 批量删除预约任务
     * 
     * @param ids 需要删除的预约任务主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskByIds(Long[] ids)
    {
        return fAppointmentTaskMapper.deleteFAppointmentTaskByIds(ids);
    }

    /**
     * 删除预约任务信息
     * 
     * @param id 预约任务主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskById(Long id)
    {
        return fAppointmentTaskMapper.deleteFAppointmentTaskById(id);
    }
}
