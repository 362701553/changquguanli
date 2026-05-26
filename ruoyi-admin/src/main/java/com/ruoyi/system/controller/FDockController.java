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
import com.ruoyi.system.domain.FDockLoadingPoint;
import com.ruoyi.system.domain.FDockParkingSpace;
import com.ruoyi.system.service.IFDockService;
import com.ruoyi.system.service.IFDockLoadingPointService;
import com.ruoyi.system.service.IFDockParkingSpaceService;
import com.ruoyi.system.mapper.FDockLoadingPointMapper;
import com.ruoyi.system.mapper.FDockParkingSpaceMapper;
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

    @Autowired
    private IFDockLoadingPointService fDockLoadingPointService;

    @Autowired
    private IFDockParkingSpaceService fDockParkingSpaceService;

    @Autowired
    private FDockLoadingPointMapper fDockLoadingPointMapper;

    @Autowired
    private FDockParkingSpaceMapper fDockParkingSpaceMapper;

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
     * 获取码头主详细信息（含装卸点和停车位明细）
     */
    @PreAuthorize("@ss.hasPermi('system:dock:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        FDock fDock = fDockService.selectFDockById(id);
        // 查询装卸点明细
        FDockLoadingPoint pointQuery = new FDockLoadingPoint();
        pointQuery.setDockId(id);
        fDock.setLoadingPointList(fDockLoadingPointService.selectFDockLoadingPointList(pointQuery));
        // 查询停车位明细
        FDockParkingSpace spaceQuery = new FDockParkingSpace();
        spaceQuery.setDockId(id);
        fDock.setParkingSpaceList(fDockParkingSpaceService.selectFDockParkingSpaceList(spaceQuery));
        return AjaxResult.success(fDock);
    }

    /**
     * 新增码头主（含装卸点和停车位明细）
     */
    @PreAuthorize("@ss.hasPermi('system:dock:add')")
    @Log(title = "码头主", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FDock fDock)
    {
        int rows = fDockService.insertFDock(fDock);
        // 保存装卸点明细
        if (fDock.getLoadingPointList() != null)
        {
            for (FDockLoadingPoint point : fDock.getLoadingPointList())
            {
                point.setDockId(fDock.getId());
                fDockLoadingPointService.insertFDockLoadingPoint(point);
            }
        }
        // 保存停车位明细
        if (fDock.getParkingSpaceList() != null)
        {
            for (FDockParkingSpace space : fDock.getParkingSpaceList())
            {
                space.setDockId(fDock.getId());
                fDockParkingSpaceService.insertFDockParkingSpace(space);
            }
        }
        return toAjax(rows);
    }

    /**
     * 修改码头主（含装卸点和停车位明细）
     */
    @PreAuthorize("@ss.hasPermi('system:dock:edit')")
    @Log(title = "码头主", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FDock fDock)
    {
        // 先删除原有子表数据
        fDockLoadingPointMapper.deleteFDockLoadingPointByDockId(fDock.getId());
        fDockParkingSpaceMapper.deleteFDockParkingSpaceByDockId(fDock.getId());
        // 重新插入装卸点明细
        if (fDock.getLoadingPointList() != null)
        {
            for (FDockLoadingPoint point : fDock.getLoadingPointList())
            {
                point.setDockId(fDock.getId());
                fDockLoadingPointService.insertFDockLoadingPoint(point);
            }
        }
        // 重新插入停车位明细
        if (fDock.getParkingSpaceList() != null)
        {
            for (FDockParkingSpace space : fDock.getParkingSpaceList())
            {
                space.setDockId(fDock.getId());
                fDockParkingSpaceService.insertFDockParkingSpace(space);
            }
        }
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
