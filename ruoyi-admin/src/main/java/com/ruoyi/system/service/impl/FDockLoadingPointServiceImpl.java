package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FDockLoadingPointMapper;
import com.ruoyi.system.domain.FDockLoadingPoint;
import com.ruoyi.system.service.IFDockLoadingPointService;

/**
 * 码头装卸点明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
@Service
public class FDockLoadingPointServiceImpl implements IFDockLoadingPointService 
{
    @Autowired
    private FDockLoadingPointMapper fDockLoadingPointMapper;

    /**
     * 查询码头装卸点明细
     * 
     * @param id 码头装卸点明细主键
     * @return 码头装卸点明细
     */
    @Override
    public FDockLoadingPoint selectFDockLoadingPointById(Long id)
    {
        return fDockLoadingPointMapper.selectFDockLoadingPointById(id);
    }

    /**
     * 查询码头装卸点明细列表
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 码头装卸点明细
     */
    @Override
    public List<FDockLoadingPoint> selectFDockLoadingPointList(FDockLoadingPoint fDockLoadingPoint)
    {
        return fDockLoadingPointMapper.selectFDockLoadingPointList(fDockLoadingPoint);
    }

    /**
     * 新增码头装卸点明细
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 结果
     */
    @Override
    public int insertFDockLoadingPoint(FDockLoadingPoint fDockLoadingPoint)
    {
        return fDockLoadingPointMapper.insertFDockLoadingPoint(fDockLoadingPoint);
    }

    /**
     * 修改码头装卸点明细
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 结果
     */
    @Override
    public int updateFDockLoadingPoint(FDockLoadingPoint fDockLoadingPoint)
    {
        return fDockLoadingPointMapper.updateFDockLoadingPoint(fDockLoadingPoint);
    }

    /**
     * 批量删除码头装卸点明细
     * 
     * @param ids 需要删除的码头装卸点明细主键
     * @return 结果
     */
    @Override
    public int deleteFDockLoadingPointByIds(Long[] ids)
    {
        return fDockLoadingPointMapper.deleteFDockLoadingPointByIds(ids);
    }

    /**
     * 删除码头装卸点明细信息
     * 
     * @param id 码头装卸点明细主键
     * @return 结果
     */
    @Override
    public int deleteFDockLoadingPointById(Long id)
    {
        return fDockLoadingPointMapper.deleteFDockLoadingPointById(id);
    }
}
