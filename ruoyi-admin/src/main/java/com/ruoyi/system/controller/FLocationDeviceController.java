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
import com.ruoyi.system.domain.FLocationDevice;
import com.ruoyi.system.service.IFLocationDeviceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 定位设备管理Controller
 *
 * @author ruoyi
 * @date 2026-05-29
 */
@RestController

@RequestMapping("/system/location")
public class FLocationDeviceController extends BaseController
{
    @Autowired
    private IFLocationDeviceService fLocationDeviceService;

    /**
     * 查询定位设备列表
     */
    @PreAuthorize("@ss.hasPermi('system:location:list')")
    @GetMapping("/list")
    public TableDataInfo list(FLocationDevice fLocationDevice)
    {
        startPage();
        List<FLocationDevice> list = fLocationDeviceService.selectFLocationDeviceList(fLocationDevice);
        return getDataTable(list);
    }

    /**
     * 导出定位设备列表
     */
    @PreAuthorize("@ss.hasPermi('system:location:export')")
    @Log(title = "定位设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FLocationDevice fLocationDevice)
    {
        List<FLocationDevice> list = fLocationDeviceService.selectFLocationDeviceList(fLocationDevice);
        ExcelUtil<FLocationDevice> util = new ExcelUtil<FLocationDevice>(FLocationDevice.class);
        util.exportExcel(response, list, "定位设备数据");
    }

    /**
     * 获取定位设备详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:location:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fLocationDeviceService.selectFLocationDeviceById(id));
    }

    /**
     * 新增定位设备
     */
    @PreAuthorize("@ss.hasPermi('system:location:add')")
    @Log(title = "定位设备", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FLocationDevice fLocationDevice)
    {
        return toAjax(fLocationDeviceService.insertFLocationDevice(fLocationDevice));
    }

    /**
     * 修改定位设备
     */
    @PreAuthorize("@ss.hasPermi('system:location:edit')")
    @Log(title = "定位设备", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FLocationDevice fLocationDevice)
    {
        return toAjax(fLocationDeviceService.updateFLocationDevice(fLocationDevice));
    }

    /**
     * 删除定位设备
     */
    @PreAuthorize("@ss.hasPermi('system:location:remove')")
    @Log(title = "定位设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fLocationDeviceService.deleteFLocationDeviceByIds(ids));
    }

    /**
     * 获取可用定位设备列表（启用、空闲、未删除，支持按设备序列号模糊查询）
     */
    @PreAuthorize("@ss.hasPermi('system:location:list')")
    @GetMapping("/availableDevices")
    public AjaxResult availableDevices(FLocationDevice query)
    {
        return AjaxResult.success(fLocationDeviceService.selectAvailableDevices(query));
    }
}
