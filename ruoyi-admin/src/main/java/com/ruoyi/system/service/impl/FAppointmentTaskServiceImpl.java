package com.ruoyi.system.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.mapper.FAppointmentTaskMapper;
import com.ruoyi.system.mapper.FAppointmentTaskDockMapper;
import com.ruoyi.system.mapper.FAppointmentTaskCompanionMapper;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.system.domain.FAppointmentTaskDock;
import com.ruoyi.system.domain.FAppointmentTaskCompanion;
import com.ruoyi.system.domain.FDock;
import com.ruoyi.system.domain.FDockLoadingPoint;
import com.ruoyi.system.domain.FDockParkingSpace;
import com.ruoyi.system.service.IFAppointmentTaskService;
import com.ruoyi.system.service.IFDockService;
import com.ruoyi.system.service.IFDockLoadingPointService;
import com.ruoyi.system.service.IFDockParkingSpaceService;
import com.ruoyi.system.mapper.FForkliftDriverBaseMapper;
import com.ruoyi.system.domain.FForkliftDriverBase;
import com.ruoyi.system.domain.FForklift;
import com.ruoyi.system.domain.FForkliftDriver;
import com.ruoyi.system.mapper.FForkliftDriverMapper;
import com.ruoyi.system.service.IFForkliftService;
import com.ruoyi.system.mapper.FLocationDeviceMapper;
import com.ruoyi.system.domain.FLocationDevice;

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
    private FAppointmentTaskCompanionMapper fAppointmentTaskCompanionMapper;

    @Autowired
    private IFDockService fDockService;

    @Autowired
    private IFDockLoadingPointService fDockLoadingPointService;

    @Autowired
    private IFDockParkingSpaceService fDockParkingSpaceService;

    @Autowired
    private FForkliftDriverBaseMapper fForkliftDriverBaseMapper;

    @Autowired
    private FForkliftDriverMapper fForkliftDriverMapper;

    @Autowired
    private IFForkliftService fForkliftService;

    @Autowired
    private FLocationDeviceMapper fLocationDeviceMapper;

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
    public AjaxResult insertFAppointmentTaskWithDocks(FAppointmentTask fAppointmentTask)
    {
        // 0. 校验司机预约时间冲突
        List<FAppointmentTask> conflicting = fAppointmentTaskMapper.selectConflictingTask(
                fAppointmentTask.getOutDriverId(),
                fAppointmentTask.getAppointmentStart(),
                fAppointmentTask.getAppointmentEnd());
        if (conflicting != null && !conflicting.isEmpty())
        {
            FAppointmentTask exist = conflicting.get(0);
            return AjaxResult.error("该司机在所选时间段内已有预约任务（" + exist.getTaskCode() + "），请选择其他时间段");
        }

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
        fAppointmentTaskMapper.insertFAppointmentTask(fAppointmentTask);

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

        // 5. 插入随行人员明细
        if (fAppointmentTask.getCompanions() != null && !fAppointmentTask.getCompanions().isEmpty())
        {
            for (FAppointmentTaskCompanion companion : fAppointmentTask.getCompanions())
            {
                companion.setTaskId(fAppointmentTask.getId());
                companion.setCreateDate(new Date());
                fAppointmentTaskCompanionMapper.insertFAppointmentTaskCompanion(companion);
            }
        }

        return AjaxResult.success("新增成功");
    }

    @Override
    @Transactional
    public AjaxResult checkin(Long taskId, Long deviceId)
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

        // 1.5 绑定定位设备
        FLocationDevice device = fLocationDeviceMapper.selectFLocationDeviceById(deviceId);
        if (device == null)
        {
            return AjaxResult.error("定位设备不存在");
        }
        if (!"idle".equals(device.getDeviceStatus()))
        {
            return AjaxResult.error("该定位设备当前不可用");
        }
        // 更新任务的设备绑定信息
        task.setDeviceId(deviceId);
        task.setDeviceSn(device.getDeviceSn());
        task.setBindDeviceStatus("bound");
        task.setBindTime(new Date());
        // 更新设备状态为使用中
        device.setDeviceStatus("using");
        device.setTaskId(taskId);
        device.setTaskCode(task.getTaskCode());
        fLocationDeviceMapper.updateFLocationDevice(device);

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

    @Override
    @Transactional
    public AjaxResult startWork(Long dockTaskId)
    {
        FAppointmentTaskDock dockTask = fAppointmentTaskDockMapper.selectFAppointmentTaskDockById(dockTaskId);
        if (dockTask == null)
        {
            return AjaxResult.error("码头任务不存在");
        }
        if (!"0".equals(dockTask.getWorkStatus()))
        {
            return AjaxResult.error("只有待作业状态才能开始作业");
        }
        if (dockTask.getLoadingPointId() == null)
        {
            return AjaxResult.error("该任务尚未分配装卸点，无法开始作业");
        }

        dockTask.setWorkStatus("1");
        dockTask.setLoadingStart(new Date());
        fAppointmentTaskDockMapper.updateFAppointmentTaskDock(dockTask);

        FAppointmentTask task = fAppointmentTaskMapper.selectFAppointmentTaskById(dockTask.getTaskId());
        task.setTaskStatus("2");
        fAppointmentTaskMapper.updateFAppointmentTask(task);

        return AjaxResult.success("开始作业成功");
    }

    @Override
    @Transactional
    public AjaxResult releasePoint(Long dockTaskId)
    {
        FAppointmentTaskDock currentDockTask = fAppointmentTaskDockMapper.selectFAppointmentTaskDockById(dockTaskId);
        if (currentDockTask == null)
        {
            return AjaxResult.error("码头任务不存在");
        }
        if (!"1".equals(currentDockTask.getWorkStatus()))
        {
            return AjaxResult.error("只有作业中状态才能释放点位");
        }

        Long releasedDockId = currentDockTask.getDockId();

        // 释放装卸点
        if (currentDockTask.getLoadingPointId() != null)
        {
            FDockLoadingPoint point = fDockLoadingPointService.selectFDockLoadingPointById(currentDockTask.getLoadingPointId());
            if (point != null)
            {
                point.setIsOccupy("0");
                fDockLoadingPointService.updateFDockLoadingPoint(point);
            }
        }

        // 当前码头任务标记完成
        currentDockTask.setWorkStatus("2");
        currentDockTask.setPointReleaseTime(new Date());
        currentDockTask.setLoadingFinish(new Date());
        currentDockTask.setQueueStatus("已完成");
        fAppointmentTaskDockMapper.updateFAppointmentTaskDock(currentDockTask);

        // 释放叉车司机
        if (currentDockTask.getForkliftDriverId() != null)
        {
            FForkliftDriverBase driver = fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(currentDockTask.getForkliftDriverId());
            if (driver != null)
            {
                driver.setWorkStatus("0");
                fForkliftDriverBaseMapper.updateFForkliftDriverBase(driver);
            }
            // 释放关联叉车
            FForkliftDriver queryRelation = new FForkliftDriver();
            queryRelation.setDriverId(currentDockTask.getForkliftDriverId());
            queryRelation.setStatus("0");
            List<FForkliftDriver> relations = fForkliftDriverMapper.selectFForkliftDriverList(queryRelation);
            if (relations != null && !relations.isEmpty())
            {
                for (FForkliftDriver rel : relations)
                {
                    if (rel.getForkliftId() != null)
                    {
                        FForklift forklift = fForkliftService.selectFForkliftById(rel.getForkliftId());
                        if (forklift != null && "1".equals(forklift.getWorkStatus()))
                        {
                            forklift.setWorkStatus("0");
                            fForkliftService.updateFForklift(forklift);
                        }
                    }
                }
            }
        }

        // 查询主任务是否有后续未处理码头
        Long taskId = currentDockTask.getTaskId();
        FAppointmentTaskDock queryDock = new FAppointmentTaskDock();
        queryDock.setTaskId(taskId);
        List<FAppointmentTaskDock> allDocks = fAppointmentTaskDockMapper.selectFAppointmentTaskDockList(queryDock);
        List<FAppointmentTaskDock> unprocessed = allDocks.stream()
                .sorted((a, b) -> {
                    Long sortA = a.getDockSort() != null ? a.getDockSort() : 0L;
                    Long sortB = b.getDockSort() != null ? b.getDockSort() : 0L;
                    return sortA.compareTo(sortB);
                })
                .filter(d -> d.getLoadingTaskCode() == null || d.getLoadingTaskCode().isEmpty())
                .collect(Collectors.toList());

        FAppointmentTask task = fAppointmentTaskMapper.selectFAppointmentTaskById(taskId);

        if (!unprocessed.isEmpty())
        {
            processNextDockWithPriority(unprocessed.get(0), task);
        }
        else
        {
            task.setTaskStatus("5");
            fAppointmentTaskMapper.updateFAppointmentTask(task);
        }

        // 全量重排：将当前码头所有空闲装卸点和停车位重新分配给排队车辆
        rebalanceDockQueue(releasedDockId);

        return AjaxResult.success("点位释放成功");
    }

    @Override
    @Transactional
    public AjaxResult checkout(Long taskId)
    {
        FAppointmentTask task = fAppointmentTaskMapper.selectFAppointmentTaskById(taskId);
        if (task == null)
        {
            return AjaxResult.error("任务不存在");
        }
        if (!"5".equals(task.getTaskStatus()))
        {
            return AjaxResult.error("只有待签出状态的任务才能签出");
        }

        task.setTaskStatus("6");
        fAppointmentTaskMapper.updateFAppointmentTask(task);

        return AjaxResult.success("签出成功");
    }

    private void processNextDockWithPriority(FAppointmentTaskDock nextDock, FAppointmentTask task)
    {
        Long dockId = nextDock.getDockId();

        // 生成装卸任务编码
        String today = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String ltPrefix = "LT" + today;
        String maxCode = fAppointmentTaskDockMapper.selectMaxLoadingTaskCodeByDate(ltPrefix);
        int seq = 1;
        if (maxCode != null && maxCode.length() > ltPrefix.length())
        {
            seq = Integer.parseInt(maxCode.substring(ltPrefix.length())) + 1;
        }
        String loadingTaskCode = ltPrefix + String.format("%04d", seq);
        nextDock.setLoadingTaskCode(loadingTaskCode);
        nextDock.setWorkStatus("0");

        // 优先分配装卸点
        FDockLoadingPoint queryPoint = new FDockLoadingPoint();
        queryPoint.setDockId(dockId);
        queryPoint.setStatus(1);
        queryPoint.setIsOccupy("0");
        queryPoint.setDeleted(0);
        List<FDockLoadingPoint> freePoints = fDockLoadingPointService.selectFDockLoadingPointList(queryPoint);

        if (freePoints != null && !freePoints.isEmpty())
        {
            FDockLoadingPoint point = freePoints.get(0);
            point.setIsOccupy("1");
            fDockLoadingPointService.updateFDockLoadingPoint(point);

            nextDock.setLoadingPointId(point.getId());
            nextDock.setLoadingPointCode(point.getLoadingPointCode());
            nextDock.setLoadingPointName(point.getLoadingPointName());
            nextDock.setQueueStatus("装卸点排队");
            nextDock.setIsWorkedJump("1");
        }
        else
        {
            // 无空闲装卸点，插队排在第一位
            nextDock.setQueueStatus("停车位排队");
            nextDock.setQueueNumber(0L);
            nextDock.setIsWorkedJump("1");

            // 尝试分配停车位
            FDockParkingSpace querySpace = new FDockParkingSpace();
            querySpace.setDockId(dockId);
            querySpace.setStatus(1);
            querySpace.setIsOccupy("0");
            querySpace.setDeleted(0);
            List<FDockParkingSpace> freeSpaces = fDockParkingSpaceService.selectFDockParkingSpaceList(querySpace);
            if (freeSpaces != null && !freeSpaces.isEmpty())
            {
                FDockParkingSpace space = freeSpaces.get(0);
                space.setIsOccupy("1");
                fDockParkingSpaceService.updateFDockParkingSpace(space);
                nextDock.setParkingId(space.getId());
                nextDock.setParkingCode(space.getParkingSpaceCode());
            }
        }

        // 更新主任务当前码头
        FDock dock = fDockService.selectFDockById(dockId);
        task.setCurrentDockId(dockId);
        if (dock != null)
        {
            task.setCurrentDockName(dock.getDockName());
        }
        fAppointmentTaskMapper.updateFAppointmentTask(task);

        fAppointmentTaskDockMapper.updateFAppointmentTaskDock(nextDock);
    }

    /**
     * 全量重排：释放后将当前码头所有空闲装卸点和停车位重新分配给排队车辆
     * 优先级：停车位排队 > 厂外排队（按queue_number升序）
     * 逻辑：
     *   1. 查询所有空闲装卸点，按优先级分配给排队车辆
     *   2. 被提升到装卸点的车辆释放停车位，跟踪释放的停车位
     *   3. 将所有空闲停车位（含刚释放的）分配给厂外排队的车辆
     */
    private void rebalanceDockQueue(Long dockId)
    {
        // 获取所有停车位排队的车辆（按queue_number升序）
        List<FAppointmentTaskDock> parkingQueued = fAppointmentTaskDockMapper.selectParkingQueuedList(dockId);
        // 获取所有厂外排队的车辆（按queue_number升序）
        List<FAppointmentTaskDock> outsideQueued = fAppointmentTaskDockMapper.selectOutsideQueuedList(dockId);

        if (parkingQueued.isEmpty() && outsideQueued.isEmpty())
        {
            return;
        }

        // === 第一步：将所有空闲装卸点分配给排队车辆 ===
        FDockLoadingPoint queryPoint = new FDockLoadingPoint();
        queryPoint.setDockId(dockId);
        queryPoint.setStatus(1);
        queryPoint.setIsOccupy("0");
        queryPoint.setDeleted(0);
        List<FDockLoadingPoint> freePoints = fDockLoadingPointService.selectFDockLoadingPointList(queryPoint);

        // 跟踪被释放的停车位（停车位排队车辆提升到装卸点后释放的）
        List<FDockParkingSpace> freedParkingSpaces = new ArrayList<>();
        // 跟踪已被分配到装卸点的厂外排队车辆索引
        int outsidePromotedCount = 0;

        if (freePoints != null && !freePoints.isEmpty())
        {
            int pointIndex = 0;

            // 先分配停车位排队的车辆到装卸点
            for (int i = 0; i < parkingQueued.size() && pointIndex < freePoints.size(); i++)
            {
                FAppointmentTaskDock queued = parkingQueued.get(i);
                FDockLoadingPoint point = freePoints.get(pointIndex++);

                point.setIsOccupy("1");
                fDockLoadingPointService.updateFDockLoadingPoint(point);

                queued.setLoadingPointId(point.getId());
                queued.setLoadingPointCode(point.getLoadingPointCode());
                queued.setLoadingPointName(point.getLoadingPointName());
                queued.setQueueStatus("装卸点排队");
                queued.setQueueNumber(0L);

                // 释放其停车位，加入释放列表
                if (queued.getParkingId() != null)
                {
                    FDockParkingSpace space = fDockParkingSpaceService.selectFDockParkingSpaceById(queued.getParkingId());
                    if (space != null)
                    {
                        space.setIsOccupy("0");
                        fDockParkingSpaceService.updateFDockParkingSpace(space);
                        freedParkingSpaces.add(space);
                    }
                }

                fAppointmentTaskDockMapper.updateFAppointmentTaskDock(queued);
            }

            // 如果还有空闲装卸点，分配给厂外排队的车辆
            for (int i = 0; i < outsideQueued.size() && pointIndex < freePoints.size(); i++)
            {
                FAppointmentTaskDock queued = outsideQueued.get(i);
                FDockLoadingPoint point = freePoints.get(pointIndex++);

                point.setIsOccupy("1");
                fDockLoadingPointService.updateFDockLoadingPoint(point);

                queued.setLoadingPointId(point.getId());
                queued.setLoadingPointCode(point.getLoadingPointCode());
                queued.setLoadingPointName(point.getLoadingPointName());
                queued.setQueueStatus("装卸点排队");
                queued.setQueueNumber(0L);

                fAppointmentTaskDockMapper.updateFAppointmentTaskDock(queued);
                outsidePromotedCount++;

                // 厂外排队的车辆进入装卸点，主任务从"待入厂"变为"待作业"
                FAppointmentTask outsideTask = fAppointmentTaskMapper.selectFAppointmentTaskById(queued.getTaskId());
                if (outsideTask != null && "4".equals(outsideTask.getTaskStatus()))
                {
                    outsideTask.setTaskStatus("1");
                    fAppointmentTaskMapper.updateFAppointmentTask(outsideTask);
                }
            }
        }

        // === 第二步：将空闲停车位分配给剩余厂外排队的车辆 ===
        // 剩余未被分配装卸点的厂外车辆
        List<FAppointmentTaskDock> remainingOutside = outsideQueued.subList(
                outsidePromotedCount, outsideQueued.size());

        if (remainingOutside.isEmpty())
        {
            return;
        }

        // 合并：查询数据库中原本空闲的停车位 + 刚被释放的停车位
        FDockParkingSpace querySpace = new FDockParkingSpace();
        querySpace.setDockId(dockId);
        querySpace.setStatus(1);
        querySpace.setIsOccupy("0");
        querySpace.setDeleted(0);
        List<FDockParkingSpace> dbFreeSpaces = fDockParkingSpaceService.selectFDockParkingSpaceList(querySpace);

        // 合并两个来源的空闲停车位，去重
        List<FDockParkingSpace> allFreeSpaces = new ArrayList<>();
        if (dbFreeSpaces != null)
        {
            allFreeSpaces.addAll(dbFreeSpaces);
        }
        for (FDockParkingSpace freed : freedParkingSpaces)
        {
            boolean exists = allFreeSpaces.stream().anyMatch(s -> s.getId().equals(freed.getId()));
            if (!exists)
            {
                allFreeSpaces.add(freed);
            }
        }

        int spaceIndex = 0;
        for (int i = 0; i < remainingOutside.size() && spaceIndex < allFreeSpaces.size(); i++)
        {
            FAppointmentTaskDock queued = remainingOutside.get(i);
            FDockParkingSpace space = allFreeSpaces.get(spaceIndex++);

            space.setIsOccupy("1");
            fDockParkingSpaceService.updateFDockParkingSpace(space);

            queued.setParkingId(space.getId());
            queued.setParkingCode(space.getParkingSpaceCode());
            queued.setQueueStatus("停车位排队");

            fAppointmentTaskDockMapper.updateFAppointmentTaskDock(queued);

            // 主任务状态从"待入厂"变为"待作业"
            FAppointmentTask outsideTask = fAppointmentTaskMapper.selectFAppointmentTaskById(queued.getTaskId());
            if (outsideTask != null && "4".equals(outsideTask.getTaskStatus()))
            {
                outsideTask.setTaskStatus("1");
                fAppointmentTaskMapper.updateFAppointmentTask(outsideTask);
            }
        }
    }

    @Override
    @Transactional
    public AjaxResult assignForkliftDriver(Long dockTaskId, Long driverId)
    {
        FAppointmentTaskDock dockTask = fAppointmentTaskDockMapper.selectFAppointmentTaskDockById(dockTaskId);
        if (dockTask == null)
        {
            return AjaxResult.error("码头任务不存在");
        }
        if (!"0".equals(dockTask.getWorkStatus()))
        {
            return AjaxResult.error("只有待作业状态才能指派叉车司机");
        }
        if (dockTask.getLoadingPointId() == null)
        {
            return AjaxResult.error("该任务尚未分配装卸点，无法指派");
        }

        FForkliftDriverBase driver = fForkliftDriverBaseMapper.selectFForkliftDriverBaseById(driverId);
        if (driver == null)
        {
            return AjaxResult.error("叉车司机不存在");
        }
        if (!"0".equals(driver.getDriverStatus()))
        {
            return AjaxResult.error("该叉车司机已被禁用");
        }
        if ("1".equals(driver.getWorkStatus()))
        {
            return AjaxResult.error("该叉车司机正在作业中，无法指派");
        }

        // 查询司机关联的叉车
        FForkliftDriver queryRelation = new FForkliftDriver();
        queryRelation.setDriverId(driverId);
        queryRelation.setStatus("0");
        List<FForkliftDriver> relations = fForkliftDriverMapper.selectFForkliftDriverList(queryRelation);
        if (relations == null || relations.isEmpty())
        {
            return AjaxResult.error("该叉车司机没有关联叉车，无法指派");
        }

        // 取第一个关联叉车
        FForkliftDriver relation = relations.get(0);
        String forkliftCode = relation.getForkliftCode();

        // 更新码头任务：指派司机信息 + 开始作业
        dockTask.setForkliftDriverId(driverId);
        dockTask.setForkliftDriverName(driver.getDriverName());
        dockTask.setForkliftNo(forkliftCode);
        dockTask.setWorkStatus("1");
        dockTask.setLoadingStart(new Date());
        fAppointmentTaskDockMapper.updateFAppointmentTaskDock(dockTask);

        // 更新司机作业状态为"作业中"
        driver.setWorkStatus("1");
        fForkliftDriverBaseMapper.updateFForkliftDriverBase(driver);

        // 更新叉车状态为"占用"
        if (relation.getForkliftId() != null)
        {
            FForklift forklift = fForkliftService.selectFForkliftById(relation.getForkliftId());
            if (forklift != null)
            {
                forklift.setWorkStatus("1");
                fForkliftService.updateFForklift(forklift);
            }
        }

        // 更新主任务状态为"作业中"
        FAppointmentTask task = fAppointmentTaskMapper.selectFAppointmentTaskById(dockTask.getTaskId());
        if (task != null)
        {
            task.setTaskStatus("2");
            fAppointmentTaskMapper.updateFAppointmentTask(task);
        }

        return AjaxResult.success("指派成功");
    }
}
