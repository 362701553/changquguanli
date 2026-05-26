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
import com.ruoyi.system.domain.FDock;
import com.ruoyi.system.service.IFDockService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 码头主Controller
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/dock")
public class FDockController extends BaseController
{
    @Autowired
    private IFDockService fDockService;

    /**
     * 查询码头主列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:list')")
    @GetMapping("/list")
    public TableDataInfo list(FDock fDock)
    {
        startPage();
        List<FDock> list = fDockService.selectFDockList(fDock);
        return getDataTable(list);
    }

    /**
     * 导出码头主列表
     */
    @PreAuthorize("@ss.hasPermi('system:dock:export')")
    @Log(title = "码头主", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FDock fDock)
    {
        List<FDock> list = fDockService.selectFDockList(fDock);
        ExcelUtil<FDock> util = new ExcelUtil<FDock>(FDock.class);
        util.exportExcel(response, list, "码头主数据");
    }

    /**
     * 获取码头主详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:dock:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fDockService.selectFDockById(id));
    }

    /**
     * 新增码头主
     */
    @PreAuthorize("@ss.hasPermi('system:dock:add')")
    @Log(title = "码头主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FDock fDock)
    {
        return toAjax(fDockService.insertFDock(fDock));
    }

    /**
     * 修改码头主
     */
    @PreAuthorize("@ss.hasPermi('system:dock:edit')")
    @Log(title = "码头主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FDock fDock)
    {
        return toAjax(fDockService.updateFDock(fDock));
    }

    /**
     * 删除码头主
     */
    @PreAuthorize("@ss.hasPermi('system:dock:remove')")
    @Log(title = "码头主", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fDockService.deleteFDockByIds(ids));
    }
}
