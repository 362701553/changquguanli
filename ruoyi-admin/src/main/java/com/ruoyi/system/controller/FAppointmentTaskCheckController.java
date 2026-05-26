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
import com.ruoyi.system.domain.FAppointmentTaskCheck;
import com.ruoyi.system.service.IFAppointmentTaskCheckService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 预约任务-检查Controller
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/check")
public class FAppointmentTaskCheckController extends BaseController
{
    @Autowired
    private IFAppointmentTaskCheckService fAppointmentTaskCheckService;

    /**
     * 查询预约任务-检查列表
     */
    @PreAuthorize("@ss.hasPermi('system:check:list')")
    @GetMapping("/list")
    public TableDataInfo list(FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        startPage();
        List<FAppointmentTaskCheck> list = fAppointmentTaskCheckService.selectFAppointmentTaskCheckList(fAppointmentTaskCheck);
        return getDataTable(list);
    }

    /**
     * 导出预约任务-检查列表
     */
    @PreAuthorize("@ss.hasPermi('system:check:export')")
    @Log(title = "预约任务-检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        List<FAppointmentTaskCheck> list = fAppointmentTaskCheckService.selectFAppointmentTaskCheckList(fAppointmentTaskCheck);
        ExcelUtil<FAppointmentTaskCheck> util = new ExcelUtil<FAppointmentTaskCheck>(FAppointmentTaskCheck.class);
        util.exportExcel(response, list, "预约任务-检查数据");
    }

    /**
     * 获取预约任务-检查详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:check:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fAppointmentTaskCheckService.selectFAppointmentTaskCheckById(id));
    }

    /**
     * 新增预约任务-检查
     */
    @PreAuthorize("@ss.hasPermi('system:check:add')")
    @Log(title = "预约任务-检查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        return toAjax(fAppointmentTaskCheckService.insertFAppointmentTaskCheck(fAppointmentTaskCheck));
    }

    /**
     * 修改预约任务-检查
     */
    @PreAuthorize("@ss.hasPermi('system:check:edit')")
    @Log(title = "预约任务-检查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FAppointmentTaskCheck fAppointmentTaskCheck)
    {
        return toAjax(fAppointmentTaskCheckService.updateFAppointmentTaskCheck(fAppointmentTaskCheck));
    }

    /**
     * 删除预约任务-检查
     */
    @PreAuthorize("@ss.hasPermi('system:check:remove')")
    @Log(title = "预约任务-检查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fAppointmentTaskCheckService.deleteFAppointmentTaskCheckByIds(ids));
    }
}
