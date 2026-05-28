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
import com.ruoyi.system.domain.FForkliftDriverBase;
import com.ruoyi.system.service.IFForkliftDriverBaseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 叉车司机信息Controller
 * 
 * @author ruoyi
 * @date 2026-05-28
 */
@RestController
@RequestMapping("/system/base")
public class FForkliftDriverBaseController extends BaseController
{
    @Autowired
    private IFForkliftDriverBaseService fForkliftDriverBaseService;

    /**
     * 查询叉车司机信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:base:list')")
    @GetMapping("/list")
    public TableDataInfo list(FForkliftDriverBase fForkliftDriverBase)
    {
        startPage();
        List<FForkliftDriverBase> list = fForkliftDriverBaseService.selectFForkliftDriverBaseList(fForkliftDriverBase);
        return getDataTable(list);
    }

    /**
     * 导出叉车司机信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:base:export')")
    @Log(title = "叉车司机信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FForkliftDriverBase fForkliftDriverBase)
    {
        List<FForkliftDriverBase> list = fForkliftDriverBaseService.selectFForkliftDriverBaseList(fForkliftDriverBase);
        ExcelUtil<FForkliftDriverBase> util = new ExcelUtil<FForkliftDriverBase>(FForkliftDriverBase.class);
        util.exportExcel(response, list, "叉车司机信息数据");
    }

    /**
     * 获取叉车司机信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:base:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fForkliftDriverBaseService.selectFForkliftDriverBaseById(id));
    }

    /**
     * 新增叉车司机信息
     */
    @PreAuthorize("@ss.hasPermi('system:base:add')")
    @Log(title = "叉车司机信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FForkliftDriverBase fForkliftDriverBase)
    {
        return toAjax(fForkliftDriverBaseService.insertFForkliftDriverBase(fForkliftDriverBase));
    }

    /**
     * 修改叉车司机信息
     */
    @PreAuthorize("@ss.hasPermi('system:base:edit')")
    @Log(title = "叉车司机信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FForkliftDriverBase fForkliftDriverBase)
    {
        return toAjax(fForkliftDriverBaseService.updateFForkliftDriverBase(fForkliftDriverBase));
    }

    /**
     * 删除叉车司机信息
     */
    @PreAuthorize("@ss.hasPermi('system:base:remove')")
    @Log(title = "叉车司机信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fForkliftDriverBaseService.deleteFForkliftDriverBaseByIds(ids));
    }
}
