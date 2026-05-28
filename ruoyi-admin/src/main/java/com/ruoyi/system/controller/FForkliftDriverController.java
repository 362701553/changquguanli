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
import com.ruoyi.system.domain.FForkliftDriver;
import com.ruoyi.system.service.IFForkliftDriverService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 叉车-司机关联Controller
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@RestController
@RequestMapping("/system/driver")
public class FForkliftDriverController extends BaseController
{
    @Autowired
    private IFForkliftDriverService fForkliftDriverService;

    /**
     * 查询叉车-司机关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:driver:list')")
    @GetMapping("/list")
    public TableDataInfo list(FForkliftDriver fForkliftDriver)
    {
        startPage();
        List<FForkliftDriver> list = fForkliftDriverService.selectFForkliftDriverList(fForkliftDriver);
        return getDataTable(list);
    }

    /**
     * 导出叉车-司机关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:driver:export')")
    @Log(title = "叉车-司机关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FForkliftDriver fForkliftDriver)
    {
        List<FForkliftDriver> list = fForkliftDriverService.selectFForkliftDriverList(fForkliftDriver);
        ExcelUtil<FForkliftDriver> util = new ExcelUtil<FForkliftDriver>(FForkliftDriver.class);
        util.exportExcel(response, list, "叉车-司机关联数据");
    }

    /**
     * 获取叉车-司机关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:driver:query')")
    @GetMapping(value = "/{myRowId}")
    public AjaxResult getInfo(@PathVariable("myRowId") String myRowId)
    {
        return AjaxResult.success(fForkliftDriverService.selectFForkliftDriverByMyRowId(myRowId));
    }

    /**
     * 新增叉车-司机关联
     */
    @PreAuthorize("@ss.hasPermi('system:driver:add')")
    @Log(title = "叉车-司机关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FForkliftDriver fForkliftDriver)
    {
        return toAjax(fForkliftDriverService.insertFForkliftDriver(fForkliftDriver));
    }

    /**
     * 修改叉车-司机关联
     */
    @PreAuthorize("@ss.hasPermi('system:driver:edit')")
    @Log(title = "叉车-司机关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FForkliftDriver fForkliftDriver)
    {
        return toAjax(fForkliftDriverService.updateFForkliftDriver(fForkliftDriver));
    }

    /**
     * 删除叉车-司机关联
     */
    @PreAuthorize("@ss.hasPermi('system:driver:remove')")
    @Log(title = "叉车-司机关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{myRowIds}")
    public AjaxResult remove(@PathVariable String[] myRowIds)
    {
        return toAjax(fForkliftDriverService.deleteFForkliftDriverByMyRowIds(myRowIds));
    }
}
