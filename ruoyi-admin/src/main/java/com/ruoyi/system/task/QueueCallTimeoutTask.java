package com.ruoyi.system.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ruoyi.system.service.IFAppointmentTaskService;

/**
 * 叫号超时检查定时任务
 * 每分钟检查叫号中的任务是否超过5分钟未确认入厂，超时则自动过号
 *
 * 在sys_job表中配置: invoke_target = queueCallTimeoutTask.checkTimeout()
 * cron =
1 * * * ?*/
@Component("queueCallTimeoutTask")
public class QueueCallTimeoutTask
{
    private static final Logger log = LoggerFactory.getLogger(QueueCallTimeoutTask.class);

    @Autowired
    private IFAppointmentTaskService fAppointmentTaskService;

    public void checkTimeout()
    {
        log.info("开始检查叫号超时任务");
        fAppointmentTaskService.processTimedOutCalls();
    }
}
