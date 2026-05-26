package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FDriverVehicleMapper;
import com.ruoyi.system.domain.FDriverVehicle;
import com.ruoyi.system.service.IFDriverVehicleService;

/**
 * 车辆司机主Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FDriverVehicleServiceImpl implements IFDriverVehicleService 
{
    @Autowired
    private FDriverVehicleMapper fDriverVehicleMapper;

    /**
     * 查询车辆司机主
     * 
     * @param id 车辆司机主主键
     * @return 车辆司机主
     */
    @Override
    public FDriverVehicle selectFDriverVehicleById(Long id)
    {
        return fDriverVehicleMapper.selectFDriverVehicleById(id);
    }

    /**
     * 查询车辆司机主列表
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 车辆司机主
     */
    @Override
    public List<FDriverVehicle> selectFDriverVehicleList(FDriverVehicle fDriverVehicle)
    {
        return fDriverVehicleMapper.selectFDriverVehicleList(fDriverVehicle);
    }

    /**
     * 新增车辆司机主
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    @Override
    public int insertFDriverVehicle(FDriverVehicle fDriverVehicle)
    {
        fDriverVehicle.setCreateTime(DateUtils.getNowDate());
        return fDriverVehicleMapper.insertFDriverVehicle(fDriverVehicle);
    }

    /**
     * 修改车辆司机主
     * 
     * @param fDriverVehicle 车辆司机主
     * @return 结果
     */
    @Override
    public int updateFDriverVehicle(FDriverVehicle fDriverVehicle)
    {
        fDriverVehicle.setUpdateTime(DateUtils.getNowDate());
        return fDriverVehicleMapper.updateFDriverVehicle(fDriverVehicle);
    }

    /**
     * 批量删除车辆司机主
     * 
     * @param ids 需要删除的车辆司机主主键
     * @return 结果
     */
    @Override
    public int deleteFDriverVehicleByIds(Long[] ids)
    {
        return fDriverVehicleMapper.deleteFDriverVehicleByIds(ids);
    }

    /**
     * 删除车辆司机主信息
     * 
     * @param id 车辆司机主主键
     * @return 结果
     */
    @Override
    public int deleteFDriverVehicleById(Long id)
    {
        return fDriverVehicleMapper.deleteFDriverVehicleById(id);
    }
}
