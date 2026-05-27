//package com.cat.service.warningAlert;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.BeanUtils;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.util.CollectionUtils;
//
//import java.math.BigDecimal;
//import java.util.*;
//import java.util.concurrent.ConcurrentHashMap;
//
///**
// * 禁行区撞栏时长预警服务
// */
//@Service
//@Slf4j
//@AllArgsConstructor
//@Transactional
//public class AbnormalRestrictedAreaWarningService {
//
//    private final FWarningAlertMapper warningAlertMapper;
//    private final ElectronicFenceFunction electronicFenceFunction;
//    private final WarningConfigUtil warningConfigUtil;
//    final NotificationStoreService notificationStoreService;
//    private final TDeviceStayRecordMapper tDeviceStayRecordMapper;
//
//    // 禁行区停留状态缓存
////    private final Map<String, TDeviceStayRecord> restrictedAreaCache = new ConcurrentHashMap<>();
//    // 预警ID缓存
////    private final Map<String, Long> warningIdCache = new ConcurrentHashMap<>();
//
//    /**
//     * 处理单个车辆的禁行区撞栏检测
//     */
//    public void processLocationData(LocationDeviceVO currentData,
//                                    FAppointmentTask foundationInfo,
//                                    Integer warningThreshold,
//                                    List<FElectronicFence> allFences,
//                                    List<TDeviceStayRecord> records) {
//        String deviceSn = currentData.getDeviceSn();
//        BigDecimal longitude = currentData.getLongitude();
//        BigDecimal latitude = currentData.getLatitude();
//        Date currentTime = new Date();
//        TDeviceStayRecord deviceStayCache = warningConfigUtil.getLatestRecordsInMemory(records, foundationInfo.getId());
//        // 1. 基础数据验证
//        if (!validateBasicData(currentData)) {
//            return;
//        }
//        // 2. 检查车辆是否在禁行区
//        FenceCheckResult fenceResult = electronicFenceFunction.checkPointInFence(allFences, longitude, latitude);
//        if (!fenceResult.isInside()) {
//            // 不在任何围栏内 - 正常状态
//            handleNormalStatus(deviceSn, "不在任何围栏内", deviceStayCache, foundationInfo);
//            return;
//        }
//        // 3. 检查围栏类型
//        FenceTypeEnum fenceType = FenceTypeEnum.getByCode(fenceResult.getFenceType());
//        if (fenceType == null || !fenceType.isForbiddenArea()) {
//            // 不在禁行区 - 正常状态
//            handleNormalStatus(deviceSn, "不在禁行区", deviceStayCache, foundationInfo);
//            return;
//        }
//        // 4. 车辆在禁行区内 - 处理禁行区停留
//        handleRestrictedAreaStay(currentData, fenceResult.getFence(), foundationInfo,
//                warningThreshold, currentTime, deviceStayCache);
//    }
//
//    /**
//     * 验证基础数据
//     */
//    private boolean validateBasicData(LocationDeviceVO data) {
//        if (data == null || data.getDeviceSn() == null) {
//            return false;
//        }
//        if (data.getLongitude() == null || data.getLatitude() == null) {
//            log.info("定位坐标为空，设备SN: {}, 时间: {}", data.getDeviceSn(), new Date());
//            return false;
//        }
//        return true;
//    }
//
//    /**
//     * 处理正常状态（不在禁行区）
//     */
//    private void handleNormalStatus(String deviceSn, String reason, TDeviceStayRecord deviceStayCache, FAppointmentTask task) {
////        TDeviceStayRecord status = restrictedAreaCache.get(deviceSn);
//        //if (deviceStayCache != null) {
//        // 检查是否需要结束预警
//        //if (deviceStayCache.getWarningGenerated()) {
//        autoResolveRestrictedAreaWarning(deviceSn, String.valueOf(task.getId()),
//                ProcessResultEnum.auto_resolved.getCode(),
//                "车辆离开禁行区: " + reason);
//        //}
//        // 清除缓存
//        clearDeviceCache(task.getId());
////            restrictedAreaCache.remove(deviceSn);
//        // clearDeviceCache(deviceStayCache.getId());
//        //warningIdCache.remove(deviceSn);
//        log.info("车辆离开禁行区，设备SN: {}, 原因: {}, 时间: {}", deviceSn, reason, new Date());
//        //}
//    }
//
//    /**
//     * 处理禁行区停留
//     */
//    private void handleRestrictedAreaStay(LocationDeviceVO currentData,
//                                          FElectronicFence fence,
//                                          FAppointmentTask foundationInfo,
//                                          Integer warningThreshold,
//                                          Date currentTime,
//                                          TDeviceStayRecord deviceStayCache) {
//        String deviceSn = currentData.getDeviceSn();
//        if (deviceStayCache == null) {
//            // 第一次发现异常停留（创建内存存储）
//            // 获取或创建停留状态
//            createNewRestrictedAreaStatus(currentData, fence, currentTime, foundationInfo);
//            log.info("开始记录异常停留，设备SN: {}, 时间: {}", deviceSn, new Date());
//        } else {
//            // 更新停留状态
//            updateStayStatus(deviceStayCache, currentData, fence, currentTime);
//            // 计算累计停留时长（分钟）
//            int stayDurationMinutes = calculateStayDurationMinutes(deviceStayCache, currentTime);
//            // 判断是否需要生成预警
//            if (stayDurationMinutes >= warningThreshold) {
//                // 达到预警阈值
//                if (!deviceStayCache.getWarningGenerated()) {
//                    // 首次达到阈值，生成预警
//                    generateRestrictedAreaWarning(deviceStayCache, foundationInfo, currentData, fence);
//                } else {
//                    // 更新已存在的预警
//                    updateExistingRestrictedAreaWarning(deviceStayCache, currentData, stayDurationMinutes);
//                    // 发送通知
//                    notificationStoreService.storeRestrictedAreaNotification(null, foundationInfo, false);
//                }
//            }
//            log.info("禁行区停留状态更新，设备SN: {}, 禁行区: {}, 停留时长: {}分钟, 阈值: {}分钟, 时间: {}",
//                    deviceSn, fence.getFenceName(), stayDurationMinutes, warningThreshold, new Date());
//        }
//    }
//
//
//    /**
//     * 创建新的禁行区停留状态
//     */
//    private TDeviceStayRecord createNewRestrictedAreaStatus(LocationDeviceVO data,
//                                                            FElectronicFence fence,
//                                                            Date currentTime,
//                                                            FAppointmentTask foundationInfo) {
//        TDeviceStayRecord status = new TDeviceStayRecord();
//        status.setDeviceSn(data.getDeviceSn());
//        status.setPlateNumber(foundationInfo.getCarNo());
//        status.setAppointmentTaskId(foundationInfo.getId());
//        status.setFenceId(String.valueOf(fence.getId()));
//        status.setFenceName(fence.getFenceName());
//        status.setFenceType(fence.getFenceType());
//        status.setLongitude(data.getLongitude());
//        status.setLatitude(data.getLatitude());
//        //status.setLocationAddress(data.getLocationAddress());
//        status.setStartTime(currentTime);
//        status.setLastUpdateTime(currentTime);
//        status.setAccumulatedDuration(0);
//        status.setWarningGenerated(false);
//        status.setWarningType(WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode());
//        tDeviceStayRecordMapper.insert(status);
//        return status;
//    }
//
//    /**
//     * 更新停留状态
//     */
//    private void updateStayStatus(TDeviceStayRecord status, LocationDeviceVO data,
//                                  FElectronicFence fence, Date currentTime) {
//        // 计算时间间隔（秒）
//        long timeDiff = currentTime.getTime() - status.getLastUpdateTime().getTime();
//        int intervalSeconds = (int) (timeDiff / 1000);
//
//        if (intervalSeconds <= 0) {
//            return;
//        }
//        // 更新累计时长
//        status.setAccumulatedDuration(status.getAccumulatedDuration() + intervalSeconds);
//        status.setLongitude(data.getLongitude());
//        status.setLatitude(data.getLatitude());
//        //status.setLocationAddress(data.getLocationAddress());
//        status.setFenceId(String.valueOf(fence.getId()));
//        status.setFenceName(fence.getFenceName());
//        status.setLastUpdateTime(currentTime);
//        tDeviceStayRecordMapper.updateById(status);
//    }
//
//    /**
//     * 计算停留时长（分钟）
//     */
//    private int calculateStayDurationMinutes(TDeviceStayRecord status, Date currentTime) {
//        long totalSeconds = status.getAccumulatedDuration() == null ? 0L : status.getAccumulatedDuration();
//        return (int) (totalSeconds / 60); // 转换为分钟
//    }
//
//    /**
//     * 清除设备缓存
//     */
//    private void clearDeviceCache(Long taskId) {
//        // 查找对应的设备SN并清除缓存
//        tDeviceStayRecordMapper.delete(new LambdaQueryWrapper<TDeviceStayRecord>()
//                .eq(TDeviceStayRecord::getWarningType, WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode())
//                .eq(TDeviceStayRecord::getAppointmentTaskId, taskId));
//    }
//
//
//    /**
//     * 生成禁行区撞栏预警
//     */
//    private void generateRestrictedAreaWarning(TDeviceStayRecord status,
//                                               FAppointmentTask foundationInfo,
//                                               LocationDeviceVO currentData,
//                                               FElectronicFence fence) {
//        try {
//            // 检查是否已存在未处理的相同预警
//            if (hasExistingRestrictedAreaWarning(String.valueOf(status.getAppointmentTaskId()), Long.valueOf(status.getFenceId()))) {
//                log.info("已存在未处理的禁行区撞栏预警，车牌: {}, 禁行区ID: {}, 时间: {}",
//                        status.getPlateNumber(), status.getFenceId(), new Date());
//                return;
//            }
//            // 创建预警记录
//            FWarningAlert warning = createRestrictedAreaWarningRecord(status, foundationInfo, currentData, fence);
//            warningAlertMapper.insert(warning);
//            // 更新状态
//            status.setWarningId(warning.getId());
//            status.setWarningGenerated(true);
//            tDeviceStayRecordMapper.updateById(status);
//            //warningIdCache.put(status.getDeviceSn(), warning.getId());
//            log.warn("生成禁行区撞栏预警，预警ID: {}, 车牌: {}, 禁行区: {}, 停留时长: {}分钟, 时间: {}",
//                    warning.getId(), status.getPlateNumber(),
//                    status.getFenceName(), calculateStayDurationMinutes(status, new Date()), new Date());
//            // 发送通知
//            notificationStoreService.storeRestrictedAreaNotification(warning, foundationInfo, true);
//        } catch (Exception e) {
//            log.error("生成禁行区撞栏预警失败，设备SN: {}, 时间: {}", status.getDeviceSn(), e, new Date());
//        }
//    }
//
//    /**
//     * 创建禁行区撞栏预警记录
//     */
//    private FWarningAlert createRestrictedAreaWarningRecord(TDeviceStayRecord status,
//                                                            FAppointmentTask foundationInfo,
//                                                            LocationDeviceVO currentData,
//                                                            FElectronicFence fence) {
//        FWarningAlert warning = new FWarningAlert();
//        Date now = new Date();
//        int stayDurationMinutes = calculateStayDurationMinutes(status, now);
//        // 基础预警信息
//        warning.setWarningType(WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode());
//        warning.setWarningStatus(WarningStatusEnum.unprocessed.getCode());
//        warning.setWarningLevel(calculateWarningLevel(stayDurationMinutes));
//        // 位置信息
//        warning.setLongitude(status.getLongitude());
//        warning.setLatitude(status.getLatitude());
//        warning.setWarningLocation(status.getLocationAddress());
//        warning.setLocationAddress(status.getLocationAddress());
//        // 禁行区信息
//        warning.setFenceId(Long.valueOf(status.getFenceId()));
//        warning.setFenceName(status.getFenceName());
//        warning.setFenceType(status.getFenceType());
//        warning.setStayDuration((long) stayDurationMinutes);
//        // 时间信息
//        warning.setWarningTime(now);
//        // 业务信息
//        warning.setBusinessCategory("vehicle_monitor");
//        warning.setBusinessSubcategory("restricted_area_stay");
//        // 使用公共方法设置基础信息
//        DeviceStayInfo deviceStayInfo = new DeviceStayInfo();
//        BeanUtils.copyProperties(status, deviceStayInfo);
//        warning = warningConfigUtil.createWarningAlert(warning, deviceStayInfo, foundationInfo);
//        return warning;
//    }
//
//    /**
//     * 更新已存在的禁行区预警
//     */
//    private void updateExistingRestrictedAreaWarning(TDeviceStayRecord status,
//                                                     LocationDeviceVO currentData,
//                                                     int stayDurationMinutes) {
//        if (status.getWarningId() == null) {
//            return;
//        }
//        try {
//            FWarningAlert updateEntity = new FWarningAlert();
//            updateEntity.setId(status.getWarningId());
//            updateEntity.setStayDuration((long) stayDurationMinutes);
//            updateEntity.setWarningLevel(calculateWarningLevel(stayDurationMinutes));
//            updateEntity.setUpdateTime(new Date());
//            warningAlertMapper.updateById(updateEntity);
//            log.info("更新禁行区撞栏预警，预警ID: {}, 停留时长: {}分钟, 时间: {}",
//                    status.getWarningId(), stayDurationMinutes, new Date());
//        } catch (Exception e) {
//            log.error("更新禁行区撞栏预警失败，预警ID: {}, 时间: {}", status.getWarningId(), e, new Date());
//        }
//    }
//
//    /**
//     * 自动解决禁行区预警
//     */
//    private void autoResolveRestrictedAreaWarning(String deviceSn, String taskId,
//                                                  String processResult, String processNotes) {
//        //Long warningId = warningIdCache.get(deviceSn);
////        if (warningId != null) {
////            resolveRestrictedAreaWarning(processResult, processNotes);
////        } else {
//        // 查找最新的未处理预警
//        FWarningAlert latestWarning = findLatestUnprocessedRestrictedAreaWarning(taskId);
//        if (latestWarning != null) {
//            resolveRestrictedAreaWarning(latestWarning.getId(), processResult, processNotes);
//        }
////        }
//        // 清除缓存
//        //warningIdCache.remove(deviceSn);
//    }
//
//    /**
//     * 解决禁行区预警
//     */
//    private void resolveRestrictedAreaWarning(Long warningId, String processResult, String processNotes) {
//        try {
//            FWarningAlert warning = warningAlertMapper.selectById(warningId);
//            if (warning != null && WarningStatusEnum.unprocessed.getCode().equals(warning.getWarningStatus())) {
//                warning.setWarningStatus(WarningStatusEnum.processed.getCode());
//                warning.setProcessResult(processResult);
//                warning.setProcessNotes(processNotes);
//                warning.setProcessTime(new Date());
//                warning.setProcessPerson("system");
//                warning.setUpdateTime(new Date());
//                warningAlertMapper.updateById(warning);
//                log.info("自动处理禁行区撞栏预警，预警ID: {}, 处理结果: {}, 时间: {}", warningId, processResult, new Date());
//            }
//        } catch (Exception e) {
//            log.error("处理禁行区预警失败，预警ID: {}, 时间: {}", warningId, e, new Date());
//        }
//    }
//
//    /**
//     * 查找最新的未处理禁行区预警
//     */
//    private FWarningAlert findLatestUnprocessedRestrictedAreaWarning(String taskId) {
//        Date thirtyMinutesAgo = new Date(System.currentTimeMillis() - 30 * 60 * 1000);
//        List<FWarningAlert> warnings = warningAlertMapper.selectList(
//                new LambdaQueryWrapper<FWarningAlert>()
//                        .eq(FWarningAlert::getWarningType, WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode())
//                        .eq(FWarningAlert::getAppointmentTaskId, taskId)
//                        .eq(FWarningAlert::getWarningStatus, WarningStatusEnum.unprocessed.getCode())
////                        .ge(FWarningAlert::getWarningTime, thirtyMinutesAgo)
//                        .orderByDesc(FWarningAlert::getWarningTime)
//                        .last("LIMIT 1")
//        );
//        return CollectionUtils.isEmpty(warnings) ? null : warnings.get(0);
//    }
//
//    /**
//     * 检查是否已存在未处理的相同预警
//     */
//    private boolean hasExistingRestrictedAreaWarning(String taskId, Long fenceId) {
//        Date thirtyMinutesAgo = new Date(System.currentTimeMillis() - 30 * 60 * 1000);
//        Long count = Long.valueOf(warningAlertMapper.selectCount(
//                new LambdaQueryWrapper<FWarningAlert>()
//                        .eq(FWarningAlert::getWarningType, WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode())
//                        .eq(FWarningAlert::getAppointmentTaskId, taskId)
//                        .eq(FWarningAlert::getFenceId, fenceId)
//                        .eq(FWarningAlert::getWarningStatus, WarningStatusEnum.unprocessed.getCode())
//                        .ge(FWarningAlert::getWarningTime, thirtyMinutesAgo)
//        ));
//        return count != null && count > 0;
//    }
//
//    /**
//     * 计算预警级别
//     */
//    private String calculateWarningLevel(int stayDurationMinutes) {
//        if (stayDurationMinutes >= 30) {
//            return "urgent";     // 停留30分钟以上：紧急
//        } else if (stayDurationMinutes >= 15) {
//            return "high";       // 停留15-30分钟：高
//        } else if (stayDurationMinutes >= 5) {
//            return "normal";    // 停留5-15分钟：中
//        } else {
//            return "low";       // 停留5分钟以下：低
//        }
//    }
//}
//
///**
// * 禁行区预警处理流程说明
// * <p>
// * *禁行区撞栏时长预警完整流程说明
// * *
// * *1.定时任务触发（每分钟）
// * *    ↓
// * *2.获取所有车辆定位数据
// * *    ↓
// * *3.获取电子围栏配置数据
// * *    ↓
// * *4.获取预警阈值配置
// * *    ↓
// * *5.遍历每个车辆进行检测
// * *    ↓
// * *6.数据验证（设备SN、坐标有效性）
// * *    ↓
// * *7.围栏内外判定
// * *    ↓
// * *    ┌─不在任何围栏内 →正常状态，清除相关缓存
// * *    ↓
// * *8.围栏性质判定
// * *    ↓
// * *    ┌─非禁行区 →正常状态，清除相关缓存
// * *    ↓
// * *9.禁行区判定 →开始时长累计
// * *    ↓
// * *10.时长累加规则：
// * *-当前定位在禁行区内：累计时长 =上次时长 +时间间隔
// * *-当前定位不在禁行区：重置时长为0
// * *    ↓
// * *11.预警生成判断：
// * *-累计时长<阈值：仅更新状态，不生成预警
// * *-累计时长 ≥阈值：生成预警记录
// * *    ↓
// * *12.预警防重复检查：
// * *-同一车辆+同一禁行区，30分钟内不重复生成
// * *    ↓
// * *13.预警记录生成：
// * *-创建预警记录对象
// * *-设置预警类型：forbidden_strike_bar
// * *-设置预警状态：unprocessed
// * *-计算预警级别（低/中/高/紧急）
// * *    ↓
// * *14.保存预警记录到数据库
// * *    ↓
// * *15.多端通知推送：
// * *-司机小程序：弹窗提醒立即驶离
// * *-安保大屏：红色预警框显示
// * *    ↓
// * *16.标记预警已生成状态
// * *    ↓
// * *17.持续更新：
// * *-车辆仍在禁行区：更新预警时长和级别
// * *-车辆离开禁行区：自动处理预警
// * *    ↓
// * *18.缓存管理：
// * *-定期清理过期缓存（30分钟）
// * *-预警处理时同步清理
// * *    ↓
// * *19.统计记录：
// * *-记录处理成功/失败数量
// * *-收集实时统计信息
// */
