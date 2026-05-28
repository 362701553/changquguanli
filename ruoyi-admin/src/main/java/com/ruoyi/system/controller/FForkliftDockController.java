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
import com.ruoyi.system.domain.FForkliftDock;
import com.ruoyi.system.service.IFForkliftDockService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 叉车-码头关联Controller
 *
 * @author ruoyi
 * @date 2026-05-28
 */
@RestController
@RequestMapping("/system/forkliftDock")
public class FForkliftDockController extends BaseController
{
    @Autowired
    private IFForkliftDockService fForkliftDockService;

    /**
     * 查询叉车-码头关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:list')")
    @GetMapping("/list")
    public TableDataInfo list(FForkliftDock fForkliftDock)
    {
        startPage();
        List<FForkliftDock> list = fForkliftDockService.selectFForkliftDockList(fForkliftDock);
        return getDataTable(list);
    }

    /**
     * 导出叉车-码头关联列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:export')")
    @Log(title = "叉车-码头关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FForkliftDock fForkliftDock)
    {
        List<FForkliftDock> list = fForkliftDockService.selectFForkliftDockList(fForkliftDock);
        ExcelUtil<FForkliftDock> util = new ExcelUtil<FForkliftDock>(FForkliftDock.class);
        util.exportExcel(response, list, "叉车-码头关联数据");
    }

    /**
     * 获取叉车-码头关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:dock:query')")
    @GetMapping(value = "/{myRowId}")
    public AjaxResult getInfo(@PathVariable("myRowId") String myRowId)
    {
        return AjaxResult.success(fForkliftDockService.selectFForkliftDockByMyRowId(myRowId));
    }

    /**
     * 新增叉车-码头关联
     */
    @PreAuthorize("@ss.hasPermi('system:dock:add')")
    @Log(title = "叉车-码头关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FForkliftDock fForkliftDock)
    {
        return toAjax(fForkliftDockService.insertFForkliftDock(fForkliftDock));
    }

    /**
     * 修改叉车-码头关联
     */
    @PreAuthorize("@ss.hasPermi('system:dock:edit')")
    @Log(title = "叉车-码头关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FForkliftDock fForkliftDock)
    {
        return toAjax(fForkliftDockService.updateFForkliftDock(fForkliftDock));
    }

    /**
     * 删除叉车-码头关联
     */
    @PreAuthorize("@ss.hasPermi('system:dock:remove')")
    @Log(title = "叉车-码头关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{myRowIds}")
    public AjaxResult remove(@PathVariable String[] myRowIds)
    {
        return toAjax(fForkliftDockService.deleteFForkliftDockByMyRowIds(myRowIds));
    }
}
