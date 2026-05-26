package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FAppointmentTaskCheckMapper;
import com.ruoyi.system.domain.FAppointmentTaskCheck;
import com.ruoyi.system.service.IFAppointmentTaskCheckService;

/**
 * 预约任务-检查Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FAppointmentTaskCheckServiceImpl implements IFAppointmentTaskCheckService 
{
    @Autowired
    private FAppointmentTaskCheckMapper fAppointmentTaskCheckMapper;

    /**
     * 查询预约任务-检查
     * 
     * @param id 预约任务-检查主键
     * @return 预约任务-检查
     */
    @Override
    public FAppointmentTaskCheck selectFAppointmentTaskCheckById(Long id)
    {
        return fAppointmentTaskCheckMapper.selectFAppointmentTaskCheckById(id);
    }

    /**
     * 查询预约任务-检查列表
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 预约任务-检查
     */
    @Override
    public List<FAppointmentTaskCheck> selectFAppointmentTaskCheckList(FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        return fAppointmentTaskCheckMapper.selectFAppointmentTaskCheckList(fAppointmentTaskCheck);
    }

    /**
     * 新增预约任务-检查
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 结果
     */
    @Override
    public int insertFAppointmentTaskCheck(FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        return fAppointmentTaskCheckMapper.insertFAppointmentTaskCheck(fAppointmentTaskCheck);
    }

    /**
     * 修改预约任务-检查
     * 
     * @param fAppointmentTaskCheck 预约任务-检查
     * @return 结果
     */
    @Override
    public int updateFAppointmentTaskCheck(FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        return fAppointmentTaskCheckMapper.updateFAppointmentTaskCheck(fAppointmentTaskCheck);
    }

    /**
     * 批量删除预约任务-检查
     * 
     * @param ids 需要删除的预约任务-检查主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskCheckByIds(Long[] ids)
    {
        return fAppointmentTaskCheckMapper.deleteFAppointmentTaskCheckByIds(ids);
    }

    /**
     * 删除预约任务-检查信息
     * 
     * @param id 预约任务-检查主键
     * @return 结果
     */
    @Override
    public int deleteFAppointmentTaskCheckById(Long id)
    {
        return fAppointmentTaskCheckMapper.deleteFAppointmentTaskCheckById(id);
    }
}
