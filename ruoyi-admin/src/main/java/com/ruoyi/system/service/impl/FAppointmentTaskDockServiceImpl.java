package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FAppointmentTaskDockMapper;
import com.ruoyi.system.domain.FAppointmentTaskDock;
import com.ruoyi.system.service.IFAppointmentTaskDockService;

/**
 * 预约任务-码头明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FAppointmentTaskDockServiceImpl implements IFAppointmentTaskDockService 
{
    @Autowired
    private FAppointmentTaskDockMapper fAppointmentTaskDockMapper;

    /**
     * 查询预约任务-码头明细
     * 
     * @param id 预约任务-码头明细主键
     * @return 预约任务-码头明细
     */
    @Override
    public FAppointmentTaskDock selectFAppointmentTaskDockById(Long id)
    {
        return fAppointmentTaskDockMapper.selectFAppointmentTaskDockById(id);
    }

    /**
     * 查询预约任务-码头明细列表
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 预约任务-码头明细
     */
    @Override
    public List<FAppointmentTaskDock> selectFAppointmentTaskDockList(FAppointmentTaskDock fAppointmentTaskDock)
    {
        return fAppointmentTaskDockMapper.selectFAppointmentTaskDockList(fAppointmentTaskDock);
    }

    /**
     * 新增预约任务-码头明细
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 结果
     */
    @Override
    public int insertFAppointmentTaskDock(FAppointmentTaskDock fAppointmentTaskDock)
    {
        return fAppointmentTaskDockMapper.insertFAppointmentTaskDock(fAppointmentTaskDock);
    }

    /**
     * 修改预约任务-码头明细
     * 
     * @param fAppointmentTaskDock 预约任务-码头明细
     * @return 结果
     */
    @Override
    public int updateFAppointmentTaskDock(FAppointmentTaskDock fAppointmentTaskDock)
    {
        return fAppointmentTaskDockMapper.updateFAppointmentTaskDock(fAppointmentTaskDock);
    }

    /**
     * 批量删除预约任务-码头明细
     * 
     * @param ids 需要删除的预约任务-码头明细主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskDockByIds(Long[] ids)
    {
        return fAppointmentTaskDockMapper.deleteFAppointmentTaskDockByIds(ids);
    }

    /**
     * 删除预约任务-码头明细信息
     * 
     * @param id 预约任务-码头明细主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskDockById(Long id)
    {
        return fAppointmentTaskDockMapper.deleteFAppointmentTaskDockById(id);
    }
}
