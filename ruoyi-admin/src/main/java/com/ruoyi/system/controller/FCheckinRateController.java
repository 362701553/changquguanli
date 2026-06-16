package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.mapper.FCheckinRateMapper;

/**
 * 签到及时率报表Controller
 *
 * @author ruoyi
 * @date 2026-06-03
 */
@RestController
@RequestMapping("/system/checkinRate")
public class FCheckinRateController extends BaseController
{
    @Autowired
    private FCheckinRateMapper fCheckinRateMapper;

    /**
     * 查询签到及时率统计列表（按司机分组）
     */
    @GetMapping("/list")
    public TableDataInfo list(@RequestParam(required = false) String appointmentDate,
                             @RequestParam(required = false) String driverName)
    {
        startPage();
        List<Map<String, Object>> list = fCheckinRateMapper.selectCheckinRateList(appointmentDate, driverName);
        return getDataTable(list);
    }

    /**
     * 查询签到及时率明细列表
     */
    @GetMapping("/detail")
    public TableDataInfo detail(@RequestParam(required = false) String appointmentDate,
                               @RequestParam(required = false) String driverName,
                               @RequestParam(required = false) String type)
    {
        startPage();
        List<Map<String, Object>> list = fCheckinRateMapper.selectCheckinRateDetail(appointmentDate, driverName, type);
        return getDataTable(list);
    }
}
