package com.ruoyi.system.controller;

import java.util.List;
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
import com.ruoyi.system.domain.FElectronicFence;
import com.ruoyi.system.service.IFElectronicFenceService;
import com.ruoyi.common.core.page.TableDataInfo;

@RestController
@RequestMapping("/system/electronic")
public class FElectronicFenceController extends BaseController
{
    @Autowired
    private IFElectronicFenceService fElectronicFenceService;

    @PreAuthorize("@ss.hasPermi('system:electronic:list')")
    @GetMapping("/list")
    public TableDataInfo list(FElectronicFence fElectronicFence)
    {
        startPage();
        List<FElectronicFence> list = fElectronicFenceService.selectFElectronicFenceList(fElectronicFence);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('system:electronic:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fElectronicFenceService.selectFElectronicFenceById(id));
    }

    @PreAuthorize("@ss.hasPermi('system:electronic:add')")
    @Log(title = "电子围栏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FElectronicFence fElectronicFence)
    {
        return fElectronicFenceService.insertFElectronicFence(fElectronicFence);
    }

    @PreAuthorize("@ss.hasPermi('system:electronic:edit')")
    @Log(title = "电子围栏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FElectronicFence fElectronicFence)
    {
        return fElectronicFenceService.updateFElectronicFence(fElectronicFence);
    }

    @PreAuthorize("@ss.hasPermi('system:electronic:remove')")
    @Log(title = "电子围栏", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fElectronicFenceService.deleteFElectronicFenceByIds(ids));
    }
}
