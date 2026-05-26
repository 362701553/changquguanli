package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 预约任务Controller
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/task")
public class FAppointmentTaskController extends BaseController
{
    @Autowired
    private IFAppointmentTaskService fAppointmentTaskService;

    /**
     * 查询预约任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(FAppointmentTask fAppointmentTask)
    {
        startPage();
        List<FAppointmentTask> list = fAppointmentTaskService.selectFAppointmentTaskList(fAppointmentTask);
        return getDataTable(list);
    }

    /**
     * 导出预约任务列表
     */
    @PreAuthorize("@ss.hasPermi('system:task:export')")
    @Log(title = "预约任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FAppointmentTask fAppointmentTask)
    {
        List<FAppointmentTask> list = fAppointmentTaskService.selectFAppointmentTaskList(fAppointmentTask);
        ExcelUtil<FAppointmentTask> util = new ExcelUtil<FAppointmentTask>(FAppointmentTask.class);
        util.exportExcel(response, list, "预约任务数据");
    }

    /**
     * 获取预约任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:task:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fAppointmentTaskService.selectFAppointmentTaskById(id));
    }

    /**
     * 新增预约任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:add')")
    @Log(title = "预约任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FAppointmentTask fAppointmentTask)
    {
        return toAjax(fAppointmentTaskService.insertFAppointmentTask(fAppointmentTask));
    }

    /**
     * 修改预约任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:edit')")
    @Log(title = "预约任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FAppointmentTask fAppointmentTask)
    {
        return toAjax(fAppointmentTaskService.updateFAppointmentTask(fAppointmentTask));
    }

    /**
     * 删除预约任务
     */
    @PreAuthorize("@ss.hasPermi('system:task:remove')")
    @Log(title = "预约任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fAppointmentTaskService.deleteFAppointmentTaskByIds(ids));
    }
}
