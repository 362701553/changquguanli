package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FDriverVehicle;

/**
 * 车辆司机主Service接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface IFDriverVehicleService 
{
    /**
     * 查询车辆司机主
     * 
     * @param id 车辆司机主主键
     * @return 车辆司机主
     */
    public FDriverVehicle selectFDriverVehicleById(Long id);

    /**
     * 查询车辆司机主列表
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 车辆司机主集合
     */
    public List<FDriverVehicle> selectFDriverVehicleList(FDriverVehicle fDriverVehicle);

    /**
     * 新增车辆司机主
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    public int insertFDriverVehicle(FDriverVehicle fDriverVehicle);

    /**
     * 修改车辆司机主
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    public int updateFDriverVehicle(FDriverVehicle fDriverVehicle);

    /**
     * 批量删除车辆司机主
     * 
     * @param ids 需要删除的车辆司机主主键集合
     * @return 结果
     */
    public int deleteFDriverVehicleByIds(Long[] ids);

    /**
     * 删除车辆司机主信息
     * 
     * @param id 车辆司机主主键
     * @return 结果
     */
    public int deleteFDriverVehicleById(Long id);
}
