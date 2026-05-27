//package com.ruoyi.system.task;
//
//
//import com.ruoyi.system.domain.FAppointmentTask;
//import com.ruoyi.system.warning.AbnormalRestrictedAreaWarningService;
//import lombok.AllArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.stereotype.Component;
//import org.springframework.util.CollectionUtils;
//
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
///**
// * 禁行区撞栏时长预警定时任务
// */
//@Component("abnormalRestrictedAreaWarningTask")
//@Slf4j
//@AllArgsConstructor
//public class AbnormalRestrictedAreaWarningTask {
//
//    private final AbnormalRestrictedAreaWarningService restrictedAreaWarningService;
//    private final ElectronicFenceFunction electronicFenceFunction;
//    private final WarningConfigUtil warningConfigUtil;
//    private final LocationDeviceService locationDeviceService;
//    private final TDeviceStayRecordMapper tDeviceStayRecordMapper;
//
//    /**
//     * 禁行区撞栏预警生成 - 每分钟执行一次
//     */
//
//    public void generate() {
//        log.info("开始执行禁行区撞栏预警定时任务");
//
//        try {
//            List<FAppointmentTask> fAppointmentTasks = warningConfigUtil.getLocationDataList();
//            // 使用StreamAPI进行分组
//            if (CollectionUtils.isEmpty(fAppointmentTasks)) {
//                log.info("暂无任务数据");
//                return;
//            }
//            Map<String, List<FAppointmentTask>> tasksGroupedByFactoryAndArea = fAppointmentTasks.stream()
//                    .collect(Collectors.groupingBy(task -> {
//                        Long factoryId = task.getFactoryId();
//                        Long areaId = task.getFactoryAreaId();
//                        // 构建分组键：工厂ID_厂区ID，如果厂区ID为null则用"all"表示
//                        return factoryId + "_" + (areaId != null ? areaId : "all");
//                    }));
//            List<TDeviceStayRecord> records = tDeviceStayRecordMapper.selectList(new LambdaQueryWrapper<TDeviceStayRecord>()
//                    .eq(TDeviceStayRecord::getWarningType, WarningTypeEnum.FORBIDDEN_STRIKE_BAR.getCode())
//                    .eq(TDeviceStayRecord::getDeleted, 0));
//            for (Map.Entry<String, List<FAppointmentTask>> entry : tasksGroupedByFactoryAndArea.entrySet()) {
//                //2、按照工厂厂区分组分别处理
//                String[] keys = entry.getKey().split("_");
//                Long factoryId = Long.parseLong(keys[0]);//工厂
//                Long areaId = "all".equals(keys[1]) ? null : Long.parseLong(keys[1]);//厂区
//                //工厂厂区下所有任务列表
//                List<FAppointmentTask> tasksInGroup = entry.getValue();//列表
//                // 3. 获取基础配置信息
//                FoundationInfo info = warningConfigUtil.createFoundationInfo(tasksInGroup.get(0));//基础信息处理
//                log.info("处理工厂ID: {}, 厂区ID: {}, 任务数量: {}", factoryId, areaId, tasksInGroup.size());
//                if (info == null) {
//                    log.warn("未获取到工厂配置信息，跳过超长停留预警检测");
//                    continue;
//                }
//                // 3. 获取电子围栏数据
//                List<FElectronicFence> allFences = electronicFenceFunction.getFencesByFactory(factoryId, areaId);
//                if (CollectionUtils.isEmpty(allFences)) {
//                    log.info("工厂ID: {}, 厂区ID: {} 没有电子围栏配置，跳过禁行区预警检测",
//                            info.getFactoryId(), info.getAreaId());
//                    continue;
//                }
//                // 4. 获取预警阈值
//                Integer warningThreshold = getWarningThreshold(info);
//                log.info("开始处理禁行区撞栏预警，车辆数量: {}, 围栏数量: {}, 预警阈值: {}分钟,电子围栏列表数据:{}",
//                        tasksInGroup.size(), allFences.size(), warningThreshold,allFences);
//                int processedCount = 0;
//                int errorCount = 0;
//                for (FAppointmentTask task : tasksInGroup) {
//                    try {
//                        //处理设备数据
//                        LocationDevice locationDevice = locationDeviceService.getLatestLocationByDeviceSn(task.getDeviceSn());
//                        LocationDeviceVO currentData = LocationDeviceVO.toLocationDeviceVO(locationDevice);
//                        if (currentData == null) {
//                            continue;
//                        }
//                        restrictedAreaWarningService.processLocationData(currentData, task, warningThreshold, allFences, records);
//                        processedCount++;
//                    } catch (Exception e) {
//                        errorCount++;
//                        log.error("处理车辆禁行区数据异常，设备SN: {}", task.getDeviceSn(), e);
//                    }
//                }
//                // 6. 清理过期缓存
//                //restrictedAreaWarningService.cleanupExpiredCache();
//                log.info("禁行区撞栏预警处理完成，成功处理: {}辆，失败: {}辆", processedCount, errorCount);
//            }
//        } catch (Exception e) {
//            log.error("禁行区撞栏预警定时任务执行失败", e);
//        }
//    }
//
////    /**
////     * 缓存清理任务 - 每小时执行一次
////     */
////    @Scheduled(cron = "0 0 */1 * * ?")
////    public void cleanupCache() {
////        log.info("开始清理禁行区预警缓存");
////       // restrictedAreaWarningService.cleanupExpiredCache();
////    }
//
////    /**
////     * 统计信息收集 - 每5分钟执行一次
////     */
////    @Scheduled(cron = "0 */5 * * * ?")
////    public void collectStats() {
////        try {
////            var stats = restrictedAreaWarningService.getRestrictedAreaStats();
////            log.info("禁行区预警统计信息: {}", stats);
////        } catch (Exception e) {
////            log.error("收集禁行区预警统计信息失败", e);
////        }
////    }
//
//    /**
//     * 获取预警阈值
//     */
//    private Integer getWarningThreshold(FoundationInfo info) {
//        try {
//            info.setWarningTypeEnum(WarningTypeEnum.FORBIDDEN_STRIKE_BAR);
//            FReservationParamsConfig config = warningConfigUtil.getWarningConfig(info);
//            if (config != null && StringUtils.isNotBlank(config.getFiledValue())) {
//                return Integer.parseInt(config.getFiledValue().trim());
//            }
//        } catch (NumberFormatException e) {
//            log.warn("禁行区预警阈值配置格式错误，使用默认值5分钟");
//        }
//        return 5; // 默认5分钟
//    }
//}
//
///**
// * 若在围栏外 → 判定为 “正常状态”，不做后续处理；
// * 若在围栏内类型为“非禁行区” → 判定为 “正常状态”，不做后续处理；
// * 若在围栏内类型为“禁行区” → 判定为 “禁行区异常停留状态”
// * <p>
// * 更新累加：两次定位间隔 1 分钟，则累加 1 分钟
// */
//
