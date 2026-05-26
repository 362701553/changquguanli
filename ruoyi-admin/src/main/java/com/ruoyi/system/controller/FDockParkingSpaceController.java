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
import com.ruoyi.system.domain.FDockParkingSpace;
import com.ruoyi.system.service.IFDockParkingSpaceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 码头等待停车位明细Controller
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@RestController
@RequestMapping("/system/space")
public class FDockParkingSpaceController extends BaseController
{
    @Autowired
    private IFDockParkingSpaceService fDockParkingSpaceService;

    /**
     * 查询码头等待停车位明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:space:list')")
    @GetMapping("/list")
    public TableDataInfo list(FDockParkingSpace fDockParkingSpace)
    {
        startPage();
        List<FDockParkingSpace> list = fDockParkingSpaceService.selectFDockParkingSpaceList(fDockParkingSpace);
        return getDataTable(list);
    }

    /**
     * 导出码头等待停车位明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:space:export')")
    @Log(title = "码头等待停车位明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FDockParkingSpace fDockParkingSpace)
    {
        List<FDockParkingSpace> list = fDockParkingSpaceService.selectFDockParkingSpaceList(fDockParkingSpace);
        ExcelUtil<FDockParkingSpace> util = new ExcelUtil<FDockParkingSpace>(FDockParkingSpace.class);
        util.exportExcel(response, list, "码头等待停车位明细数据");
    }

    /**
     * 获取码头等待停车位明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:space:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(fDockParkingSpaceService.selectFDockParkingSpaceById(id));
    }

    /**
     * 新增码头等待停车位明细
     */
    @PreAuthorize("@ss.hasPermi('system:space:add')")
    @Log(title = "码头等待停车位明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FDockParkingSpace fDockParkingSpace)
    {
        return toAjax(fDockParkingSpaceService.insertFDockParkingSpace(fDockParkingSpace));
    }

    /**
     * 修改码头等待停车位明细
     */
    @PreAuthorize("@ss.hasPermi('system:space:edit')")
    @Log(title = "码头等待停车位明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FDockParkingSpace fDockParkingSpace)
    {
        return toAjax(fDockParkingSpaceService.updateFDockParkingSpace(fDockParkingSpace));
    }

    /**
     * 删除码头等待停车位明细
     */
    @PreAuthorize("@ss.hasPermi('system:space:remove')")
    @Log(title = "码头等待停车位明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fDockParkingSpaceService.deleteFDockParkingSpaceByIds(ids));
    }
}
