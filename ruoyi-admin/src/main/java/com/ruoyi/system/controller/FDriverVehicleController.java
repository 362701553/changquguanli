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
import com.ruoyi.system.domain.FDriverVehicle;
import com.ruoyi.system.service.IFDriverVehicleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车辆司机主Controller
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/vehicle")
public class FDriverVehicleController extends BaseController
{
    @Autowired
    private IFDriverVehicleService fDriverVehicleService;

    /**
     * 查询车辆司机主列表
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:list')")
    @GetMapping("/list")
    public TableDataInfo list(FDriverVehicle fDriverVehicle)
    {
        startPage();
        List<FDriverVehicle> list = fDriverVehicleService.selectFDriverVehicleList(fDriverVehicle);
        return getDataTable(list);
    }

    /**
     * 导出车辆司机主列表
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:export')")
    @Log(title = "车辆司机主", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FDriverVehicle fDriverVehicle)
    {
        List<FDriverVehicle> list = fDriverVehicleService.selectFDriverVehicleList(fDriverVehicle);
        ExcelUtil<FDriverVehicle> util = new ExcelUtil<FDriverVehicle>(FDriverVehicle.class);
        util.exportExcel(response, list, "车辆司机主数据");
    }

    /**
     * 获取车辆司机主详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fDriverVehicleService.selectFDriverVehicleById(id));
    }

    /**
     * 新增车辆司机主
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:add')")
    @Log(title = "车辆司机主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FDriverVehicle fDriverVehicle)
    {
        return toAjax(fDriverVehicleService.insertFDriverVehicle(fDriverVehicle));
    }

    /**
     * 修改车辆司机主
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:edit')")
    @Log(title = "车辆司机主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FDriverVehicle fDriverVehicle)
    {
        return toAjax(fDriverVehicleService.updateFDriverVehicle(fDriverVehicle));
    }

    /**
     * 删除车辆司机主
     */
    @PreAuthorize("@ss.hasPermi('system:vehicle:remove')")
    @Log(title = "车辆司机主", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fDriverVehicleService.deleteFDriverVehicleByIds(ids));
    }
}
