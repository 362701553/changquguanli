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
import com.ruoyi.system.domain.FForklift;
import com.ruoyi.system.service.IFForkliftService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 叉车主Controller
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@RestController
@RequestMapping("/system/forklift")
public class FForkliftController extends BaseController
{
    @Autowired
    private IFForkliftService fForkliftService;

    /**
     * 查询叉车主列表
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:list')")
    @GetMapping("/list")
    public TableDataInfo list(FForklift fForklift)
    {
        startPage();
        List<FForklift> list = fForkliftService.selectFForkliftList(fForklift);
        return getDataTable(list);
    }

    /**
     * 查询所有叉车（下拉选项用）
     */
    @GetMapping("/listAll")
    public AjaxResult listAll(FForklift fForklift)
    {
        List<FForklift> list = fForkliftService.selectFForkliftList(fForklift);
        return AjaxResult.success(list);
    }

    /**
     * 导出叉车主列表
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:export')")
    @Log(title = "叉车主", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FForklift fForklift)
    {
        List<FForklift> list = fForkliftService.selectFForkliftList(fForklift);
        ExcelUtil<FForklift> util = new ExcelUtil<FForklift>(FForklift.class);
        util.exportExcel(response, list, "叉车主数据");
    }

    /**
     * 获取叉车主详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fForkliftService.selectFForkliftById(id));
    }

    /**
     * 新增叉车主
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:add')")
    @Log(title = "叉车主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FForklift fForklift)
    {
        return toAjax(fForkliftService.insertFForklift(fForklift));
    }

    /**
     * 修改叉车主
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:edit')")
    @Log(title = "叉车主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FForklift fForklift)
    {
        return toAjax(fForkliftService.updateFForklift(fForklift));
    }

    /**
     * 删除叉车主
     */
    @PreAuthorize("@ss.hasPermi('system:forklift:remove')")
    @Log(title = "叉车主", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fForkliftService.deleteFForkliftByIds(ids));
    }
}
