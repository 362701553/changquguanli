package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FDockLoadingPoint;

/**
 * 码头装卸点明细Service接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface IFDockLoadingPointService 
{
    /**
     * 查询码头装卸点明细
     * 
     * @param id 码头装卸点明细主键
     * @return 码头装卸点明细
     */
    public FDockLoadingPoint selectFDockLoadingPointById(Long id);

    /**
     * 查询码头装卸点明细列表
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 码头装卸点明细集合
     */
    public List<FDockLoadingPoint> selectFDockLoadingPointList(FDockLoadingPoint fDockLoadingPoint);

    /**
     * 新增码头装卸点明细
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 结果
     */
    public int insertFDockLoadingPoint(FDockLoadingPoint fDockLoadingPoint);

    /**
     * 修改码头装卸点明细
     * 
     * @param fDockLoadingPoint 码头装卸点明细
     * @return 结果
     */
    public int updateFDockLoadingPoint(FDockLoadingPoint fDockLoadingPoint);

    /**
     * 批量删除码头装卸点明细
     * 
     * @param ids 需要删除的码头装卸点明细主键集合
     * @return 结果
     */
    public int deleteFDockLoadingPointByIds(Long[] ids);

    /**
     * 删除码头装卸点明细信息
     * 
     * @param id 码头装卸点明细主键
     * @return 结果
     */
    public int deleteFDockLoadingPointById(Long id);
}
