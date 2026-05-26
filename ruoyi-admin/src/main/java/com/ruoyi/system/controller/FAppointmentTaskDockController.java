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
import com.ruoyi.system.domain.FAppointmentTaskDock;
import com.ruoyi.system.service.IFAppointmentTaskDockService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 预约任务-码头明细Controller
 *
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/TaskDock")
public class FAppointmentTaskDockController extends BaseController
{
    @Autowired
    private IFAppointmentTaskDockService fAppointmentTaskDockService;

    /**
     * 查询预约任务-码头明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:list')")
    @GetMapping("/list")
    public TableDataInfo list(FAppointmentTaskDock fAppointmentTaskDock)
    {
        startPage();
        List<FAppointmentTaskDock> list = fAppointmentTaskDockService.selectFAppointmentTaskDockList(fAppointmentTaskDock);
        return getDataTable(list);
    }

    /**
     * 导出预约任务-码头明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:export')")
    @Log(title = "预约任务-码头明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FAppointmentTaskDock fAppointmentTaskDock)
    {
        List<FAppointmentTaskDock> list = fAppointmentTaskDockService.selectFAppointmentTaskDockList(fAppointmentTaskDock);
        ExcelUtil<FAppointmentTaskDock> util = new ExcelUtil<FAppointmentTaskDock>(FAppointmentTaskDock.class);
        util.exportExcel(response, list, "预约任务-码头明细数据");
    }

    /**
     * 获取预约任务-码头明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:dock:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fAppointmentTaskDockService.selectFAppointmentTaskDockById(id));
    }

    /**
     * 新增预约任务-码头明细
     */
    @PreAuthorize("@ss.hasPermi('system:dock:add')")
    @Log(title = "预约任务-码头明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FAppointmentTaskDock fAppointmentTaskDock)
    {
        return toAjax(fAppointmentTaskDockService.insertFAppointmentTaskDock(fAppointmentTaskDock));
    }

    /**
     * 修改预约任务-码头明细
     */
    @PreAuthorize("@ss.hasPermi('system:dock:edit')")
    @Log(title = "预约任务-码头明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FAppointmentTaskDock fAppointmentTaskDock)
    {
        return toAjax(fAppointmentTaskDockService.updateFAppointmentTaskDock(fAppointmentTaskDock));
    }

    /**
     * 删除预约任务-码头明细
     */
    @PreAuthorize("@ss.hasPermi('system:dock:remove')")
    @Log(title = "预约任务-码头明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fAppointmentTaskDockService.deleteFAppointmentTaskDockByIds(ids));
    }
}
