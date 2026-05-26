package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FDockParkingSpace;

/**
 * 码头等待停车位明细Service接口
 * 
 * @author ruoyi
 * @date 2026-05-26
 */
public interface IFDockParkingSpaceService 
{
    /**
     * 查询码头等待停车位明细
     * 
     * @param id 码头等待停车位明细主键
     * @return 码头等待停车位明细
     */
    public FDockParkingSpace selectFDockParkingSpaceById(Long id);

    /**
     * 查询码头等待停车位明细列表
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 码头等待停车位明细集合
     */
    public List<FDockParkingSpace> selectFDockParkingSpaceList(FDockParkingSpace fDockParkingSpace);

    /**
     * 新增码头等待停车位明细
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 结果
     */
    public int insertFDockParkingSpace(FDockParkingSpace fDockParkingSpace);

    /**
     * 修改码头等待停车位明细
     * 
     * @param fDockParkingSpace 码头等待停车位明细
     * @return 结果
     */
    public int updateFDockParkingSpace(FDockParkingSpace fDockParkingSpace);

    /**
     * 批量删除码头等待停车位明细
     * 
     * @param ids 需要删除的码头等待停车位明细主键集合
     * @return 结果
     */
    public int deleteFDockParkingSpaceByIds(Long[] ids);

    /**
     * 删除码头等待停车位明细信息
     * 
     * @param id 码头等待停车位明细主键
     * @return 结果
     */
    public int deleteFDockParkingSpaceById(Long id);
}
