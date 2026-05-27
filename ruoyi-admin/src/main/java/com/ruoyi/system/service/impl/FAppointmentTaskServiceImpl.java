package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.mapper.FAppointmentTaskMapper;
import com.ruoyi.system.mapper.FAppointmentTaskDockMapper;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.system.domain.FAppointmentTaskDock;
import com.ruoyi.system.domain.FDock;
import com.ruoyi.system.domain.FDockLoadingPoint;
import com.ruoyi.system.domain.FDockParkingSpace;
import com.ruoyi.system.service.IFAppointmentTaskService;
import com.ruoyi.system.service.IFDockService;
import com.ruoyi.system.service.IFDockLoadingPointService;
import com.ruoyi.system.service.IFDockParkingSpaceService;

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

    @Autowired
    private IFDockLoadingPointService fDockLoadingPointService;

    @Autowired
    private IFDockParkingSpaceService fDockParkingSpaceService;

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

    @Override
    @Transactional
    public AjaxResult checkin(Long taskId)
    {
        // 1. 查询主任务，校验状态
        FAppointmentTask task = fAppointmentTaskMapper.selectFAppointmentTaskById(taskId);
        if (task == null)
        {
            return AjaxResult.error("任务不存在");
        }
        if (!"0".equals(task.getTaskStatus()))
        {
            return AjaxResult.error("只有待签到状态的任务才能签到");
        }

        // 2. 查询该任务的码头明细列表，按dockSort排序，取第一个未赋值loadingTaskCode的
        FAppointmentTaskDock queryDock = new FAppointmentTaskDock();
        queryDock.setTaskId(taskId);
        List<FAppointmentTaskDock> dockList = fAppointmentTaskDockMapper.selectFAppointmentTaskDockList(queryDock);
        List<FAppointmentTaskDock> sortedList = dockList.stream()
                .sorted((a, b) -> {
                    Long sortA = a.getDockSort() != null ? a.getDockSort() : 0L;
                    Long sortB = b.getDockSort() != null ? b.getDockSort() : 0L;
                    return sortA.compareTo(sortB);
                })
                .filter(d -> d.getLoadingTaskCode() == null || d.getLoadingTaskCode().isEmpty())
                .collect(Collectors.toList());

        if (sortedList.isEmpty())
        {
            return AjaxResult.error("没有可用的码头明细进行签到");
        }

        FAppointmentTaskDock targetDock = sortedList.get(0);

        // 3. 生成装卸任务编码: LT + yyyyMMdd + 4位序号
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String ltPrefix = "LT" + today;
        String maxCode = fAppointmentTaskDockMapper.selectMaxLoadingTaskCodeByDate(ltPrefix);
        int seq = 1;
        if (maxCode != null && maxCode.length() > ltPrefix.length())
        {
            seq = Integer.parseInt(maxCode.substring(ltPrefix.length())) + 1;
        }
        String loadingTaskCode = ltPrefix + String.format("%04d", seq);
        targetDock.setLoadingTaskCode(loadingTaskCode);
        targetDock.setWorkStatus("0");

        // 4. 获取该码头的dockId，查询码头资源
        Long dockId = targetDock.getDockId();
        FDock dock = fDockService.selectFDockById(dockId);

        // 4a. 查询空闲装卸点
        FDockLoadingPoint queryPoint = new FDockLoadingPoint();
        queryPoint.setDockId(dockId);
        queryPoint.setStatus(1);
        queryPoint.setIsOccupy("0");
        queryPoint.setDeleted(0);
        List<FDockLoadingPoint> freePoints = fDockLoadingPointService.selectFDockLoadingPointList(queryPoint);

        if (freePoints != null && !freePoints.isEmpty())
        {
            // 有空闲装卸点
            FDockLoadingPoint point = freePoints.get(0);
            point.setIsOccupy("1");
            fDockLoadingPointService.updateFDockLoadingPoint(point);

            targetDock.setLoadingPointId(point.getId());
            targetDock.setLoadingPointCode(point.getLoadingPointCode());
            targetDock.setLoadingPointName(point.getLoadingPointName());
            targetDock.setQueueStatus("装卸点排队");

            task.setTaskStatus("1");
        }
        else
        {
            // 4b. 查询空闲停车位
            FDockParkingSpace querySpace = new FDockParkingSpace();
            querySpace.setDockId(dockId);
            querySpace.setStatus(1);
            querySpace.setIsOccupy("0");
            querySpace.setDeleted(0);
            List<FDockParkingSpace> freeSpaces = fDockParkingSpaceService.selectFDockParkingSpaceList(querySpace);

            if (freeSpaces != null && !freeSpaces.isEmpty())
            {
                // 有空闲停车位
                FDockParkingSpace space = freeSpaces.get(0);
                space.setIsOccupy("1");
                fDockParkingSpaceService.updateFDockParkingSpace(space);

                targetDock.setParkingId(space.getId());
                targetDock.setParkingCode(space.getParkingSpaceCode());
                targetDock.setQueueStatus("停车位排队");

                // 计算排队序号
                Long maxQueue = fAppointmentTaskDockMapper.selectMaxQueueNumberByDockId(dockId);
                targetDock.setQueueNumber(maxQueue == null ? 1L : maxQueue + 1L);

                task.setTaskStatus("1");
            }
            else
            {
                // 4c. 装卸点和停车位都无空闲
                targetDock.setQueueStatus("厂外排队");

                Long maxQueue = fAppointmentTaskDockMapper.selectMaxQueueNumberByDockId(dockId);
                targetDock.setQueueNumber(maxQueue == null ? 1L : maxQueue + 1L);

                task.setTaskStatus("4");
            }
        }

        // 5. 主任务赋值当前排队码头
        task.setCurrentDockId(dockId);
        if (dock != null)
        {
            task.setCurrentDockName(dock.getDockName());
        }

        // 6. 更新记录
        fAppointmentTaskDockMapper.updateFAppointmentTaskDock(targetDock);
        fAppointmentTaskMapper.updateFAppointmentTask(task);

        return AjaxResult.success("签到成功");
    }
}
