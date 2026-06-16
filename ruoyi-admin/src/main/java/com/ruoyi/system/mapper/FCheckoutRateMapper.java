package com.ruoyi.system.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

/**
 * 签出及时率报表Mapper接口
 *
 * @author ruoyi
 * @date 2026-06-04
 */
public interface FCheckoutRateMapper
{
    /**
     * 查询签出及时率统计列表（按司机分组）
     */
    List<Map<String, Object>> selectCheckoutRateList(@Param("appointmentDate") String appointmentDate,
                                                    @Param("driverName") String driverName);

    /**
     * 查询签出及时率明细列表
     */
    List<Map<String, Object>> selectCheckoutRateDetail(@Param("appointmentDate") String appointmentDate,
                                                      @Param("driverName") String driverName,
                                                      @Param("type") String type);
}
