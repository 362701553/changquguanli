package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FAppointmentTask;
import com.ruoyi.system.service.IFAppointmentTaskService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 排队调度Controller
 *
 * @author ruoyi
 * @date 2026-06-10
 */
@RestController
@RequestMapping("/system/queue")
public class FQueueDispatchController extends BaseController
{
    @Autowired
    private IFAppointmentTaskService fAppointmentTaskService;

    /**
     * 获取全局排队队列
     */
    @PreAuthorize("@ss.hasPermi('system:queue:list')")
    @GetMapping("/list")
    public TableDataInfo list()
    {
        startPage();
        List<FAppointmentTask> list = fAppointmentTaskService.getGlobalQueueList();
        return getDataTable(list);
    }

    /**
     * 叫号
     */
    @PreAuthorize("@ss.hasPermi('system:queue:call')")
    @Log(title = "叫号", businessType = BusinessType.UPDATE)
    @PostMapping("/call")
    public AjaxResult callNumber(@RequestBody Map<String, Object> params)
    {
        Long taskId = Long.valueOf(params.get("taskId").toString());
        Long dockId = params.get("dockId") != null && !"".equals(params.get("dockId").toString()) ? Long.valueOf(params.get("dockId").toString()) : null;
        Long dispatcherId = params.get("dispatcherId") != null && !"".equals(params.get("dispatcherId").toString()) ? Long.valueOf(params.get("dispatcherId").toString()) : null;
        String dispatcherName = params.get("dispatcherName") != null ? params.get("dispatcherName").toString() : null;
        return fAppointmentTaskService.callNumber(taskId, dockId, dispatcherId, dispatcherName);
    }

    /**
     * 司机确认入厂
     */
    @PreAuthorize("@ss.hasPermi('system:queue:confirm')")
    @Log(title = "确认入厂", businessType = BusinessType.UPDATE)
    @PostMapping("/confirmEntry/{taskId}")
    public AjaxResult confirmEntry(@PathVariable("taskId") Long taskId)
    {
        return fAppointmentTaskService.confirmEntry(taskId);
    }

    /**
     * 手动过号
     */
    @PreAuthorize("@ss.hasPermi('system:queue:miss')")
    @Log(title = "过号", businessType = BusinessType.UPDATE)
    @PostMapping("/miss/{taskId}")
    public AjaxResult missNumber(@PathVariable("taskId") Long taskId)
    {
        return fAppointmentTaskService.missNumber(taskId);
    }
}
