package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.system.mapper.FAppointmentTaskMapper;
import com.ruoyi.system.mapper.FAppointmentTaskDockMapper;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.system.domain.FAppointmentTaskDock;
import com.ruoyi.system.domain.FDock;
import com.ruoyi.system.service.IFAppointmentTaskService;
import com.ruoyi.system.service.IFDockService;

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

    @Autowired
    private FAppointmentTaskDockMapper fAppointmentTaskDockMapper;

    @Autowired
    private IFDockService fDockService;

    @Override
    public FAppointmentTask selectFAppointmentTaskById(Long id)
    {
        return fAppointmentTaskMapper.selectFAppointmentTaskById(id);
    }

    @Override
    public List<FAppointmentTask> selectFAppointmentTaskList(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.selectFAppointmentTaskList(fAppointmentTask);
    }

    @Override
    public int insertFAppointmentTask(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.insertFAppointmentTask(fAppointmentTask);
    }

    @Override
    public int updateFAppointmentTask(FAppointmentTask fAppointmentTask)
    {
        return fAppointmentTaskMapper.updateFAppointmentTask(fAppointmentTask);
    }

    @Override
    public int deleteFAppointmentTaskByIds(Long[] ids)
    {
        return fAppointmentTaskMapper.deleteFAppointmentTaskByIds(ids);
    }

    @Override
    public int deleteFAppointmentTaskById(Long id)
    {
        return fAppointmentTaskMapper.deleteFAppointmentTaskById(id);
    }

    @Override
    @Transactional
    public int insertFAppointmentTaskWithDocks(FAppointmentTask fAppointmentTask)
    {
        // 1. 生成任务编号 TASK + yyyyMMdd + 4位序号
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String datePrefix = "TASK" + today;
        String maxCode = fAppointmentTaskMapper.selectMaxTaskCodeByDate(datePrefix);
        int seq = 1;
        if (maxCode != null && maxCode.length() > datePrefix.length())
        {
            seq = Integer.parseInt(maxCode.substring(datePrefix.length())) + 1;
        }
        String taskCode = datePrefix + String.format("%04d", seq);
        fAppointmentTask.setTaskCode(taskCode);

        // 2. 设置默认值
        fAppointmentTask.setTaskStatus("0");
        fAppointmentTask.setAppointmentTime(new Date());
        fAppointmentTask.setCreateDate(new Date());

        // 3. 插入主任务
        int rows = fAppointmentTaskMapper.insertFAppointmentTask(fAppointmentTask);

        // 4. 插入码头明细
        if (fAppointmentTask.getDockIds() != null && !fAppointmentTask.getDockIds().isEmpty())
        {
            long sort = 1;
            for (Long dockId : fAppointmentTask.getDockIds())
            {
                FDock dock = fDockService.selectFDockById(dockId);
                FAppointmentTaskDock taskDock = new FAppointmentTaskDock();
                taskDock.setTaskId(fAppointmentTask.getId());
                taskDock.setDockId(dockId);
                if (dock != null)
                {
                    taskDock.setDockName(dock.getDockName());
                    taskDock.setDockCode(dock.getDockCode());
                }
                taskDock.setDockSort(sort++);
                taskDock.setWorkStatus("0");
                taskDock.setCreateDate(new Date());
                fAppointmentTaskDockMapper.insertFAppointmentTaskDock(taskDock);
            }
        }
        return rows;
    }
}
